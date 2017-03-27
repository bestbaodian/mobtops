<?php 

namespace Admin\Controller;
use Admin\Controller\BaseController;

/**
 * RBAC角色管理控制器
 * @author 魔派<180256122@qq.com>
 */
class RoleController extends BaseController {

	/**
	 * 角色列表
	 * @author 魔派<180256122@qq.com>
	 */
	public function lists() {
		$data = M('rbac_role')->select();
		foreach($data as $k => $v){
			$data[$k]['num'] = $this->get_role_mp_count($v['id']);
		}
		$counts = count($data);
		if(!$data){
			$this->error('获取角色列表失败');
		}else{
			$this->assign('data',$data);
			$this->assign('counts',$counts);
			$this->display();
		}
	}
	/**
	 * 添加角色
	 * @author 魔派<180256122@qq.com>
	 */
	public function add(){
			 $this->addNav('角色管理', '', 'active')
			 ->setModel('rbac_role')
			 ->addFormField('name', '角色名称', 'text', array('placeholder'=>'管理员'))
			 ->addFormField('remark', '角色描述', 'textarea')
			 ->addFormField('type', '角色类型', 'radio', array('options'=>array('admin_manager'=>'后台管理员','mp_manager'=>'公众号管理员','wangzhan_manager'=>'普通管理员','school_manager'=>'学校管理员','teacher_manager'=>'教师管理员'),'value'=>'mp_manager','tip'=>'在没有设置角色访问授权的前提下，角色类型起作用。系统管理员可以进入系统后台和公众号管理后台，后台管理员仅能进入系统后台，公众号管理员仅能进入公众号管理后台'))
			 ->addFormField('status', '状态', 'radio', array('options'=>array(0=>'禁用',1=>'正常'),'value'=>1))
			 ->addValidate('name', 'require', '角色名称不能为空', 1, 'regex', 3)
			 ->addAuto('pid', 0)
			 ->common_add();
	}

	/**
	 * 编辑角色
	 * @author 魔派<180256122@qq.com>
	 */
	public function edit() {
			 $this->addNav('编辑角色', '', 'active')
			 ->setModel('rbac_role')
			 ->addFormField('name', '角色名称', 'text', array('placeholder'=>'管理员'))
			 ->addFormField('remark', '角色描述', 'textarea')
			 ->addFormField('type', '角色类型', 'radio', array('options'=>array('admin_manager'=>'后台管理员','mp_manager'=>'公众号管理员','wangzhan_manager'=>'普通管理员','school_manager'=>'学校管理员','teacher_manager'=>'教师管理员'),'tip'=>'在没有设置角色访问授权的前提下，角色类型起作用。系统管理员可以进入系统后台和公众号管理后台，后台管理员仅能进入系统后台，公众号管理员仅能进入公众号管理后台'))
			 ->addFormField('status', '状态', 'radio', array('options'=>array(0=>'禁用',1=>'正常')))
			 ->addValidate('name', 'require', '角色名称不能为空', 1, 'regex', 3)
			 ->setFormData(M('rbac_role')->find(I('id')))
			 ->setEditMap(array('id'=>I('get.id')))
			 ->common_edit();
	}

	/**
	 * 删除角色
	 * @author 魔派<180256122@qq.com>
	 */
	public function delete() {
		$role_id = I('id');
		M('rbac_mp_access')->where(array('role_id'=>$role_id))->delete();
		M('rbac_access')->where(array('role_id'=>$role_id))->delete();
		$res = M('rbac_role')->delete($role_id);
		if (!$res) {
			$this->error('删除角色失败');
		} else {
			$this->success('删除角色成功', U('lists'));
		}
	}

