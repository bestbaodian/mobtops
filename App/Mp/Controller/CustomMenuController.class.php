<?php 

namespace Mp\Controller;
use Mp\Controller\BaseController;

/**
 * 自定义菜单控制器
 * @author 魔派<180256122@qq.com>
 */
class CustomMenuController extends BaseController {
        //初始化
	public function _initialize() {
		parent::_initialize();
		if ($this->user_access['admin']) {
			  $topmenu[] = array(
			'title' => '管理控制台',
			'url' => U('Admin/Index/index'),
			'class' => ''
		);
		}
        $topmenu[] = array(
			'title' => '公众号管理',
			'url' => U('Mp/Mp/lists'),
			'class' => ''
		);
        $this->assign('topmenu', $topmenu);
		$uid = session('user_id');
		$user_info = M('user')->find($uid);
		$user_id=$user_info['id'];
		$role_data = M('rbac_role_user')->where("user_id=$user_id")->select();
		$role=$role_data[0]['role_id'];
		if($role==2){
			add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');				// 添加生成侧边栏导航的钩子
			add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
			$sidenav = hook('sidenav');
			if(empty($sidenav)){
				$sidenav = $this->meau();
			}
		}elseif($role==1){
			add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');				// 添加生成侧边栏导航的钩子
			add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
			$sidenav = hook('sidenav');
			if(empty($sidenav)){
				$sidenav = $this->meau();
			}
		}else{
			$where['username']=$_SESSION['username'];
			$datas=M('user')->where($where)->select();
			$wheres['name']=$datas[0]['application'];
			$wheres['is_show']=1;
			$arr=M('mp_rbac_node')->where($wheres)->select();
			$sidenav  = array(
				array(
					'title' => '基本设置',
					'url' => 'javascript:;',
					'class' => 'icon icon-setting',
					'attr' => 'data="icon"',
					'children' => array(
						array(
							'title' => '自动回复',
							'url' => U('AutoReply/keyword'),
						),
						array(
							'title' => '自定义菜单',
							'url' => U('CustomMenu/publish'),
						),
						array(
							'title' => '场景二维码',
							'url' => U('SceneQrcode/lists'),
						),
						array(
							'title' => '粉丝管理',
							'url' => U('Fans/lists'),
						),
						array(
							'title' => '消息管理',
							'url' => U('Message/lists'),
						),
						array(
							'title' => '素材管理',
							'url' => U('Material/text'),
						),
						array(
							'title' => '微信支付',
							'url' => U('Payment/wechat'),
						)
					),
				),
				array(
					'title' => '行业应用',
					'url' => 'javascript:;',
					'class' => 'icon icon-setting',
					'attr' => 'data="icon"',
					'children' => array(
						array(
							'title' => $arr[0]['name'],
							'url'   => 'index.php?s='.$arr[0]['folder'].'/'.$arr[0]['url'],
						),
					)
				)
			);
			$this->assign('sidenav', $sidenav);
		}
	}
	/**
	 * 菜单列表
	 * @author 魔派<180256122@qq.com>
	 */
	public function lists() {
		$this->addCrumb('公众号管理', U('Mp/CustomMenu/lists'), '')
			 ->addCrumb('自定义菜单', U('Mp/CustomMenu/lists'), '')
			 ->addCrumb('菜单列表', '', 'active')
			 ->addNav('菜单列表', '', 'active')
			 ->addButton('添加自定义菜单', U('Mp/CustomMenu/add'), 'btn btn-primary')
			 ->common_lists();
	}
            
	/**
	 * 发布菜单
	 * @author 魔派<180256122@qq.com>
	 */
	public function publish() {
		$menu = get_menu();
		$this->addButton('重新编辑菜单', U('Mp/CustomMenu/add'), 'btn btn-primary edit_menu')
			 ->addButton('拉取菜单', U('Mp/CustomMenu/add'), 'btn btn-success pull_menu')
			 ->addButton('删除菜单', U('Mp/CustomMenu/add'), 'btn btn-danger delete_menu')
			 ->setTip('由于微信端缓存的原因，发布的菜单不会立马在微信端生效，可以尝试重新关注关注查看效果')
			 ->addNav('发布菜单', '', 'active')
			 ->assign('menu', $menu['menu'])
			 ->display();
	}

	public function get_menu() {
		$flag = 'custom_menu_'.get_mpid();
		if (S($flag)) {
			$menu = S($flag);
		} else {
			$menu = get_menu();
			S($flag, $menu, 3600);
		}
		$return['errcode'] = 0;
		$return['errmsg'] = '获取菜单成功';
		$return['data'] = $menu['menu'];
		$this->ajaxReturn($return);
	}
        
        /*
         * 获取当前菜单  @测试
         */
        public function get_menus(){
            $flag = 'custom_menu_'.get_mpid();
		if (S($flag)) {
			$menu = S($flag);
		} else {
			$menu = get_menu();
			S($flag, $menu, 3600);
		}
		$return['errcode'] = 0;
		$return['errmsg'] = '获取菜单成功';
		$return['data'] = $menu['menu'];
                print_r($return);
        }

