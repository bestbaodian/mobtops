<?php

namespace School\Controller;
use Think\Controller;

/**
 * 用户管理控制器
 * @author 魔派<180256122@qq.com>
 */
class UserController extends BaseController {

    /**
     * 添加用户
     * @author 魔派<180256122@qq.com>
     */
    public function add() {
        if (IS_POST) {
            $_validate = array(
                array('username', 'require', '用户名不能为空', 1, 'regex', 3),
                array('username', '', '用户已存在', 2, 'unique', 1),
                array('username', '6,20', '用户名长度在6至20个字符之间', 2, 'length', 1),
                array('password', 'require', '密码不能为空', 1, 'regex', 1),
                array('password', '6,20', '密码长度在6至20个字符之间', 2, 'length', 1),
                array('confirm_password', 'require', '确认密码不能为空', 0, 'regex', 1),
                array('confirm_password', 'password', '确认密码不正确', 0, 'confirm', 1),
                array('email', 'require', '邮箱不能为空', 1, 'regex', 3),
                array('email', 'email', '邮箱格式不正确', 2, 'regex', 3),
                array('email', '', '邮箱已存在', 2, 'unique', 1)
            );
            $_auto = array(
                array('password', 'md5', 3, 'function'),
                array('nickname', 'username', 1, 'field'),
                array('register_time', 'time', 1, 'function')
            );
            $User = M('user');
            $User->setProperty('_validate', $_validate);
            $User->setProperty('_auto', $_auto);
            if (!$User->create()) {
                $this->error($User->getError());
            } else {
                $user_id = $User->add();
                if ($user_id) {
                    foreach (I('roles') as $k => $v) {
                        $data['user_id'] = $user_id;
                        $data['role_id'] = $v;
                        $datas[] = $data;
                    }
                    M('rbac_role_user')->addAll($datas);
                    $this->success('添加用户成功', U('lists'));
                } else {
                    $this->error('添加用户失败');
                }
            }
        } else {
            $this->addNav('用户管理', '', 'active')
                 ->setModel('user')
                 ->addFormField('username', '用户名', 'text')
                 ->addFormField('password', '密码', 'password')
                 ->addFormField('confirm_password', '确认密码', 'password')
                 ->addFormField('email', '邮箱', 'email')
                 ->addFormField('roles', '用户角色', 'checkbox', array('options'=>'callback','callback_name'=>'get_user_roles'))
                 ->addFormField('yuming', '域名名称', 'text', array('placeholder'=>'请输入域名名称'))
                 ->common_add();
        }
    }
    public function check_status(){
        $data['status'] = I('get.status');
        $id = I('get.id');
        $res = M('user')->where("id=$id")->save($data);
        if($res){
            echo 1;exit;
        }else{
            echo 0;exit;
        }
    }

    /**
     * 编辑用户
     * @author 魔派<180256122@qq.com>
     */
    public function edit() {
        $id=$_GET['id'];
        $results = M('rbac_role_user')->field('role_id')->where(array('user_id'=>$id))->select();
        foreach ($results as $k => $v) {
            $roles[] = $v['role_id'];
        }
        $user = M('user')->find(I('id'));
        $data = json_encode($roles);
        $this->assign('res',$user);
        $this->display();
    }
    public function edits(){
        $id = I('id');
        if(IS_POST){
            $data = $_POST;
            $res = M('user')->where('id='.$id)->save($data);
            if($res!== flase){
                header("Location:".U('Admin/User/lists')."");
            }else{
                $this -> error('修改失败!');
            }
        }
    }
    /**
     * 用户列表
     * @author 魔派<180256122@qq.com>
     */
    public function lists() {
        $search = isset($_POST['search']) ? $_POST['search'] : '';
        if($search){
            $condition['username'] = array('like',"%".$search."%");
            $condition['nickname'] = array('like',"%".$search."%");
            $condition['email'] = array('like',"%".$search."%");
            $condition['_logic'] = 'OR';
        }else{
            $condition = "";
        }
        $page = isset($_GET['p']) ? $_GET['p'] : 1;
        $data = pagination($page,'user',$condition,25);
        foreach($data['lists'] as $k => $v){
                $data['lists'][$k]['register_time'] = date('Y-m-d H:i:s',$v['register_time']);
                $data['lists'][$k]['callback_name'] = $this->parse_roles($v['id']);
            }
        $this->assign('data',$data);
        $this->display();
    }
    
    public function page(){
        $search = isset($_GET['search']) ? $_GET['search'] : '';
        $page = isset($_GET['p']) ? $_GET['p'] : 1;
        if($search){
            $condition['username'] = array('like',"%".$search."%");
            $condition['nickname'] = array('like',"%".$search."%");
            $condition['email'] = array('like',"%".$search."%");
            $condition['_logic'] = 'OR';
        }else{
            $condition = "";
        }
        $data = pagination($page,'user',$condition,25);
        foreach($data['lists'] as $k => $v){
                $data['lists'][$k]['register_time'] = date('Y-m-d H:i:s',$v['register_time']);
                $data['lists'][$k]['callback_name'] = $this->parse_roles($v['id']);
            }
        $this->assign('data',$data);
        $this->display();
    }

    /**
     * 删除用户
     * @author 魔派<180256122@qq.com>
     */
    public function delete() {
        $user_id = I('id');
        M('rbac_role_user')->where(array('user_id'=>$user_id))->delete();
        M('mp')->where(array('user_id'=>$user_id))->delete();
        $res = M('user')->delete($user_id);
        if (!$res) {
            $this->error('删除用户失败');
        } else {
            $this->success('删除用户成功', U('lists'));
        }
    }

    public function delall(){
        $id = I('id');
        $lengths = strlen($id);
        $val = substr($id,0,lengths-1);
        // echo $val;die;
        $res = M('user')->delete($val);
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
     * 获取用户角色
     * @author 魔派<180256122@qq.com>
     */
    public function get_user_roles() {
        $results = M('rbac_role')->select();
        foreach ($results as $k => $v) {
            $roles[$v['id']] = $v['name'];
        }
        return $roles;
    }

    /**
     * 格式化显示用户所属角色
     * @author 魔派<180256122@qq.com>
     */
    public function parse_roles($user_id) {
        $role_users = M('rbac_role_user')->field('role_id')->where(array('user_id'=>$user_id))->select();
        foreach ($role_users as $k => $v) {
            $role = M('rbac_role')->where(array('id'=>$v['role_id']))->getField('name');
            $roles[] = $role;
        }
        return implode(',', $roles);
    }

}

?>
