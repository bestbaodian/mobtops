<?php
namespace Schooles\Controller;
use Schooles\Controller\BaseController;
/**
 * 普通管理控制器
 * @author 魔派<180256122@qq.com>
 */
class SchoolesController extends BaseController {
    /**
     * @author 魔派<180256122@qq.com>
     */
    public function lists(){
        $where['id']=$_SESSION['user_id'];
        $arr=M("user")->where($where)->field("id,yuming")->find();
    	$search = I('search');
        if($search){
            $condition['username'] = array('like',"%".$search."%");
            $condition['nickname'] = array('like',"%".$search."%");
            $condition['email'] = array('like',"%".$search."%");
            $condition['_logic'] = 'OR';
        }else{
            $condition['dc_rbac_role_user.role_id']=6;
            $condition['school']=$arr['yuming'];         
        }
        $count = M('user')->join("dc_rbac_role_user on dc_user.id=dc_rbac_role_user.user_id")->where($condition)->count();
        $pages = paginations($page,$count,25);
        $arr = M('user')->join("dc_rbac_role_user on dc_user.id=dc_rbac_role_user.user_id")->where($condition)->select();
        $pages['lists'] = $arr;
        $this->assign("school",$condition['school']);
        $this->assign('data',$pages);
        $this->display();
    }
    /*
    新增教师用户
     */
    public function add(){
        if(IS_POST){
            $data=$_POST;
            $where['id']=$_SESSION['user_id'];
            $arr=M("user")->where($where)->field("id,yuming")->find();
            $data['password']=md5($_POST['password']);
            $data['school']=$arr['yuming'];
            $data['nickname']=$_POST['username'];
            $user_id=M("user")->add($data);
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
        }else{
             $this->addNav('用户管理', '', 'active')
                 ->setModel('user')
                 ->addFormField('username', '用户名', 'text',array('placeholder'=>'请输入用户名'))
                 ->addFormField('password', '密码', 'password')
                 ->addFormField('confirm_password', '确认密码', 'password')
                 ->addFormField('email', '邮箱', 'email',array('placeholder'=>'请输入您的邮箱'))
                 ->addFormField('roles', '用户角色', 'checkbox', array('options'=>'callback','callback_name'=>'get_user_roles'))
                 ->common_add();
        }
    }
      public function adds() {
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
                 ->addFormField('username', '用户名', 'text',array('placeholder'=>'请输入用户名'))
                 ->addFormField('password', '密码', 'password')
                 ->addFormField('confirm_password', '确认密码', 'password')
                 ->addFormField('email', '邮箱', 'email',array('placeholder'=>'请输入您的邮箱'))
                 ->addFormField('roles', '用户角色', 'checkbox', array('options'=>'callback','callback_name'=>'get_user_roles'))
                 ->common_add();
        }
    }
    /**
     * 获取用户角色
     * @author 魔派<180256122@qq.com>
     */
    public function get_user_roles() {
    	$where['id']=6;
        $results = M('rbac_role')->where($where)->select();
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