	/**
	 * 访问授权管理
	 * @author 魔派<180256122@qq.com>
	 */
	public function access() {
		if (IS_POST) {
			$nodes = I('nodes');
			foreach ($nodes as $k => $v) {
				$tmp = explode('_', $v);
				$data['node_id'] = $tmp[0];
				$data['level'] = $tmp[1];
				$data['role_id'] = I('role_id');
				$datas[] = $data;
			}
			$Access = M('rbac_access');
			if (!$Access->autoCheckToken($_POST)) {
				$this->error('表单令牌错误');
			} else {
				$Access->where(array('role_id'=>I('role_id')))->delete();
				if ($nodes) {
					$res = $Access->addAll($datas);
					if ($res === false) {
						$this->error('编辑访问授权出现错误');
					}
				}
				$this->success('编辑访问授权成功', U('lists'));
			}
		} else {
			$results = M('rbac_node')->order('sort desc')->select();
			$access = M('rbac_access')->field('node_id')->where(array('role_id'=>I('role_id')))->select();
			foreach ($access as $k => $v) {
				$access_nodes[] = $v['node_id'];
			}
			$nodes = $this->parse_node($results, $access_nodes);
			print_r($nodes);die;
			$this->addCrumb('系统管理', U('Index/index'), '')
				 ->addCrumb('角色管理', U('Role/lists'), '')
				 ->addCrumb('访问授权', '', 'active')
				 ->addNav('访问授权', '', 'active')
				 ->assign('nodes', $nodes)
				 ->assign('role_id', I('role_id'))
				 ->display();
		}	
	}

	/**
	 * 功能授权
	 * @author 魔派<180256122@qq.com>
	 */
	public function mp_access() {
		if (IS_POST) {
			$data['role_id'] = I('role_id');
			$data['mp_count'] = I('mp_count');
			$data['register_invite_count'] = I('register_invite_count');
			$data['mp_groups'] = json_encode(I('mp_groups'));
			$data['addons'] = json_encode(I('addons'));
			M('rbac_mp_access')->where(array('role_id'=>I('role_id')))->delete();
			$res = M('rbac_mp_access')->add($data);
			if (!$res) {
				$this->error('编辑功能授权失败');
			} else {
				$this->success('编辑功能授权成功', U('lists'));
			}
		} else {
			$this->addCrumb('系统管理', U('Index/index'), '')
				 ->addCrumb('角色管理', U('Role/lists'), '')
				 ->addCrumb('功能授权', '', 'active')
				 ->addNav('功能授权', '', 'active')
				 ->setModel('rbac_mp_access')
				 ->addFormField('role_id', '角色ID', 'hidden', array('value'=>I('role_id')))
				 ->addFormField('mp_count', '可创建公众号数量', 'number', array('placeholder'=>'填0表示不限制，填负数或者不填表示不能创建'))
				 ->addFormField('register_invite_count', '可邀请注册数', 'number', array('placeholder'=>'填0表示不限制，填负数或者不填表示不能创建','tip'=>'在开启邀请注册功能时，该角色的用户能创建的邀请码数量'))
				 ->addFormField('mp_groups', '可使用的功能套餐', 'checkbox', array('options'=>'callback','callback_name'=>'get_mp_group'))
				 ->addFormField('addons', '附加插件权限', 'checkbox', array('options'=>'callback','callback_name'=>'get_installed_addons','tip'=>'该角色能使用的插件为此项选择的插件与所选功能套餐包含的插件总和'))
				 ->setFormData(M('rbac_mp_access')->where(array('role_id'=>I('role_id')))->find())
				 ->common_edit();
		}
	}

	/**
	 * 解析节点数组
	 * @author 魔派<180256122@qq.com>
	 */
	private function parse_node($nodes, $access_nodes, $pid = 0) {
		$arr = array();
		foreach ($nodes as $k => $v) {
			if (in_array($v['id'], $access_nodes)) {
				$v['checked'] = 1;
			}
			if ($v['pid'] == $pid) {
				$v['children'] = $this->parse_node($nodes, $access_nodes, $v['id']);
				$arr[] = $v;
			}
		}
		return $arr;
	}

