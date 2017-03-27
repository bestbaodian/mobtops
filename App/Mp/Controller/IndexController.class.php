<?php 

namespace Mp\Controller;
use Mp\Controller\BaseController;

class IndexController extends BaseController {
        //初始化
	public function _initialize() {
                if (I('mpid')) {
			$mp_info = M('mp')->find(I('mpid'));
			if ($mp_info['user_id'] == get_user_id()) {
				$token = md5($mp_info['origin_id']);
				M('mp')->where(array('id'=>I('mpid')))->setField('token', $token);
				get_token($token);
				get_mpid(I('mpid'));							// 缓存当前公众号
				D('User/User')->set_default_mp(I('mpid'));		// 设置当前用户默认管理公众号
			} else {
				$this->error('你不具备此公众号的管理权限');
			}
		}
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
		$where['username']=$_SESSION['username'];
		$datas=M('user')->where($where)->select();
		$wheres['name']=$datas[0]['application'];
		$wheres['is_show']=1;
		$arr=M('mp_rbac_node')->where($wheres)->select();
		//$sidenav = hook('sidenav');
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

	/**
	 * 公众号管理首页
	 * 公众号管理首页
	 * @author 魔派<180256122@qq.com>
	 */
	public function index() {
		global $_G;
		$info = get_mp_info();
		$this->assign('info', $info);
		$this->addNav('接口配置', '', 'active')
			 ->addNav('清除缓存', U('clear_cache'), '')
			 ->assign('api_url', U('/interface/'.$info['token'].'@'.C('HTTP_HOST')))
			 ->display();
	}

	/**
	 * 清除缓存
	 */
	public function clear_cache() {
                $username=$_SESSION['username'];
		$mp_info = get_mp_info();
		$flag = 'wechat_access_token'.$mp_info['appid'];
		S($flag, null);
                if($username=='admin'){
                   $this->redirect('Admin/Index/index');
                   //$this->success('清理缓存成功', U('Admin/Index/index'));
                }else{
                    $this->redirect('Mp/Mp/lists');
                    //$this->success('清理缓存成功', U('Mp/Mp/lists'));
                }
	}
}

 ?>