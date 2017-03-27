<?php 
namespace Workorder\Controller;
use Workorder\Controller\BaseController;
/**
 * 工单服务控制器
 * @author 魔派<180256122@qq.com>
 */
class GongdanController extends BaseController {

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
            'title' => '企信管理',
            'url' =>U('Qi/lists'),
            'class' => ''
        ); 
        $this->assign('topmenu', $topmenu);
    }
	/**
	 * 我的工单
	 * @author 魔派<180256122@qq.com>
	 */
    public function profile(){
        $profile_order = I('profile_order') ? I('profile_order') : '';
        $start_time = I('start_time') ? I('start_time') : '';
        $end_time = I('end_time') ? I('end_time') : '';
        $keywords = I('keywords') ? I('keywords') : '';
        $page = I('p') ? I('p') : 1;
        if($profile_order){
            $condition['dc_work_order.profile_order'] = array('like',"%".$profile_order."%");
        }
        if($start_time && $end_time){
            $condition['dc_work_order.sub_time'] = array('EGT',strtotime($start_time));
            $condition['dc_work_order.sub_time'] = array('ELT',strtotime($end_time));
        }   
        if($keywords){
            $condition['dc_work_order.problem_desc'] = array('like',"%".$keywords."%");
        }
        $token = session('token');
        if($token == '15cd40b8ebc12a400b456cf79a3b6a4e8'){
            $count = M('work_order')
            ->join('dc_mp on dc_mp.token = dc_work_order.token')
            ->count();
            $data = paginations($page,$count,25);
            $data['lists'] = M('work_order')
            ->join('dc_mp on dc_mp.token = dc_work_order.token')
            ->where($condition)
            ->limit("$data[start],25")
            ->select();
            // print_r($data);die;
            $this->assign('profile_order',$profile_order);
            $this->assign('start_time',$start_time);
            $this->assign('end_time',$end_time);
            $this->assign('keywords',$keywords);
            $this->assign('data',$data);
            $this->display('admin_profile_lists');
        }else{
            $condition = array('dc_mp.token'=>$token);
            $count = M('work_order')
            ->join('dc_mp on dc_mp.token = dc_work_order.token')
            ->where($condition)
            ->count();
            $data = paginations($page,$count,25);
            $data['lists'] = M('work_order')
            ->join('dc_mp on dc_mp.token = dc_work_order.token')
            ->where($condition)
            ->limit("$data[start],25")
            ->select();
            // print_r($data);die;
            $this->assign('profile_order',$profile_order);
            $this->assign('start_time',$start_time);
            $this->assign('end_time',$end_time);
            $this->assign('keywords',$keywords);
            $this->assign('data',$data);
            $this->display('profile_lists');
        }
    }
    /*
    *提交工单
    *@author 魔派<180256122@qq.com> 
    */
    public function profile_add(){
        if(!$_POST){
            $token = session('token');
            $arr = M('mp')->where("token='$token'")->find();
            $arr['phone'] = substr_replace($arr['phone'],'****',3,4);
            $arr['email'] = substr_replace($arr['email'],'***',3,3);
            $this->assign('arr',$arr);
            $this->display();
        }else{
            $form_data = $_POST;
            $form_data['token'] = session('token');
            $form_data['profile_order'] = time().rand(1000,9999);
            $form_data['sub_time'] = time();
            $form_data['secret_mess'] = md5(md5($form_data['secret_mess']));
            $res = M('work_order')->add($form_data);
            if($res){
                $this->redirect('profile');
            }else{
                $this->error('添加失败');
            }
        }
    }
    /**
    *处理工单
    */ 
    public function profile_dispost(){
        $pid = I('pid') ? I('pid') : '';
        $savedata['p_status'] = '2';
        $re = M('work_order')->where("pid=$pid")->save($savedata);
        $mess_data = M('work_order')
        ->join('dc_mp on dc_work_order.token = dc_mp.token')
        ->where("pid=$pid")->find();
        $mess_data['email'] = substr_replace($mess_data['email'],'***',3,3);
        $chat_data = M('work_question')->where("p_id=$mess_data[pid]")->order('update_times asc')->select();
        // $this->assign('token',session('token'));
        $this->assign('chat_data',$chat_data);
        $this->assign('mess_data',$mess_data);
        $this->display();
    }

    /**
    *查看工单进程
    */
    public function profile_mess(){
        $pid = I('pid') ? I('pid') : '';
        $mess_data = M('work_order')
        ->join('dc_user on dc_work_order.token = dc_user.token')
        ->where("pid=$pid")->find();
        // print_r($mess_data);die;
        $mess_data['email'] = substr_replace($mess_data['email'],'***',3,3);
        $chat_data = M('work_question')->where("p_id=$pid")->order('update_times asc')->select();
        $leave_data = M('work_comment')->where("pid=$pid")->find();
        // print_r($chat_data);die;
        if($leave_data){
            $this->assign('leave_data',$leave_data);
            $this->assign('chat_data',$chat_data);
            $this->assign('mess_data',$mess_data);
            $this->display('leave_data');
        }else{
            $this->assign('chat_data',$chat_data);
            $this->assign('mess_data',$mess_data);
            $this->display();
        }
    }

    /**
    *工单删除
    */
    public function profile_dele(){
        $condition['pid'] = I('pid');
        $save['p_id'] = I('pid');
        // print_r($condition);die;
        $this->delete_one('work_order',$condition);
        $this->delete_one('work_question',$save);
    }

    /**
    *工单批删
    */
    public function profile_delall(){
        $str = I('pid');
        $lengths = strlen($str);
        $val = substr($str,0,lengths-1);
        $del['p_id'] = array('in',$val);
        $res = M('work_order')->delete($val);
        $re = M('work_question')->where($del)->delete();
        if($res && $re){
            $data['status'] = 1;
            $data['info'] = "删除成功";
        }else{
            $data['status'] = 0;
            $data['info'] = "删除失败";
        }
        $this->ajaxReturn($data);
    }

    /**
    *单个删除功能封装
    */
    public function delete_one($tablename,$condition){
        $res = M($tablename)->where($condition)->delete();
        if($res){
              $data['status'] = 1;
              $data['info'] = "删除成功";
        }else{
              $data['status'] = 0;
              $data['info'] = "删除失败";
        }
        $this->ajaxReturn($data);
    }

    /**
    *批量删除功能封装
    */
    public function delete_all($tablename,$str){
        $lengths = strlen($str);
        $val = substr($str,0,lengths-1);
        $res = M($tablename)->delete($val);
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
    *留言
    */
    public function leave_message(){
        $form_data['answers'] = I('answers');
        $form_data['p_id'] = I('p_id');
        $form_data['update_times'] = time();
        $res = M('work_question')->add($form_data);
        if($res){
            $mess_data = M('work_order')
            ->join('dc_user on dc_work_order.token = dc_user.token')
            ->where("pid=$form_data[p_id]")->find();
            $mess_data['email'] = substr_replace($mess_data['email'],'***',3,3);
            $chat_data = M('work_question')->where("p_id=$mess_data[pid]")->order('update_times asc')->select();
            // $this->assign('token',session('token'))
            $this->assign('chat_data',$chat_data);
            $this->assign('mess_data',$mess_data);
            $this->display();
        }else{
            $this->error('操作失败');
        }
    }

    /**
    *回复
    */
    public function reply_message(){
        $form_data['answers'] = I('answers');
        $form_data['p_id'] = I('p_id');
        $form_data['p_type'] = '1';
        $form_data['update_times'] = time();
        $res = M('work_question')->add($form_data);
        // echo M()->_sql();die;
        $savedata['p_status'] = '2';
        $re = M('work_order')->where("pid=$form_data[p_id]")->save($savedata);
        if($res){
            $mess_data = M('work_order')
            ->join('dc_user on dc_work_order.token = dc_user.token')
            ->where("pid=$form_data[p_id]")->find();
            $mess_data['email'] = substr_replace($mess_data['email'],'***',3,3);
            $chat_data = M('work_question')->where("p_id=$mess_data[pid]")->order('update_times asc')->select();
            $this->assign('chat_data',$chat_data);
            $this->assign('mess_data',$mess_data);
            $this->display('leave_message');
        }else{
            $this->error('操作失败');
        }
    }

    /**
    *确认工单已完成
    */
    public function profile_done(){
        $p_id = I('p_id');
        $savedata['p_status'] = '3';
        $res = M('work_order')->where("pid = $p_id")->save($savedata);
        if($res){
            $this->redirect('profile');
        }else{
            $this->error('操作失败');
        }
    }


    /**
    *工单留言
    */
    public function comment(){
        if(!IS_POST){
            $pid = I('pid') ? I('pid') : '';
            $this->assign('pid',$pid);
            $this->display();
        }else{
            $form_data = $_POST;
            $form_data['uid'] = session('user_id');
            $form_data['leave_time'] = time();
            // print_r($form_data);die;
            unset($form_data['__hash__']);
            $res = M('work_comment')->add($form_data);
            $savedata['p_status'] = '4';
            $re = M('work_order')->where("pid = $form_data[pid]")->save($savedata);
            if($res && $re){
                $this->redirect('profile');
            }else{
                $this->error('操作失败');
            }
        }
    }
    public function profile_edit(){
        $pid = I('pid') ? I('pid') : '';
        if(!IS_POST){
            $mess_data = M('work_order')->where("pid=$pid")->find();
            $this->assign('mess_data',$mess_data);
            $this->display();
        }else{
            $savedata = $_POST;
            // print_r($savedata);die;
            $res = M('work_order')->where("pid=$savedata[pid]")->save($savedata);
            // echo M()->_sql();die;
            if($res){
                $this->redirect('profile');
            }else{
                $this->error('操作失败');
            }
        }
        
    }
}

?>