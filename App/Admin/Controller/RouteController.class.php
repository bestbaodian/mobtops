<?php

namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * 路由节点管理控制器
 * @author 魔派<180256122@qq.com>
 */
class RouteController extends BaseController {
     /**
	 * 路由列表
	 */
	public function lists() {
		$navs = M('privileges')->select();
		$this->assign('navs', $navs);
		$this->display();
	}
    /**
	 * 添加节点
	 */
	public function add() {
		if(!IS_POST){
			$results = M('privileges')->select();
			$nodes = $this->list_level($results);
			$this->assign('nodes', $nodes);
            $this->display();
		}else{
			$form_data = $_POST;
            print_r($form_data);die;
			$form_data['nav_times'] = time();
			unset($form_data['__hash__']);
			$res = M('navigation')->add($form_data);
			if($res){
				$this->redirect('lists');
			}else{
				$this->error('添加失败');
			}
		}
	}
    /**
	*递归显示节点
	*/
	public function list_level($arr,$pid = 0,$level = 0){
        static $data=array();
        foreach($arr as $k=>$v){
            if($v['p_fid']==$pid){
                $v['level']=$level;
                $data[]=$v;
                $this->list_level($arr,$v['pid'],$level+1);
            }
        }
        return $data;
    }
}


?>