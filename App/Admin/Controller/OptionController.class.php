<?php 

namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * 选项管理控制器
 * @author 魔派<180256122@qq.com>
 */
class OptionController extends BaseController {
	/**
	 * 选项设置
	 */
        public function lists(){
              if(!IS_POST){            
                    $User = M("rbac_nodes"); 
                    $data = $User->where("pid=0")->select();
                    $this->assign("data",$data);
                    $this->display();
              }else{
                  echo "后续要求添加";
              }
        }
        public function getChildren(){
          $id = I('get.id');
          $data = M('rbac_nodes')->select();
          $res = $this->list_level($data);
          $this->assign('data',$res);
          $this->display();
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
                      $this->list_level($arr,$v['nid'],$level+1);
                  }
              }
              return $data;
          }

        public function edit(){
          $id = I('id');
          $data = M('rbac_nodes')->where("nid=$id")->find(); 
          $this->assign('data',$data);
          $this->assign('id',$id);
          $this->display();
        }
        
        
        
        /*
        @选项设置   添加选项设置
        */
        public function adds(){
            if(!$_POST){
                 $User = M("rbac_nodes"); 
                    $data = $User->select();
                    $results = $this->list_level($data);
                    $this->assign("data",$results);
                    $this->display();
            }else{
                $form_data['pname'] = I('post.option_name');
                $form_data['pid'] = I('post.id');
                $form_data['url'] = 'Payment/add';
                $res = M('rbac_nodes')->add($form_data);
                if($res){
                  $this->redirect(('Admin/Option/lists'));
                }else{
                  $this->error('操作失败');
                }
            }
        }
        /*
        *选项入库
        */
        public function edit_pro(){
          $id = I('post.id');
          $form_data['pname'] = I('post.option_name');
          $res = M('rbac_nodes')->where("nid=$id")->save($form_data);
          if($res){
            $this->redirect('lists');
          }else{
            $this->error('操作失败');
          }
        }
        /*
        @删除模块开发  @author
         */
        public function deletes(){
            $id = I('id');
            //echo $id;die;
          $data = M('rbac_nodes')->where("nid=$id")->delete(); 
          if($data){
              $this->redirect('lists');
          }
        }
        
        /*
        删除顶级模块开发
        */
        public function deletess(){
          $id = I('id');
          $res = M('rbac_nodes')->where("nid=$id")->delete();
          if($res){
            M('rbac_nodes')->where("pid=$id")->delete();
                  $data['status'] = 1;
                  $data['info'] = "删除成功";
              }else{
                  $data['status'] = 0;
                  $data['info'] = "删除失败";
              }
            $this->ajaxReturn($data);
        }
        
        public function __call($method, $args) {
            parent::__call($method, $args);
        }
    }
?>