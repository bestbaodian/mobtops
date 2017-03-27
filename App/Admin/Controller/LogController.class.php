<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;
/**
 * 日志控制器
 * @author 魔派<180256122@qq.com>
 */
class LogController extends BaseController {
    public function _initialize() {
		parent::_initialize();
	}

	/**
	*日志中心
	*/
    public function lists(){
    	$search = I('search') ? I('search') : '';
    	$page = I('p') ? I('p') : 1;
    	$start_time = I('start_time') ? I('start_time') : '';
        $end_time = I('end_time') ? I('end_time') : '';
        $keywords = I('keywords') ? I('keywords') : '';
        if($profile_order){
            $condition['dc_log.profile_order'] = array('like',"%".$profile_order."%");
        }
        if($start_time && $end_time){
            $condition['dc_log.sub_time'] = array('EGT',strtotime($start_time));
            $condition['dc_log.sub_time'] = array('ELT',strtotime($end_time));
        }   
        if($keywords){
            $condition['dc_log.problem_desc'] = array('like',"%".$keywords."%");
        }
    	$count = M('log')->where($condition)->count();
    	$data = paginations($page,$count,25);
	  	$data['lists'] = M('log')
        ->join('dc_mp on dc_log.log_token = dc_mp.token')
	  	->where($condition)
		->limit("$data[start],25")
		->order('log_addtime desc')
		->select();
		$this->assign('search',$search);
    	$this->assign('data',$data);
        $this->display();
    }        

    /**
	*日志详情
    */
    public function content_mess(){
    	$cid = I('cid') ? I('cid') : '';
    	$mess_data = M('affiche')->where("cid=$cid")->find();
    	$this->assign('mess_data',$mess_data);
    	$this->display();
    }

    /**
	*日志删除
    */
    public function content_dele(){
    	$str = I('id');
    	$lengths = strlen($str);
        $val = substr($str,0,lengths-1);
        $res = M('affiche')->delete($val);
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
	*发布公告
    */
    public function content_add(){
    	if(!IS_POST){
    		$this->display();
    	}else{
    		$form_data = $_POST;
    		$form_data['affiche_time'] = time();
    		$res = M('affiche')->add($form_data);
    		// print_r($form_data);
    		if($res){
    			$this->redirect('content');
    		}else{
    			$tihs->error('操作失败');
    		}
    	}
    }

    /**
    *删除单条
    */
    public function content_deleone(){
        $id = I('id');
        $res = M('affiche')->where("cid=$id")->delete();
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
    *公告编辑
    */
    public function content_edit(){
        if(!IS_POST){
            $cid = I('cid') ? I('cid') : '';
            $data = M('affiche')->where("cid=$cid")->find();
            $this->assign('data',$data);
            $this->display();
        }else{
            $form_data = $_POST;
            $res = M('affiche')->where("cid=$form_data[cid]")->save($form_data);
            if($res){
                $this->redirect('content');
            }else{
                $this->error('操作失败');
            }
        }
    }
    /*
     * 文件日志
     */
    public function filelog(){
        $this->display();
    }


    /*
     * sql日志文件
     */
    public function sqlfilelog(){
        $this->display();
    }
}

?>