	/**
	 * 获取公众号套餐
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_mp_group() {
		$lists = M('mp_group')->select();
		foreach ($lists as $k => $v) {
			$options[$v['id']] = $v['name']; 
		}
		return $options;
	}

	/**
	 * 获取已安装的插件
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_installed_addons() {
		$installed_addons = D('Addons')->get_installed_addons();
		foreach ($installed_addons as $k => $v) {
			$addons[$v['bzname']] = $v['name'];
		}
		return $addons;
	}

	/**
	 * 获取角色可创建公众号的数量
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_role_mp_count($role_id) {
		$mp_count = M('rbac_mp_access')->where(array('role_id'=>$role_id))->getField('mp_count');
		return $mp_count == 0 ? '不限' : $mp_count;
	}

	/**
    *搜索
    *@author 任海峰<273086429@qq.com>
    */
    public function search(){
        $search = I('search');
        $condition['name'] = array('like',"%".$search."%");
        $results = M('rbac_role')->where($condition)->select();
        foreach($results as $k => $v){
			$results[$k]['num'] = $this->get_role_mp_count($v['id']);
		}
        $counts = count($results);
        $this->assign('search',$search);
        $this->assign('data',$results);
        $this->assign('counts',$counts);
        $this->display('lists');
    }

    /**
    *权限设置
    *@author 任海峰<273086429@qq.com>
    */
    public function empower(){
    	$id = I('id');
    	$checks = M('rbac_access')->where('role_id='.$id)->select();
    	$results = M('rbac_node')->select();
		$nodes = $this->list_level($results);
		$this->assign('id',$id);
		$this->assign('checks',$checks);
		$this->assign('nodes',$nodes);
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
                $this->list_level($arr,$v['id'],$level+1);
            }
        }
        return $data;
    }

    /**
    *权限入库
    */
    public function empower_pro(){
    	$role_id = I('post.role_id');
    	$new_val = I('post.new_val');
    	//删除原来权限
    	M('rbac_access')->where("role_id=$role_id")->delete();
    	$privileges = explode(',',$new_val);
    	//赋值新权限
		foreach($privileges as $k=>$v){
            $save_privileges['role_id']=$role_id;
            $save_privileges['node_id']=$v;
            $new_pri_data[]=$save_privileges;
    	}
    	// print_r($new_pri_data);
		$re = M('rbac_access')->addALL($new_pri_data);
		if($re){
				$data = array();
				$data['own_read'] = I('post.new_own_read_id');
				$data['own_edit'] = I('new_own_edit_id');
				$data['own_delete'] = I('new_own_delete_id');
				$data['group_read'] = I('new_group_read_id');
				$data['group_edit'] = I('new_group_edit_id');
				$data['group_delete'] = I('new_group_delete_id');
				$data['all_read'] = I('new_all_read_id');
				$data['all_edit'] = I('new_all_edit_id');
				$data['all_delete'] = I('new_all_delete_id');
				foreach($data as $k =>$v){
					if(!empty($data[$k])){
						$save_data = explode(',', $v);
						for($i=0;$i<count($save_data);$i++){
							M('rbac_access')->where("node_id = $save_data[$i]")->save(array($k=>'1'));
						}
					}
				}
    			$data['status'] = 1;
    			$data['info'] = '操作成功';
    			$this->AjaxReturn($data);
		}else{
			$data['status'] = 0;
			$data['info'] = '操作失败';
			$this->AjaxReturn($data);
		}
    }

    /**
	*检测父节点是否选中
    */
    public function check_true(){
    	$id = I('get.id');
    	$data = M('rbac_node')->where("id = $id")->field('pid')->find();
    	$this->AjaxReturn($data['pid']);
    }
    /**
    *检测父节点下的子节点
    */
    public function check_fu(){
    	$id = I('get.id');
    	$data = M('rbac_node')->where("pid = $id")->field('id')->select();
    	$this->AjaxReturn($data);
    }


}

?>