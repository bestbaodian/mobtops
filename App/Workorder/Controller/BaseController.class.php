<?php 

namespace Workorder\Controller;
use Common\Controller\CommonController;

/**
 * 公众号模块公用控制器
 * @author 艾逗笔<765532665@qq.com>
 */
class BaseController extends CommonController {

	/**
	 * 初始化
	 * @author 艾逗笔<765532665@qq.com>
	 */
	public function _initialize() {
		parent::_initialize();
		// print_r($this->user_access);die;
        if ($this->user_access['admin']) {
		$topmenu[] = array(
			'title' => '系统管理',
			'url' => U('Admin/Index/index'),
			'class' => ''
		);
		}
		if ($this->user_access['mp']) {
			$topmenu[] = array(
				'title' => '公众号管理',
				'url' => U('Mp/Mp/lists'),
				'class' => ''
			);
		}
		$controller_name = CONTROLLER_NAME;
		// echo $controller_name;die;
		if($this->user_access['admin']&&$this->user_access['mp']){
			$top_arr = M('navigation')->where("nav_status = 1")->order('nid asc')->field('nav_title as title,nav_folder,nav_url as url')->select();
		}else{
			$uid = session('user_id');
			$role_id = M('rbac_role_user')->where("user_id=$uid")->field('role_id')->select();
			// print_r($role_id);die;
			$arr = array();
			foreach ($role_id as $key => $value) {
				$arr[] = $value['role_id'];
			}
			$role_str = implode(',', $arr);
			// echo $role_str;die;
			$condition['dc_rbac_nav.role_id'] = array('in',$role_str);
			$top_arr = M('rbac_nav')
					->join('dc_navigation on dc_rbac_nav.nav_id = dc_navigation.nid')
					->where($condition)
					->order('dc_navigation.nid asc')
					->field('nav_title as title,nav_folder,nav_url as url')
					->select();
		}
		$quan = array();
		foreach ($top_arr as $k => $v) {
        	$aa = explode('/', $v['url']);
        	$quan[$k] = $aa[0];
        }
        if(!in_array($controller_name, $quan)){
        	echo "没有权限,请联系系统管理员";exit;
        }
        foreach ($top_arr as $k => $v) {
           	$v['url'] = 'index.php?s=/'.$v['nav_folder'].'/'.$v['url'];
           	unset($v['nav_folder']);
           	$topmenu[] = $v; 
        }
        //二维数组去掉重复值
		 foreach ($topmenu as $v){
		  $v=join(',',$v); //降维,也可以用implode,将一维数组转换为用逗号连接的字符串
		  $temp[]=$v;
		 }
		 $temp=array_unique($temp); //去掉重复的字符串,也就是重复的一维数组
		 foreach ($temp as $k => $v){
		  $tem=explode(',',$v); //再将拆开的数组重新组装
		  $temps[$k]['title'] = $tem[0];
		  $temps[$k]['url'] = $tem[1];
		}
		 // print_r($temps);die;
		$uid = session('user_id');
		$this->assign('topmenu', $temps);
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