<?php 

namespace Mp\Controller;
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
		global $_G;
		$_G['mpid'] = get_mpid();
		$_G['mp_info'] = get_mp_info();
		$_SESSION['token'] = $_G['mp_info']['token'];
		if (!$_G['mpid'] || $_G['mpid'] < 0 || !$_G['mp_info']['origin_id']) {
			if ($_G['controller_name'] != 'mp' && $_G['controller_name'] != 'user') {
				if ($_G['controller_name'] == 'material' && ($_G['action_name'] == 'upload' || $_G['action_name'] == 'get_image_list' || $_G['action_name'] == 'delete_attach')) {

				} else {
					$this->redirect('Mp/lists');
				}
			}
		}
		if ($this->user_access['mp']) {
			$topmenu[] = array(
				'title' => '公众号管理',
				'url' => U('Mp/Mp/lists'),
				'class' => get_addon() || $_G['controller_name'] == 'addons' ? '' : ''
			);
			$topmenu[] = array(
				'title' => '插件管理',
				'url' => U('Mp/Addons/manage'),
				'class' => get_addon() || $_G['controller_name'] == 'addons' ? '' : ''
			);
		}
		$uid = session('user_id');
		$countes = M('affiche')
		->join('dc_user_afficheread on dc_affiche.cid = dc_user_afficheread.cid')
		->where("uid=$uid AND dc_user_afficheread.is_read = 0")
		->count();
    	$this->assign('countes',$countes);
    	$top_arr = M('navigation')->where("nav_status = 1")->order('nid asc')->field('nav_title as title,nav_folder,nav_url as url,nav_class as class')->select();
        if($this->user_access['admin']||$this->user_access['others']){
	        foreach ($top_arr as $k => $v) {
	           	$v['url'] = 'index.php?s=/'.$v['nav_folder'].'/'.$v['url'];
	           	unset($v['nav_folder']);
	           	$topmenu[] = $v; 
	        }
		}
		if ($this->user_access['mp'] && !$this->user_access['admin']) {
			$controller_name = CONTROLLER_NAME;
			if(!$controller_name == 'Mp'){
				$quan = array();
				foreach ($top_arr as $k => $v) {
		        	$aa = explode('/', $v['url']);
		        	$quan[$k] = $aa[0];
		        }
		        if(!in_array($controller_name, $quan)){
		        	echo "没有权限,请联系系统管理员";exit;
		        }
			}
    	}
		$this->assign('topmenu', $topmenu);
		$this->assign('system_settings', $_G['system_settings']);
		$addons = D('Admin/Addons')->get_installed_addons();
		add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');				// 添加生成侧边栏导航的钩子
		add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
		$sidenav = hook('sidenav');
		#2017年1月4日11:19:55
		if(empty($sidenav)){
			$sidenav = $this->meau();
		}
		$this->assign('sidenav', $sidenav);
		$this->assign('addons', $addons);
		$this->assign('mp_info', $_G['mp_info']);
		$this->assign('user_info', get_user_info());
		$branch_data = M('branch')->select();
		$this->assign('branch_data',$branch_data);
	}
	//获取权限信息
	public function meau(){
		$wheres['is_show']=1;
    	$node_data = M('mp_rbac_node')->where($wheres)->getField('id,name,folder,url,pid,class,attr');
		$results = $this->meau_data($node_data);
		return $results;

	}
    /**
	 * 解析节点数组
	 */
	private function meau_data($nodes, $access_nodes, $pid = 0) {
		$arr = array();
		foreach ($nodes as $k => $v) {
			if ($v['pid'] == $pid) {
				$v['title'] = $v['name'];
				if($v['pid'] != 0){
					$v['url'] = 'index.php?s='.$v['folder'].'/'.$v['url'];
				}	
				unset($v['name']);
				$v['children'] = $this->meau_data($nodes, $access_nodes, $v['id']);
				$arr[] = $v;
			}
		}
		return $arr;
	}
	
	/**
	*日志
	*/
	public function log($content){
        $data = array();
        $data['log_content']="$content";
        $data['log_addtime']=date("Y-m-d H:i:s",time());
        $data['uid']=session('user_id');
        $data['token'] = session('token');
        $data['log_ip']=get_client_ip();
        $data['log_controller']=CONTROLLER_NAME;
        $data['log_action']=ACTION_NAME;
        return $data;
    }
	
}


 ?>