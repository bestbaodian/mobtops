<?php 
namespace Workorder\Controller;
use Workorder\Controller\BaseController;
/**
 * 企信管理控制器
 * @author 魔派<180256122@qq.com>
 */
class QiController extends BaseController {
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
			'title' => '企信管理',
			'url' =>U('Qi/lists'),
			'class' => ''
		);
               $topmenu[] = array(
			'title' => '工作任务',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '公共信息',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '客户',
			'url' => U('Useres/lists'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '销售',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '服务',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '合同',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '人力资源',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '行政',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '会议',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '物流',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '档案',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '财务',
			'url' => U('Money/lists'),
			'class' => ''
		);
                $this->assign('topmenu', $topmenu);
                $this->display();
	}
        
        
        /*
        @客户管理
        */
        public function customer(){
             $topmenu[] = array(
			'title' => '管理控制台',
			'url' =>U('Admin/Index/index'),
			'class' => ''
		);
              $topmenu[] = array(
			'title' => '企信管理',
			'url' =>U('Qi/lists'),
			'class' => ''
		);
              $topmenu[] = array(
			'title' => '工作任务',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '公共信息',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '客户管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '销售管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '服务管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '合同管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '人力资源',
			'url' => U('Resources/resources'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '行政管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '会议管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '物流管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '档案管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $topmenu[] = array(
			'title' => '登记管理',
			'url' => U('Qi/customer'),
			'class' => ''
		);
                $this->assign('topmenu', $topmenu);
	}
	/**
	 * 企信管理 
	 * @author 魔派<180256122@qq.com>
	 */
	public function lists() {
            if(!$_POST){
                $this->display();
            }else{
                echo "后续开发在此开发";
            }
        }
}

?>