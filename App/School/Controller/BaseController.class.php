<?php 

namespace School\Controller;
use Common\Controller\CommonController;

/**
 * 公众号模块公用控制器
 * @author 魔派<180256122@qq.com>
 */
class BaseController extends CommonController {


	/**
	 * 初始化
	 * @author 魔派<180256122@qq.com>
	 */
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
			'title' => '账号管理',
			'url' => U('School/school/lists'),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '平台轮播管理',
			'url' => U(''),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '学校管理',
			'url' => U(''),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '教师管理',
			'url' => U(''),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '课程管理',
			'url' => U(''),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '专业管理',
			'url' => U(''),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '二维码管理',
			'url' => U(''),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '评论管理',
			'url' => U(''),
			'class' => ''
		);
		$topmenu[] = array(
			'title' => '意见反馈',
			'url' => U(''),
			'class' => ''
		);
		$controller_name = CONTROLLER_NAME;
		$uid = session('user_id');
		$user=M('user');
		$arr=$user->join("dc_rbac_role_user ON dc_user.id=dc_rbac_role_user.user_id")->join("dc_rbac_role ON dc_rbac_role_user.role_id=dc_rbac_role.id")->where("dc_user.id=$uid")->field("dc_rbac_role.id")->select();
		$info=$arr[0]['id'];

		//实例化role表
		$role=M('rbac_role');
		$top_arr=$role->join("dc_role_privileges ON dc_rbac_role.id=dc_role_privileges.rid")
			->join("dc_privileges ON dc_role_privileges.pid=dc_privileges.pid")
			->where("dc_rbac_role.id in($info)")
			->select();
		// $quan[]='Wang';
		// $quan[]='Material';
		// if(!in_array($controller_name, $quan)){
		// 	echo "没有权限,请联系系统管理员";exit;
		// }

		//拼接成想要的数组构成顶部导航
		foreach ($top_arr as $k => $v) {
			$v['url']= 'index.php?s=/school/'.$v['pcontroller'].'/'.$v['paction'];
			unset($v['nav_folder']);
			$topmenu[] = $v;
		}
		$this->assign('topmenu', $topmenu);
		add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');// 添加生成侧边栏导航的钩子
		add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
		$sidenav = hook('sidenav');
		$this->assign('sidenav', $sidenav);
		$this->assign('user_info', get_user_info());

		$branch_data = M('branch')->select();
		$this->assign('branch_data',$branch_data);
	}

	
}


 ?>