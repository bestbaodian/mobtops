<?php

namespace Websites\Controller;
use Websites\Controller\BcController;
use Think\Controller;
use Think\Hook;
header("Content-Type: text/html; charset=utf-8");
class IndexController extends Controller{
	public function lists(){
		$where['id']=isset($_GET['id'])?$_GET['id']:'6';
		$data=M('wang_wangzhan')->where($where)->select();
		$this->assign('data',$data);
		$this->display();
	}
	
}
?>
