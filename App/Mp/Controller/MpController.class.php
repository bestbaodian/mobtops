<?php 

namespace Mp\Controller;
use Mp\Controller\BaseController;
use WechatLogin\TPWechatLogin;

/**
 * 公众号管理控制器
 * @author  魔派<180256122@qq.com>
 */
class MpController extends BaseController {
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
						),
						array(
							'title' => '支付宝支付',
							'url' => U('Payment/zhifubao'),
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
	 * 公众号列表页
	 * @author  魔派<180256122@qq.com>
	 */
	public function lists() {
		$mp_count = M('mp')->where(array('user_id'=>get_user_id()))->count();
     	$data['url'] = CONTROLLER_NAME.'/'.ACTION_NAME;
    	$options = M('rbac_nodes')->where('pid=104')->getField('nid,pname');
		if ($this->user_access['mp_count'] !== 0){
			$tip = '你最多只能创建  '.$this->user_access['mp_count'].'  个公众号';
			$this->setTip($tip);
		}
        $this->addNav('公众号管理', U('Mp/Mp/lists'), 'active')
			 ->setModel('mp')
			 ->setListMap(array('user_id'=>get_user_id()))
			 ->setListOrder('create_time desc')
                         ->setListSearch(array(
			 	'name' => '公众号名称'
			 ))
                         ->addListItem('id', '编号')
			 ->addListItem('name', '公众号名称')
			 ->addListItem('type', '公众号类型', 'enum',array('options'=>$options,'value'=>$owndata['type'],'is_must'=>1))
			 ->addListItem('status', '状态', 'enum', array('options'=>array(0=>'禁用',1=>'正常',2=>'审核中')))
			 ->addListItem('create_time', '创建时间', 'function', array('function_name'=>'date','params'=>'Y-m-d H:i:s,###'))
			 ->addListItem('id', '操作', 'custom', array('options'=>array('manage'=>array('',U('Mp/Index/index',array('mpid'=>'{id}')),'btn btn-primary btn-sm icon-home',''),'edit'=>array('',U('Mp/Mp/edit',array('id'=>'{id}')),'btn btn-success btn-sm icon-edit'),'delete'=>array('',U('delete',array('id'=>'{id}')),'btn btn-danger btn-sm icon-delete'))))
			 ->common_lists();
			
	}

	/**
	 * 模拟登陆一键获取公众号信息
	 * @author  魔派<180256122@qq.com>
	 */
	public function auto_add() {
		$mp_count = M('mp')->where(array('user_id'=>get_user_id()))->count();
		if ($this->user_access['mp_count'] !== 0 && $mp_count >= $this->user_access['mp_count']) {
			$this->error('你最多只能创建'.$this->user_access['mp_count'].'个公众号');
		}
		if (IS_POST) {
			if (!I('login_name')) {
				$this->error('请填写公众平台登陆名');
			}
			if (!I('password')) {
				$this->error('请填写公众平台登陆密码');
			}
			if (M('mp')->where(array('login_name'=>I('login_name')))->find()) {
				$this->error('已使用此登录名获取过公众号信息，请直接编辑公众号');
			}
			$wechat = new TPWechatLogin(I('login_name'), I('password'));
			$wechat->setImgPath('./Uploads/Pictures/Mp');
			$mpInfo = $wechat->getMpInfo();

			if (!$mpInfo['origin_id']) {
				$this->error('一键获取公众号信息失败，请手动设置公众号信息！');
			}
			$data['user_id'] = get_user_id();
			$data['group_id'] = '';
			$data['name'] = $mpInfo['name'];
			$data['origin_id'] = $mpInfo['origin_id'];
			$data['type'] = intval($mpInfo['type'])+1;
			$data['status'] = 1;
			$data['create_time'] = time();
			$data['valid_token'] = get_nonce(32);
			$data['token'] = md5($data['origin_id']);
			$data['encodingaeskey'] = $mpInfo['encoding_aeskey'];
			$data['appid'] = $mpInfo['appid'];
			$data['mp_number'] = $mpInfo['mp_number'];
			$data['desc'] = $mpInfo['description'];
			$data['headimg'] = $mpInfo['headpic'];
			$data['qrcode'] = $mpInfo['qrcode'];
			$data['login_name'] = I('login_name');
			$res = M('mp')->add($data);
			if ($res) {
				$this->success('获取公众号信息成功', U('edit', array('id'=>$res)));
			} else {
				$this->error('获取公众号信息失败');
			}
		} else {
			$this->addCrumb('公众号管理', U('Mp/Index/index'), '')
			     ->addCrumb('公众号列表', U('Mp/Mp/lists'), '')
			     ->addCrumb('一键获取公众号信息', '', 'active')
			     ->addNav('一键获取公众号信息', '', 'active')
			     ->setModel('mp')
			     ->addFormField('login_name', '公众平台登录名', 'text')
			     ->addFormField('password', '公众号平台登录密码', 'password')
			     ->setTip('输入公众号平台的登录名和密码，可以一键获取公众号基本信息。如果你不想一键获取，<a href="'.U('Mp/add').'">点此</a>手动填写公众号信息。')
			     ->common_add();
		}
	}

	/**
	 * 新增
	 * @author  魔派<180256122@qq.com>
	 */
	public function adds() {
		$mp_count = M('mp')->where(array('user_id'=>get_user_id()))->count();
		if ($this->user_access['mp_count'] !== 0 && $mp_count >= $this->user_access['mp_count']) {
			$this->error('你最多只能创建'.$this->user_access['mp_count'].'个公众号');
		}
		$this->addNav('新增记录', '', 'active')
			 ->setModel('mp')
			 ->addFormField('name', '名称', 'text')
			 ->addFormField('type', '类型', 'radio', array('options'=>array(1=>'普通订阅号',2=>'认证订阅号',3=>'普通服务号',4=>'认证服务号',5=>'测试号'),'value'=>4,'is_must'=>1))
			 ->addFormField('origin_id', '原始ID', 'text', array('is_must'=>1))
			 ->addFormField('mp_number', '微信号', 'text')
			 ->addFormField('appid', 'APPID', 'text')
			 ->addFormField('appsecret', 'APPSECRET', 'text')
			 ->addFormField('headimg', '头像', 'image')
			 ->addFormField('qrcode', '二维码', 'image')
			 ->setValidate(array(
					array('name', 'require', '公众号名称不能为空'),
					array('type', 'require', '请选择公众号类型'),
					array('origin_id', 'require', '公众号原始ID不能为空'),
					array('origin_id', '/^gh_[0-9|a-z]{12}$/', '公众号原始ID格式错误'),
					array('origin_id', '', '具有相同原始ID的公众号已存在', 0, 'unique', 1),
			   ))
			 ->setAuto(array(
					array('status', '1'),
					array('create_time', 'time', 1, 'function'),
					array('valid_token', 'get_nonce', 1, 'function'),
					array('token', 'get_nonce', 1, 'function', '32'),
					array('encodingaeskey', 'get_nonce', 1, 'function', '43'),
					array('user_id', 'get_user_id', 1, 'function')
			   ))
			 ->setAddSuccessUrl(U('Index/index', array('mpid'=>'{pk}')))
			 ->common_add();
	}
        public function add() {
             $data['url'] = CONTROLLER_NAME.'/'.ACTION_NAME;
             $options = M('rbac_nodes')->where('pid=104')->getField('nid,pname');
                 //print_r($options);die;
		$this->addNav('添加公众号', 'index.php?s=Mp/Mp/lists', 'active')
			 ->setModel('mp')
			 ->addFormField('name', '公众号名称', 'text')
			 ->addFormField('type', '公众号类型', 'radio', array('options'=>$options,'value'=>107,'is_must'=>1))
			 ->addFormField('origin_id', '原始ID', 'text', array('is_must'=>1))
			 ->addFormField('mp_number', '微信号', 'text')
			 ->addFormField('appid', 'APPID', 'text')
			 ->addFormField('appsecret', 'APPSECRET', 'text')
			 ->addFormField('headimg', '头像', 'image')
			 ->addFormField('qrcode', '二维码', 'image')
			 ->setValidate(array(
					array('name', 'require', '公众号名称不能为空'),
					array('type', 'require', '请选择公众号类型'),
					array('origin_id', 'require', '公众号原始ID不能为空'),
					array('origin_id', '/^gh_[0-9|a-z]{12}$/', '公众号原始ID格式错误'),
					array('origin_id', '', '具有相同原始ID的公众号已存在', 0, 'unique', 1),
			   ))
			 ->setAuto(array(
					array('status', '1'),
					array('create_time', 'time', 1, 'function'),
					array('valid_token', 'get_nonce', 1, 'function'),
					array('token', 'get_nonce', 1, 'function', '32'),
					array('encodingaeskey', 'get_nonce', 1, 'function', '43'),
					array('user_id', 'get_user_id', 1, 'function')
			   ))
                        //->setAddSuccessUrl(U('Index/index', array('mpid'=>'{pk}')))
			->common_add();
	}
        public function addess() {
                $data['url'] = CONTROLLER_NAME.'/'.ACTION_NAME;
		$mp_count = M('mp')->where(array('user_id'=>get_user_id()))->count();
		if ($this->user_access['mp_count'] !== 0 && $mp_count >= $this->user_access['mp_count']) {
			$this->error('你最多只能创建'.$this->user_access['mp_count'].'个公众号');
		}
                $options = M('rbac_nodes')->where('pid=104')->getField('nid,pname');
		$this->setMetaTitle('添加公众号')
			 ->addCrumb('公众号管理', U('Mp/Index/index'), '')
			 ->addCrumb('公众号列表', U('Mp/Mp/lists'))
			 ->addCrumb('添加公众号', '', 'active')
			 ->addNav('添加公众号', '', 'active')
			 ->setModel('mp')
			 ->addFormField('name', '名称', 'text')
			 ->addFormField('type', '公众号类型', 'radio', array('options'=>$options,'value'=>107,'is_must'=>1))
			 ->addFormField('origin_id', '原始ID', 'text', array('is_must'=>1))
			 ->addFormField('mp_number', '微信号', 'text')
			 ->addFormField('appid', 'APPID', 'text')
			 ->addFormField('appsecret', 'APPSECRET', 'text')
			 ->addFormField('headimg', '头像', 'image')
			 ->addFormField('qrcode', '二维码', 'image')
			 ->setValidate(array(
					array('name', 'require', '公众号名称不能为空'),
					array('type', 'require', '请选择公众号类型'),
					array('origin_id', 'require', '公众号原始ID不能为空'),
					array('origin_id', '/^gh_[0-9|a-z]{12}$/', '公众号原始ID格式错误'),
					array('origin_id', '', '具有相同原始ID的公众号已存在', 0, 'unique', 1),
			   ))
			 ->setAuto(array(
					array('status', '1'),
					array('create_time', 'time', 1, 'function'),
					array('valid_token', 'get_nonce', 1, 'function'),
					array('token', 'get_nonce', 1, 'function', '32'),
					array('encodingaeskey', 'get_nonce', 1, 'function', '43'),
					array('user_id', 'get_user_id', 1, 'function')
			   ))
			 ->setAddSuccessUrl(U('Index/index', array('mpid'=>'{pk}')))
			 ->common_add();
	}

	/** 
	 * 编辑公众号
	 * @author  魔派<180256122@qq.com>
	 */
	public function edit() {
		$id = I('id');
		if($id){
			$owndata = M('mp')->where("id=$id")->find();
		}
        $data['url'] = CONTROLLER_NAME.'/'.ACTION_NAME;
        $options = M('rbac_nodes')->where('pid=104')->getField('nid,pname');
        // print_r($owndata);die;
                 // echo $owndata['type'];die;
		$this->addNav('编辑公众号', 'index.php?s=Mp/Mp/lists', 'active')
			 ->setModel('mp')
			 ->addFormField('name', '公众号名称', 'text')
			 ->addFormField('type', '公众号类型', 'radio', array('options'=>$options,'value'=>$owndata['type'],'is_must'=>1))
			 ->addFormField('status', '状态', 'radio', array('options'=>array(0=>'禁用',1=>'正常',2=>'审核中')))
			 ->addFormField('origin_id', '原始ID', 'text', array('is_must'=>1))
			 ->addFormField('mp_number', '微信号', 'text')
			 ->addFormField('appid', 'APPID', 'text')
			 ->addFormField('appsecret', 'APPSECRET', 'text')
			 ->addFormField('headimg', '头像', 'image')
			 ->addFormField('qrcode', '二维码', 'image')
			 ->setFormData(M('mp')->find(I('get.id')))
			 ->setEditMap(array('id'=>I('get.id')))
			 ->setValidate(array(
					array('name', 'require', '公众号名称不能为空'),
					array('type', 'require', '请选择公众号类型'),
					array('origin_id', 'require', '公众号原始ID不能为空'),
					array('origin_id', '/^gh_[0-9|a-z]{12}$/', '公众号原始ID格式错误'),
			   ))
			 ->common_edit();
	}

	/**
	 * 删除公众号
	 * @author  魔派<180256122@qq.com>
	 */
	public function delete() {
		$this->setModel('mp')
			 ->setDeleteMap(array('id'=>I('get.id')))
			 ->common_delete();
	}
        
        /*
         * 测试数据
         */
        public function ceshi(){
            $url=$_SERVER['SCRIPT_NAME'];
            echo $url;
        }
        
        /*
        全选
         */
        public function delall(){
            $id = I('id');
            $lengths = strlen($id);
            $val = substr($id,0,lengths-1);
            // echo $val;die;
            $res = M('mp')->delete($val);
            if($res){
                $data['status'] = 1;
                $data['info'] = '删除成功';
            }else{
                $data['status'] = 0;
                $data['info'] = '删除失败';
            }
            $this->ajaxReturn($data);
    }
    public function ceshis(){
       $data=array('openid'=>'{openid}');
        print_r($data);
    }

}

 ?>