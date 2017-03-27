<?php 

namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * 后台首页控制器
 * @author 魔派<180256122@qq.com>
 */
class IndexController extends BaseController {

	/**
	 * 后台首页
	 * @author 魔派<180256122@qq.com>
	 */
	public function index() {
		$countes = M('affiche')->count();
		$data = M('affiche')->limit("0,3")->order('affiche_time desc')->select();
    	$this->assign('affiche_data',$data);
    	$this->assign('countes',$countes);
        $this->assign('meta_title', '后台首页');
		$user=M('user');
		$datas['admin']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 1');
		$datas['system']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 2');
		$datas['mp']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 3');
		$datas['wangzhan']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 4');
		$datas['video']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 5');
		$datas['payment']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 6');
		$datas['qixin']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 7');
		$this->assign('data',$datas);
		$this->display();
	}
	public function indexs(){
		$user=M('user');
		$datas['admin']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 1');
		$datas['system']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 2');
		$datas['mp']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 3');
		$datas['wangzhan']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 4');
		$datas['video']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 5');
		$datas['payment']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 6');
		$datas['qixin']=$user->query('select count(*) from dc_rbac_role INNER JOIN dc_rbac_role_user on dc_rbac_role.id = dc_rbac_role_user.role_id where dc_rbac_role.id = 7');
		$this->assign('data',$datas);
		$this->display();
	}
	/**
	 * 格式化显示用户所属角色
	 * @author 魔派<180256122@qq.com>
	 */
	public function parse_roles($user_id) {
		$role_users = M('rbac_role_user')->field('role_id')->where(array('user_id'=>$user_id))->select();
		foreach ($role_users as $k => $v) {
			$role = M('rbac_role')->where(array('id'=>$v['role_id']))->getField('name');
			$roles[] = $role;
		}
		return implode(',', $roles);
	}
}

?>