	/**
	 * 创建菜单
	 */
	public function create_menu() {
		$menu = I('post.menu');
		$button = $menu['button'];
		foreach ($button as $k => &$v) {
			if ($v == null) {
				continue;
			}
			$item['name'] = $v['name'];
			if (count($v['sub_button']) != 0) {				// 二级菜单存在
				foreach ($v['sub_button'] as $kk => $vv) {
					if ($vv == null) {
						continue;
					}
					$two['name'] = $vv['name'];
					$two['type'] = $vv['type'];
					if ($vv['type'] == 'view') {
						if (!$vv['url']) {
							$return['errcode'] = 1002;
							$return['errmsg'] = '菜单链接不能为空';
							$return['data_id'] = $kk;
							$this->ajaxReturn($return);
						} elseif (!preg_match('/\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/', $vv['url'])) {
							$return['errcode'] = 1004;
							$return['errmsg'] = '菜单链接地址不合法';
							$return['data_id'] = $kk;
							$this->ajaxReturn($return);
						}
						$two['url'] = $vv['url'];
					} elseif ($vv['type'] == 'click') {
						if (!$vv['key']) {
							$return['errcode'] = 1003;
							$return['errmsg'] = '菜单关键词不能为空';
							$return['data_id'] = $kk;
							$this->ajaxReturn($return);
						}
						$two['key'] = $vv['key'];
					} else {
						$return['errcode'] = 1001;
						$return['errmsg'] = '菜单动作必选';
						$return['data_id'] = $kk;
						$this->ajaxReturn($return);
					}
					$tmp[] = $two;
				}
				
				if (count($tmp) == 0) {
					$item['type'] = $v['type'];
					if ($v['type'] == 'view') {
						if (!$v['url']) {
							$return['errcode'] = 1002;
							$return['errmsg'] = '菜单链接不能为空';
							$return['data_id'] = $k;
							$this->ajaxReturn($return);
						} elseif (!preg_match('/\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/', $v['url'])) {
							$return['errcode'] = 1004;
							$return['errmsg'] = '菜单链接地址不合法';
							$return['data_id'] = $k;
							$this->ajaxReturn($return);
						}
						$item['url'] = $v['url'];
					} elseif ($v['type'] == 'click') {
						if (!$v['key']) {
							$return['errcode'] = 1003;
							$return['errmsg'] = '菜单关键词不能为空';
							$return['data_id'] = $k;
							$this->ajaxReturn($return);
						}
						$item['key'] = $v['key'];
					} else {
						$return['errcode'] = 1001;
						$return['errmsg'] = '菜单动作必选';
						$return['data_id'] = $k;
						$this->ajaxReturn($return);
					}
				} else {
					$item['sub_button'] = $tmp;
				}
				unset($tmp);
			} else {
				$item['type'] = $v['type'];
				if ($v['type'] == 'view') {
					if (!$v['url']) {
						$return['errcode'] = 1002;
						$return['errmsg'] = '菜单链接不能为空';
						$return['data_id'] = $k;
						$this->ajaxReturn($return);
					} elseif (!preg_match('/\b(([\w-]+:\/\/?|www[.])[^\s()<>]+(?:\([\w\d]+\)|([^[:punct:]\s]|\/)))/', $v['url'])) {
						$return['errcode'] = 1004;
						$return['errmsg'] = '菜单链接地址不合法';
						$return['data_id'] = $k;
						$this->ajaxReturn($return);
					}
					$item['url'] = $v['url'];
				} elseif ($v['type'] == 'click') {
					if (!$v['key']) {
						$return['errcode'] = 1003;
						$return['errmsg'] = '菜单关键词不能为空';
						$return['data_id'] = $k;
						$this->ajaxReturn($return);
					}
					$item['key'] = $v['key'];
				} else {
					$return['errcode'] = 1001;
					$return['errmsg'] = '菜单动作必选';
					$return['data_id'] = $k;
					$this->ajaxReturn($return);
				}
			}
			$custome_button[] = $item;
			unset($item);
		}
		if (!$custome_button) {
			$return['errcode'] = 1009;
			$return['errmsg'] = '菜单不能为空';
			$return['data'] = $custom_menu;
			$this->ajaxReturn($return);
		}
		$custom_menu['button'] = $custome_button;
		$result = create_menu($custom_menu);
		if ($result === true) {
			$menu['menu'] = $custom_menu;
			$flag = 'custom_menu_'.get_mpid();
			S($flag, $menu, 3600);
			$return['errcode'] = 0;
			$return['errmsg'] = '发布菜单成功';
			$return['data'] = $custom_menu;
			$this->ajaxReturn($return);
		} else {
			$return['errcode'] = 1008;
			$return['errmsg'] = '发布菜单失败，错误说明：'.$result['errmsg'];
			$return['data'] = $custom_menu;
			$this->ajaxReturn($return);
		}
		
	}

	// 删除菜单
	public function delete_menu() {
		$result = delete_menu();
		if ($result === true) {
			$flag = 'custom_menu_'.get_mpid();
			S($flag, null);
			$return['errcode'] = 0;
			$return['errmsg'] = '删除菜单成功';
			$this->ajaxReturn($return);
		} else {
			$return['errcode'] = 1007;
			$return['errmsg'] = '删除菜单失败，错误说明：'.$result;
			$this->ajaxReturn($return);
		}
	}
}

 ?>