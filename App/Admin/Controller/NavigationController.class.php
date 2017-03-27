<?php

namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * RBAC权限节点管理控制器
 * @author 魔派<180256122@qq.com>
 */
class NavigationController extends BaseController {

	/**
	 * 添加节点
	 */
	public function add() {
		if(!IS_POST){
			$this->display();
		}else{
			$form_data = $_POST;
			$form_data['nav_times'] = time();
			// print_r($form_data);die;
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
	 * 导航列表
	 */
	public function lists() {
		$navs = M('navigation')->select();
		$this->assign('navs', $navs);
		$this->display();
	}

	/**
	*修改导航
	*/
	public function edit(){
		$id = I('id') ? I('id') : '';
		if(!IS_POST){
			$data = M('navigation')->where("nid=$id")->find();
			$this->assign('data',$data);
			$this->display();
		}else{
			$form_data = $_POST;
			$form_data['nav_times'] = time();
			// print_r($form_data);die;
			unset($form_data['__hash__']);
			$res = M('navigation')->where("nid=$form_data[id]")->save($form_data);
			if($res){
				$this->redirect('lists');
			}else{
				$this->error('添加失败');
			}
		}
	}

	/**
	*删除节点
	*/
	public function delete(){
		$id = I('id');
		$res = M('navigation')->where("nid=$id")->delete();
		if($res){
            $data['status'] = 1;
            $data['info'] = "删除成功";
        }else{
            $data['status'] = 0;
            $data['info'] = "删除失败";
        }
        $this->ajaxReturn($data);
	}
	//详细信息
	public function mess(){
		$id = I('get.id');
		$data = M('rbac_node')->where("id=$id")->select();
		$this->assign('pid',$data[0]['pid']);
		$parent = M('rbac_node')->where("id=".$data[0]['pid'])->select();
		$this->assign('par_name',$parent[0]['name']);
		$this->assign('name',$data[0]['name']);
		$this->assign('url',$data[0]['url']);
		$this->assign('type',$data[0]['type']);
		// $this->assign('status',$data[0]['status']);
		$this->assign('is_show',$data[0]['is_show']);
		$this->assign('id',$id);
		$this->display();
	}

	/**
	*删除多个节点
	*/
	public function dele_all(){
		$str = I('id');
    	$lengths = strlen($str);
        $val = substr($str,0,lengths-1);
        $res = M('navigation')->delete($val);
        // echo M()->_sql();die;
        if($res){
            $data['status'] = 1;
            $data['info'] = '删除成功';
        }else{
            $data['status'] = 0;
            $data['info'] = '删除失败';
        }
        $this->ajaxReturn($data);
	}

	/**
	*改变状态
	*/
	public function check_status(){
		$data['nav_status'] = I('get.nav_status');
		$id = I('get.id');
		$res = M('navigation')->where("nid=$id")->save($data);
		// echo M()->_sql();exit;
		if($res){
            echo 1;exit;
        }else{
            echo 0;exit;
        }
	}

}


?>