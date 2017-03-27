<?php 

namespace Websites\Controller;
use Common\Controller\CommonController;

/**
 * 后台公用控制器
 * @author 魔派<180256122@qq.com>
 */
class BcController extends CommonController {

	/**
	 * 初始化
	 * @author 魔派<180256122@qq.com>
	 */
	public function _initialize() {
		parent::_initialize();
		global $_G;
        if ($this->user_access['admin']) {
            $topmenu[] = array(
                'title' => '管理控制台',
                'url' => U('Admin/Index/index'),
                'class' => ''
            );
        }
		$topmenu[] = array(
			'title' => '公众号管理',
			'url' => U('Mp/mp/lists'),
			'class' => ''
		);
        $this->assign('topmenu', $topmenu);
		$this->assign('user_info', get_user_info());
	}
}


?>