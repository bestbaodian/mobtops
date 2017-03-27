<?php 

namespace Admin\Controller;
use Common\Controller\CommonController;

/**
 * 后台公用控制器
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
		if($this->user_access['admin']||$this->user_access['others']){
			$top_arr = M('navigation')->where("nav_status = 1")->order('nid asc')->field('nav_title as title,nav_folder,nav_url as url,nav_class as class')->select();
	        foreach ($top_arr as $k => $v) {
	           	$v['url'] = 'index.php?s=/'.$v['nav_folder'].'/'.$v['url'];
	           	unset($v['nav_folder']);
	           	$topmenu[] = $v; 
	        }
		}
		$this->assign('topmenu', $topmenu);
		$sidenavs = $this->meau();
		
		$this->assign('sidenav', $sidenavs);
		$product_info = file_get_contents('./Data/product.info');
		$product_info = json_decode($product_info, true);
		$this->assign('product_info', $product_info);
		$this->assign('system_settings', $_G['system_settings']);
		$this->assign('user_info', get_user_info());
	}
	
    //获取权限信息
	public function meau(){
    	$node_data = M('rbac_node')->where("is_show=1")->getField('id,name,url,pid,class,attr');
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
					$v['url'] = 'index.php?s=/Admin/'.$v['url'];
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