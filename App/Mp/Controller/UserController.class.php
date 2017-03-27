<?php 

namespace Mp\Controller;
use Mp\Controller\BaseController;

/**
 * 公众号管理员控制器
 * @author 魔派<180256122@qq.com>
 */
class UserController extends BaseController {
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
	}
	/**
	 * 个人资料
	 * @author 魔派<180256122@qq.com>
	 */
	public function profile(){
		$sidenav = array(
                     array(
					'title' => '账号管理',
					'url' => 'javascript:;',
					'class' => 'icon icon-reply',
					'attr' => 'data="icon"',
					'children' => array(
						array(
							'title' => '安全设置',
							'url' => U('Mp/User/own_mess'),
							'class' => ''
						),
						array(
							'title' => '基本资料',
							'url' => U('Mp/User/base_data'),
							'class' => ''
						),
						array(
							'title' => '我的公众号',
							'url' => U('Mp/Mp/lists'),
							'class' => ''
						),
                                                array(
							'title' => '短信管理',
							'url' => U('Mp/Money/myMessage'),
							'class' => ''
						),
                                                array(
							'title' => '充值管理',
							'url' => U('Mp/Mp/lists'),
							'class' => ''
						)
                                        
					)
				)
		);
		$this->addNav('个人资料', '', 'active')
			 ->setSideNav($sidenav);
	}
	/**
	 * 修改密码
	 * @author 魔派<180256122@qq.com>
	 */
	public function change_password() {
		if (IS_POST) {
			if (!I('old_pass')) {
				$this->error('请输入原密码');
			}
			if (!I('new_pass')) {
				$this->error('请输入新密码');
			}
			if (!I('confirm_pass')) {
				$this->error('请输入确认密码');
			}
			$uid = session('user_id');
        	// echo $uid;die;
        	$old_pass = M('user')->where("id=$uid")->getField('password');
			if ($old_pass != md5(I('old_pass'))) {
				$this->error('原密码不正确');
			}
			if (I('new_pass') != I('confirm_pass')) {
				$this->error('确认密码不正确');
			}
			if (strlen(I('new_pass')) < 6 || strlen(I('new_pass')) > 20) {
				$this->error('密码长度需在6~20之间');
			}
			$res = M('user')->where(array('id'=>$uid))->setField('password', md5(trim(I('new_pass'))));
			if (!$res) {
				$this->error('修改密码失败');
			} else {
				$this->redirect('own_mess');
			}
		}
	}
    /*
    @我的个人信息
     */
    public function xinxi(){
         if(!IS_POST){            
           $username=$_SESSION['username'];
           $User = M("user"); // 实例化User对象// 查找status值为1name值为think的用户数据 
           $data = $User->where("username='$username'")->select();
           //print_r($data);die;
           $this->assign("data",$data);     
           $this->display();
    	}
	}
	/**
    *个人资料
    */
    public function own_mess(){
    	$this->profile();
    	$uid = session('user_id');
    	$userData = M('user')->where("id=$uid")->find();
    	$this->assign('data',$userData);
    	$this->display();
    }
    /**
    *验证旧密码
    */
    public function check_oldpassword(){
    	$old_password = I('post.old_password');
    	$uid = session('user_id');
    	// echo $uid;die;
    	$old_pass = M('user')->where("id=$uid")->getField('password');
    	if(md5($old_password) == $old_pass){
    		$data['status'] = 1;
    		$data['info'] = '旧密码验证成功';
    	}else{
    		$data['status'] = 0;
    		$data['info'] = '旧密码验证失败';
    	}
    	$this->ajaxReturn($data);
    }
    /**
    *修改头像
    */
    public function update_img(){
    	$uid = session('user_id');
    	$data['headimg'] = I('post.headimg');
    	$res = M('user')->where("id=$uid")->save($data);
    	if($res){
    		$data['status'] = 1;
    		$data['info'] = '修改成功';
    	}else{
    		$data['status'] = 0;
    		$data['info'] = '修改失败';
    	}
    	$this->ajaxReturn($data);
    }

    /**
	*基本资料
    */
    public function base_data(){
    	$uid = session('user_id');
    	if(!IS_POST){
    		$own_data = M('user')->where("id=$uid")->find();
    		if($own_data['province']){
    			$province = M('20')->where("ad_id=$own_data[province]")->getField('ad_name');
    		}
    		if($own_data['city']){
    			$city = M('20')->where("ad_id=$own_data[city]")->getField('ad_name');
    		}
    		if($own_data['county']){
    			$county = M('20')->where("ad_id=$own_data[county]")->getField('ad_name');
    		}
    		$own_data['myaddress'] = $province.'-'.$city.'-'.$county;
    		// print_r($own_data);die;
	    	$this->assign('own_data',$own_data);
	    	$this->display();
    	}else{
    		$form_data = $_POST;
    		unset($form_data['__hash__']);
    		$form_data['update_time'] = time();
    		// print_r($form_data);die;
    		$res = M('user')->where("id=$uid")->save($form_data);
    		if($res){
    			$this->redirect('base_data');
    		}else{
    			$this->error('操作失败');
    		}
    	}
    }
 }

?>