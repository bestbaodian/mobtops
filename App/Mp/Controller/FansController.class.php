<?php 

namespace Mp\Controller;
use Mp\Controller\BaseController;

/**
 * 公众号粉丝管理控制器
 * @author 魔派<180256122@qq.com>
 */
class FansController extends BaseController {
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
	 * 粉丝列表
	 * @author 魔派<180256122@qq.com>
	 */
	public function lists() {
		$this->addNav('粉丝管理', '', 'active')
			 ->addNav('功能配置', U('Mp/Fans/setting'), '')
			 ->setModel('mp_fans')
			 ->setListMap(array('mpid'=>get_mpid()))
                         ->addListItem('id', '序号')
			 ->addListItem('openid', '粉丝OPENID', 'hidden')
			 ->addListItem('headimgurl', '头像', 'image', array('attr'=>'width=20 height=20','placeholder'=>__ROOT__ . '/Public/Admin/img/noname.jpg'))
			 ->addListItem('nickname', '昵称', '', array('placeholder'=>'匿名'))
			 ->addListItem('sex', '性别', 'enum', array('options'=>array(''=>'未知',0=>'未知',1=>'男',2=>'女')))
			 ->addListItem('is_subscribe', '关注', 'enum', array('options'=>array(0=>'未关注',1=>'已关注')))
			 ->addListItem('score', '积分')
			 ->addListItem('money', '金钱')
			 ->addListItem('id', '操作', 'custom', array('options'=>array('edit_fans'=>array('', U('Mp/Fans/edit_fans', array('openid'=>'{openid}')),'btn btn-primary btn-sm icon-edit',''))))
		     ->common_lists();
	}
	
	/**
	 * 编辑粉丝信息
	 * @author 魔派<180256122@qq.com>
	 */
	public function edit_fans() {
		$this->addCrumb('公众号管理', U('Mp/Index/index'), '')
			 ->addCrumb('粉丝管理', U('Mp/Fans/lists'), '')
			 ->addCrumb('编辑粉丝信息', '', 'active')
			 ->addNav('编辑粉丝信息', '', 'active')
		     ->setModel('mp_fans')
		     ->addFormField('headimgurl', '用户头像', 'image')
		     ->addFormField('nickname', '昵称', 'text')
		     ->addFormField('relname', '真实姓名', 'text')
		     ->addFormField('sex', '性别', 'radio', array('options'=>array(0=>'未知',1=>'男',2=>'女')))
		     ->addFormField('mobile', '手机号', 'text')
		     ->addFormField('signature', '个性签名', 'textarea')
		     ->setEditMap(array('openid'=>I('get.openid')))
		     ->common_edit();
	}

	/**
	 * 粉丝配置
	 * @author 魔派<180256122@qq.com>
	 */
	public function setting() {
		C('TOKEN_ON', false);
		$MpSetting = D('MpSetting');
		if (IS_POST) {
			$settings = I('post.');
			if (!$MpSetting->add_settings($settings)) {
				$this->error('保存设置失败');
			} else {
				$this->success('保存设置成功');
			}
		} else {
			$this->addNav('粉丝列表', U('Mp/Fans/lists'), '')
				 ->addNav('功能配置', '', 'active')
				 ->setModel('mp_setting')
				 ->addFormField('fans_init_integral', '初始化积分', 'number', array('placeholder'=>100,'tip'=>'用户初次关注公众号时赠送的积分'))
				 ->addFormField('fans_init_money', '初始化金钱', 'number', array('placeholder'=>100,'tip'=>'用户初次关注公众号时赠送的金钱'))
				 ->addFormField('fans_bind_on', '是否开启粉丝绑定', 'radio', array('options'=>array(0=>'不开启',1=>'开启'),'value'=>0,'tip'=>'开启粉丝绑定后，对于未认证公众号可以通过粉丝在绑定页面填写的头像、昵称等来获取用户的基本资料'))
				 ->setFormData($MpSetting->get_settings())
				 ->common_edit();
		}
	}

}

?>