<?php

namespace Mp\Controller;
use Mp\Controller\BaseController;

/**
 * RBAC权限节点管理控制器
 * @author 魔派<180256122@qq.com>
 */
class MpnodeController extends BaseController {
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
            'url' =>U('Mp/lists'),
            'class' => ''
        );
         $topmenu[] = array(
            'title' => '支付管理',
            'url' =>U('Payments/payments'),
            'class' => ''
        );
       $topmenu[] = array(
            'title' => '视频直播',
            'url' =>U('Explain/lists'),
            'class' => ''
        );  
        $topmenu[] = array(
            'title' => '网站管理',
            'url' =>U('Wang/lists'),
            'class' => ''
        );
       $topmenu[] = array(
            'title' => '企信管理',
            'url' =>U('Qi/lists'),
            'class' => ''
        );  
       $topmenu[] = array(
            'title' => '工单服务',
            'url' =>U('Gongdan/profile'),
            'class' => ''
        ); 
        $this->assign('topmenu', $topmenu);
    }
	/**
	 * 添加节点
	 * @author 魔派<180256122@qq.com>
	 */
	public function add() {
		if(!IS_POST){
			$par_id = I('id');
			// print_r($par_id);die;
			$results = M('mp_rbac_node')->select();
			$nodes = $this->list_level($results);
	                // print_r($nodes);die;
			$this->assign('par_id',$par_id);
			$this->assign('nodes', $nodes);
			$this->display();
		}else{
			$form_data = $_POST;
			empty ( $form_data['name'] ) && $this->error ( '请输入节点名称' );
			empty ( $form_data['url'] ) && $this->error ( '节点路由不能为空 ' );
			if($form_data['pid'] == 0){
				$form_data['attr'] = 'data="icon"';
			}
			$form_data['create_time'] = time();
			$res = M('mp_rbac_node')->where('pid='.$form['pid'])->add($form_data);
			if($res){
				$this->redirect('lists');
			}else{
				$this->error('添加失败');
			}
		}

	}

	/**
	 * 节点列表
	 * @author 魔派<180256122@qq.com>
	 */
	public function lists() {
		$results = M('mp_rbac_node')->select();
		$nodes = $this->list_level($results);
		$this->assign('nodes', $nodes);
		$this->display();
	}

	/**
	 * 解析节点数组
	 * @author 魔派<180256122@qq.com>
	 */
	private function parse_node($nodes, $pid = 0) {
		$arr = array();
		foreach ($nodes as $k => $v) {
			if ($v['pid'] == $pid) {
				$v['children'] = $this->parse_node($nodes, $v['id']);
				$arr[] = $v;
			}
		}
		return $arr;
	}

	/**
	*递归显示节点
	*/
	public function list_level($arr,$pid = 0,$level = 0){
        static $data=array();
        foreach($arr as $k=>$v){
            if($v['pid']==$pid){
                $v['level']=$level;
                $data[]=$v;
                $this->list_level($arr,$v['id'],$level+1);
            }
        }
        return $data;
    }

    /**
    *编辑节点
    */
	public function edit(){
		$id = I('get.id');
		$data = M('mp_rbac_node')->where("id=$id")->select();
		$results = M('mp_rbac_node')->select();
		$nodes = $this->list_level($results);
		$this->assign('pid',$data[0]['pid']);
		$this->assign('nodes', $nodes);
		$this->assign('name',$data[0]['name']);
		$this->assign('url',$data[0]['url']);
		$this->assign('type',$data[0]['type']);
		$this->assign('folder',$data[0]['folder']);
		$this->assign('is_show',$data[0]['is_show']);
		$this->assign('class',$data[0]['class']);
		$this->assign('id',$id);
		$this->display();
	}
	//提交编辑的信息
	public function edit_pro(){
		$data['name'] = I('post.name');
		$data['url'] = I('post.url');
		empty ( $data['name'] ) && $this->error ( '请输入节点名称' );
		empty ( $data['url'] ) && $this->error ( '节点路由不能为空 ' );
		$data['type'] = I('post.type');
		$data['folder'] = I('post.folder');
		$data['is_show'] = I('post.is_show');
		$data['sort'] = I('post.sort');
		$data['pid'] = I('post.pid');
		$data['class'] = I('post.class');
		$data['create_time'] = time();
		if($data['pid'] == 0){
			$data['attr'] = 'data="icon"';
		}
		$id = I('post.id');
		$res = M('mp_rbac_node')->where("id=$id")->save($data);
		if($res){
			$this->redirect('lists');
		}else{
			$this->error('修改失败');
		}
	}

	/**
	*删除节点
	*/
	public function delete(){
		$id = I('id');
		$res = M('mp_rbac_node')->where("id=$id")->delete();
		if($res){
			M('mp_rbac_node')->where("pid=$id")->delete();
            $data['status'] = 1;
            $data['info'] = "删除成功";
        }else{
            $data['status'] = 0;
            $data['info'] = "删除失败";
        }
        $this->ajaxReturn($data);
	}
	//检测节点名称的唯一性
	public function checkname(){
		$name = I('get.name');
		$results = M('mp_rbac_node')->where("name = $name AND pid = '0'")->find();
		if($results){
			echo 1;
		}else{
			echo 0;
		}
	}
	//详细信息
	public function mess(){
		$id = I('get.id');
		$data = M('mp_rbac_node')->where("id=$id")->select();
		$this->assign('pid',$data[0]['pid']);
		$parent = M('mp_rbac_node')->where("id=".$data[0]['pid'])->select();
		$this->assign('par_name',$parent[0]['name']);
		$this->assign('name',$data[0]['name']);
		$this->assign('url',$data[0]['url']);
		$this->assign('type',$data[0]['type']);
		$this->assign('folder',$data[0]['folder']);
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
        $res = M('mp_rbac_node')->delete($val);
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
		$data['is_show'] = I('get.is_show');
		$id = I('get.id');
		$res = M('mp_rbac_node')->where("id=$id")->save($data);
		// echo M()->_sql();exit;
		if($res){
            echo 1;exit;
        }else{
            echo 0;exit;
        }
	}

}


?>
