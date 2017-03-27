<?php 
namespace Admin\Controller;
use Admin\Controller\BaseController;
/**
 * 消息中心控制器
 * @author 魔派<180256122@qq.com>
 */
class ContentController extends BaseController {
	/**
	*消息中心
	*/
    public function content(){
    	$search = I('search') ? I('search') : '';
    	$page = I('p') ? I('p') : 1;
    	if($search){
    		$condition['affiche_title'] = array('like',"%".$search."%");
    	}
    	$count = M('affiche')->where($condition)->count();
    	$data = paginations($page,$count,25);
	  	$data['lists'] = M('affiche')
	  	->where($condition)
		->limit("$data[start],25")
		->order('affiche_time desc')
		->select();
		$this->assign('search',$search);
    	$this->assign('data',$data);
        $this->display();
    }        

    /**
	*消息详情
    */
    public function content_mess(){
    	$cid = I('cid') ? I('cid') : '';
    	$mess_data = M('affiche')->where("cid=$cid")->find();
    	$this->assign('mess_data',$mess_data);
    	$this->display();
    }

    /**
	*消息删除
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
            if($res){
                $userData = M('user')->field('id')->select();
                foreach ($userData as $key => $value) {
                    $addData[$key]['cid'] = $res;
                    $addData[$key]['uid'] = $value['id'];
                }
                $re = M('user_afficheread')->addAll($addData);
                if($re){
                    $this->redirect('content');
                }else{
                    $this->error('操作失败');
                }
            }else{
    			$this->error('操作失败');
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
}

?>