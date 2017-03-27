<?php 

namespace Mp\Behavior;
use Think\Behavior;
/**
 * 生成侧边栏导航行为类
 * @author 魔派<180256122@qq.com>
 */
class SidenavBehavior extends Behavior {

	public function run(&$params) {
                if (CONTROLLER_NAME == 'Gongdan' || get_addon()) {
			$sidenav[] = array(
				'title' => '工单管理',
				'url' => 'javascript:;',
				'class' => 'icon icon-home',
				'attr' => 'data="icon"',
                                        'children' => array(                                             
						array(
							'title' => '工单服务',
							'url' => U('Gongdan/profile'),
							'class' => ''
						)
					)
			);
		}
           
		 elseif (CONTROLLER_NAME == 'School' || get_addon()) {
			$sidenav[] = array(
				'title' => '账号管理',
				'url' => 'javascript:;',
				'class' => 'icon icon-home',
				'attr' => 'data="icon"',
                'children' => array(                                             
						array(
							'title' => '学校账号',
							'url' => U('School/School/lists'),
							'class' => ''
						),
						array(
							'title' => '教师账号',
							'url' => U(''),
							'class' => ''
						),
						array(
							'title' => '学生账号',
							'url' => U(''),
							'class' => ''
						)
					)
			);
		}
		 elseif (CONTROLLER_NAME == 'Schooles' || get_addon()) {
			$sidenav[] = array(
				'title' => '账号管理',
				'url' => 'javascript:;',
				'class' => 'icon icon-home',
				'attr' => 'data="icon"',
                'children' => array(                                             
						array(
							'title' => '教师列表',
							'url' => U('Schooles/Schooles/lists'),
							'class' => ''
						),
						array(
							'title' => '学生管理',
							'url' => U(''),
							'class' => ''
						),
						array(
							'title' => '教师申请',
							'url' => U(''),
							'class' => ''
						)
					)
			);
		}
		elseif (CONTROLLER_NAME == 'Teacher' || get_addon()) {
			$sidenav[] = array(
				'title' => '账号管理',
				'url' => 'javascript:;',
				'class' => 'icon icon-home',
				'attr' => 'data="icon"',
                'children' => array(                                             
						array(
							'title' => '教师管理',
							'url' => U('Schooles/Schooles/lists'),
							'class' => ''
						)
					)
			);
		}
        elseif (CONTROLLER_NAME == 'Content' || get_addon()) {
			$sidenav[] = array(
				'title' => '消息中心',
				'url' => 'javascript:;',
				'class' => 'icon icon-home',
                                'children' => array(
                        array(
							'title' => '工单服务',
							'url' => U('Mp/Gongdan/profile'),
							'class' => ''
						),
						array(
							'title' => '公告中心',
							'url' => U('Mp/Content/content'),
							'class' => ''
						)                                        
					)
			);
		}
	else{
			
		}
		return $sidenav;
	}
}
 ?>