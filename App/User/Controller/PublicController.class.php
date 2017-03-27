<?php 

namespace User\Controller;
use Think\Controller;

class PublicController extends Controller {

	/**
	 * 初始化
	 * @author 魔派<180256122@qq.com>
	 */
	public function _initialize() {
		$system_settings = D('Admin/SystemSetting')->get_settings();
		$this->assign('system_settings', $system_settings);
	}
	/**
	 * 用户登录
	 * @author 魔派<180256122@qq.com>
	 */
	public function login() {
		$system_settings = D('Admin/SystemSetting')->get_settings();
		if (IS_POST) {
			$username = I('username');
			$password = I('password');
			if (empty($username)) {
				$this->error('用户名不能为空');
			}
			if (empty($password)) {
				$this->error('密码不能为空');
			}
			$User = D('User');
			if (!$User->is_user_exists($username)) {
				$this->error('用户不存在');
			}
			if (!$User->auto_login($username, $password)) {
				$this->error('登录密码错误');
			}

			$uid = session('user_id');
			$user_info = M('user')->find($uid);
			$user_id=$user_info['id'];
			$role_data = M('rbac_role_user')->where("user_id=$user_id")->select();
			$role=$role_data[0]['role_id'];
			if($role==1){
				$this->redirect('Admin/Index/index');
			}else if($role==2){
				$this->redirect('Admin/Index/index');
			}else if($role==3){
				$this->redirect('Mp/Index/index');
			}else if($role==4){
				$this->redirect('School/school/lists');
			}else if($role==5){
				$this->redirect('Schooles/schooles/lists');
			}else if($role==6){
				$this->redirect("Teacher/teacher/lists");
			}
		} else {
			if (is_user_login()) {
				$uid = session('user_id');
				$user_info = M('user')->find($uid);
				$user_id=$user_info['id'];
				$role_data = M('rbac_role_user')->where("user_id=$user_id")->select();
				$role=$role_data[0]['role_id'];
				if($role==1){
					$this->redirect('Admin/Index/index');
				}else if($role==2){
					$this->redirect('Admin/Index/index');
				}else if($role==3){
					$this->redirect('Mp/Index/index');
				}else if($role==4){
					$this->redirect('School/school/lists');
				}else if($role==5){
					$this->redirect('Schooles/schooles/lists');
				}else if($role==6){
					$this->redirect('Catalog/Payments/payments');
				}else if($role==7){
					$this->redirect('Business/Qi/lists');
				}
			} else {
				$this->display('login');
			}
		}
	}
	/**
	 * 用户注册
	 * @author 魔派<180256122@qq.com>
	 */
	public function register() {
		$system_settings = D('Admin/SystemSetting')->get_settings();
		if ($system_settings['register_on'] != '1') {
			$this->error('未开放注册');
		}
		if (IS_POST) {
			if ($system_settings['register_invite_on']) {		// 开启了邀请注册的情况
				if (!I('invite_user') || !I('invite_code')) {
					$this->error('系统开启了邀请注册模式，你没有邀请码，暂时不能注册');
				}
				$invite = M('user_invite')->where(array('invite_user_id'=>I('invite_user'), 'invite_code'=>I('invite_code')))->find();
				if (!$invite || $invite['status'] == 0) {
					$this->error('邀请码不存在或被禁用，你暂时不能注册');
				}
				if ($invite['status'] == 2) {
					$this->error('邀请码已被使用，你不能再次使用此邀请码注册');
				}
			}
			$User = D('User');
			if (!$User->create()) {
				$this->error($User->getError());
			} else {
				$res = $User->add();
				if (!$res) {
					$this->error('注册失败');
				} else {
					if ($system_settings['register_invite_on']) {
						$invite['register_user_id'] = $res;
						$invite['status'] = 2;
						M('user_invite')->where(array('id'=>$invite['id']))->save($invite);
					}
					if ($system_settings['register_default_role_id']) {
						$data['role_id'] = intval($system_settings['register_default_role_id']);
						$data['user_id'] = $res;
						M('rbac_role_user')->add($data);
					}
					if ($User->auto_login(I('username'), I('password'))) {
						$this->success('用户注册成功并已自动登录', U('Mp/Index/index'));
					} else {
						$this->success('注册成功', U('login'));
					}
				}
			}
		} else {
			$this->assign('invite_user', I('invite_user'));
			$this->assign('invite_code', I('code'));
			$this->display();
		}
	}

	/**
	 * 输出极验验证码
	 * @author 魔派<180256122@qq.com>
	 */
	public function geetest_verify() {
		Vendor('GeeTest.geetestlib');
		Vendor('GeeTest.config');
		$GtSdk = new \GeetestLib(CAPTCHA_ID, PRIVATE_KEY);
		$user_id = get_user_id();
		$status = $GtSdk->pre_process($user_id);
		$_SESSION['gtserver'] = $status;
		$_SESSION['user_id'] = $user_id;
		echo $GtSdk->get_response_str();
	}

	/**
	 * 退出登录
	 * @author 魔派<180256122@qq.com>
	 */
	public function login_out() {
		if (D('User')->login_out()) {
			//$this->success('你已退出登录', U('login'));
                        $this->redirect('User/Public/login');
		} else {
			$this->redirect('login');
		}
	}

	/**
	 * 个人资料
	 * @author 魔派<180256122@qq.com>
	 */
	public function profile() {
		$this->display();
	}

	/**
	 * 修改密码
	 * @author 魔派<180256122@qq.com>
	 */
	public function change_password() {
		$this->display();
	}
}

?>