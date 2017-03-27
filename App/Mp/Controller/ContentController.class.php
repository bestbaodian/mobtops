<?php 
namespace Mp\Controller;
use Mp\Controller\BaseController;
/**
 * 消息中心控制器
 * @author 魔派<180256122@qq.com>
 */
class ContentController extends BaseController {
    
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
            'title' => '网站管理',
            'url' =>U('Wang/lists'),
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
	*消息中心
	*/
    public function content(){
    	$search = I('search') ? I('search') : '';
    	$uid = session('user_id');
    	$page = I('p') ? I('p') : 1;
    	if($search){
    		$condition['affiche_title'] = array('like',"%".$search."%");
    	}
    	$count = M('affiche')->where($condition)->count();
    	$data = paginations($page,$count,25);
	  	$data['lists'] = M('affiche')
	  	->join('dc_user_afficheread on dc_affiche.cid = dc_user_afficheread.cid')
	  	->join('dc_user on dc_user_afficheread.uid = dc_user.id')
	  	->where("dc_user_afficheread.uid = $uid")
		->limit("$data[start],25")
		->order('affiche_time desc')
		->select();
		$this->assign('search',$search);
    	$this->assign('data',$data);
    	// print_r($data);die;
        $this->display();
    }        

    /**
	*消息详情
    */
    public function content_mess(){
    	$cid = I('cid') ? I('cid') : '';
    	$uid = session('user_id');
    	$mess_data = M('affiche')->where("cid=$cid")->find();
    	$save['is_read'] = 1;
    	$re = M('user_afficheread')->where("uid=$uid AND cid=$cid")->save($save);
    	$this->assign('mess_data',$mess_data);
    	$this->display();
    }
}

?>