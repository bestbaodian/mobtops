<?php 
namespace Mp\Controller;
use Mp\Controller\BaseController;
/**
 * 公众号支付控制器
 * @author 魔派<180256122@qq.com>
 */
class UsersController extends BaseController {
	/**
	 * 微信支付
	 * @author 魔派<180256122@qq.com>
	 */
	public function wechat() {
		global $_G;
		C('TOKEN_ON', false);
		$MpSetting = D('MpSetting');
		if (IS_POST) {
			$settings = I('post.');
			if (!$MpSetting->add_settings($settings)) {
				$this->error('保存设置失败');
			} else {
				$this->success('保存设置成功');
			}
		} else {
			$mp_info = get_mp_info();
			$this->addCrumb('公众号管理', U('Mp/Index/index'), '')
				 ->addCrumb('微信支付', U('Mp/Payment/wechat'), '')
				 ->addCrumb('支付配置', '', 'active')
				 ->addNav('支付配置', '', 'active')
				 ->addNav('支付记录', U('record'), '')
				 ->setTip('使用微信支付前你需要配置支付授权目录：'.$_G['site_url'])
				 ->setModel('mp_payment')
				 ->addFormField('appid', '公众号APPID', 'text', array('value'=>$mp_info['appid']))
				 ->addFormField('appsecret', '公众号APPSECRET', 'text', array('value'=>$mp_info['appsecret']))
				 ->addFormField('mchid', '微信商户号', 'text')
				 ->addFormField('paysignkey', '微信支付秘钥', 'text')
				 ->setFormData($MpSetting->get_settings())
				 ->common_edit();
		}
	}
        /*
            公众号管理    paymmentController.class.php
        */
        public function lists() {      
		$mp_count = M('mp')->where(array('user_id'=>get_user_id()))->count();
		if ($this->user_access['mp_count'] === 0 || $mp_count < $this->user_access['mp_count']) {
			$btn = array(
				'title' => '添加公众号',
				'url' => U('Payment/add'),
				'class' => 'btn btn-primary'
			);
			$this->addButton($btn);
		}
		if ($this->user_access['mp_count'] !== 0) {
			$tip = '你最多只能创建  '.$this->user_access['mp_count'].'  个公众号';
			$this->setTip($tip);
		}
		$this->addCrumb('公众号管理', U('Mp/Index/index'), '')
			 ->addCrumb('公众号列表', '', 'active')
			 ->addNav('公众号列表', '', 'active')
			 ->setModel('mp')
			 ->setListMap(array('user_id'=>get_user_id()))
			 ->setListOrder('create_time desc')
			 ->addListItem('name', '公众号名称')
			 ->addListItem('type', '公众号类型', 'enum', array('options'=>array(1=>'普通订阅号',2=>'认证订阅号',3=>'普通服务号',4=>'认证服务号',5=>'测试号')))
			 ->addListItem('status', '状态', 'enum', array('options'=>array(0=>'禁用',1=>'正常',2=>'审核中')))
			 ->addListItem('create_time', '创建时间', 'function', array('function_name'=>'date','params'=>'Y-m-d H:i:s,###'))
			 ->addListItem('id', '操作', 'custom', array('options'=>array('manage'=>array('管理',U('Mp/Index/index',array('mpid'=>'{id}')),'btn btn-primary btn-sm icon-home',''),'edit'=>array('编辑',U('Mp/Payment/edit',array('id'=>'{id}')),'btn btn-success btn-sm icon-edit'),'delete'=>array('删除',U('Mp/Payment/delete',array('id'=>'{id}')),'btn btn-danger btn-sm icon-delete'))))
			 ->common_lists();
            
	}
        /*添加公众号*/
        public function add() {
		$mp_count = M('mp')->where(array('user_id'=>get_user_id()))->count();
		if ($this->user_access['mp_count'] !== 0 && $mp_count >= $this->user_access['mp_count']) {
			$this->error('你最多只能创建'.$this->user_access['mp_count'].'个公众号');
		}
		$this->addCrumb('公众号管理', U('Mp/Index/index'), '')
			 ->addCrumb('公众号列表', U('Mp/Mp/lists'))
			 ->addCrumb('添加公众号', '', 'active')
			 ->addNav('添加公众号', '', 'active')
			 ->setModel('mp')
			 ->addFormField('name', '名称', 'text')
			 ->addFormField('type', '类型', 'radio', array('options'=>array(1=>'普通订阅号',2=>'认证订阅号',3=>'普通服务号',4=>'认证服务号',5=>'测试号'),'value'=>4,'is_must'=>1))
			 ->addFormField('origin_id', '原始ID', 'text', array('is_must'=>1))
			 ->addFormField('mp_number', '微信号', 'text')
			 ->addFormField('appid', 'APPID', 'text')
			 ->addFormField('appsecret', 'APPSECRET', 'text')
			 ->addFormField('headimg', '头像', 'image')
			 ->addFormField('qrcode', '二维码', 'image')
			 ->setValidate(array(
					array('name', 'require', '公众号名称不能为空'),
					array('type', 'require', '请选择公众号类型'),
					array('origin_id', 'require', '公众号原始ID不能为空'),
					array('origin_id', '/^gh_[0-9|a-z]{12}$/', '公众号原始ID格式错误'),
					array('origin_id', '', '具有相同原始ID的公众号已存在', 0, 'unique', 1),
			   ))
			 ->setAuto(array(
					array('status', '1'),
					array('create_time', 'time', 1, 'function'),
					array('valid_token', 'get_nonce', 1, 'function'),
					array('token', 'get_nonce', 1, 'function', '32'),
					array('encodingaeskey', 'get_nonce', 1, 'function', '43'),
					array('user_id', 'get_user_id', 1, 'function')
			   ))
			 ->common_add();
	}
        /*删除公众号*/
        public function delete() {
		$this->setModel('mp')
			 ->setDeleteMap(array('id'=>I('get.id')))
			 ->common_delete();
	}
        /**
	 * 编辑公众号
	 * @author 魔派<180256122@qq.com>
	 */
	public function edit() {
		$this->addCrumb('公众号管理', U('Mp/Index/index'), '')
			 ->addCrumb('公众号列表', U('Mp/Mp/lists'), '')
			 ->addCrumb('编辑公众号', '', 'active')
			 ->addNav('编辑公众号', '', 'active')
			 ->setModel('mp')
			 ->addFormField('name', '公众号名称', 'text')
			 ->addFormField('type', '公众号类型', 'radio', array('options'=>array(1=>'普通订阅号',2=>'认证订阅号',3=>'普通服务号',4=>'认证服务号',5=>'测试号')))
			 ->addFormField('status', '状态', 'radio', array('options'=>array(0=>'禁用',1=>'正常',2=>'审核中')))
			 ->addFormField('origin_id', '原始ID', 'text', array('is_must'=>1))
			 ->addFormField('mp_number', '微信号', 'text')
			 ->addFormField('appid', 'APPID', 'text')
			 ->addFormField('appsecret', 'APPSECRET', 'text')
			 ->addFormField('headimg', '头像', 'image')
			 ->addFormField('qrcode', '二维码', 'image')
			 ->setFormData(M('mp')->find(I('get.id')))
			 ->setEditMap(array('id'=>I('get.id')))
			 ->setValidate(array(
					array('name', 'require', '公众号名称不能为空'),
					array('type', 'require', '请选择公众号类型'),
					array('origin_id', 'require', '公众号原始ID不能为空'),
					array('origin_id', '/^gh_[0-9|a-z]{12}$/', '公众号原始ID格式错误'),
			   ))
			 ->common_edit();
	}

	/**
	 * 支付记录
	 * @author 魔派<180256122@qq.com>
	 */
	public function record() {
		$this->addCrumb('公众号管理', U('Index/index'), '')
			 ->addCrumb('微信支付', U('Payment/wechat'), '')
			 ->addCrumb('支付记录', '', 'active')
			 ->addNav('支付配置', U('Payment/wechat'), '')
			 ->addNav('支付记录', '', 'active')
			 ->setModel('mp_payment')
			 ->setListOrder('create_time desc')
			 ->addListItem('orderid', '商户订单号')
			 ->addListItem('id', '微信支付订单号', 'callback', array('callback_name'=>'get_transaction_id','params'=>'###'))
			 ->addListItem('create_time', '支付时间', 'function', array('function_name'=>'date','params'=>'Y-m-d H:i:s,###'))
			 ->addListItem('id', '支付金额（元）', 'callback', array('callback_name'=>'get_total_fee','params'=>'###'))
			 ->addListItem('id', '支付方式', 'callback', array('callback_name'=>'get_trade_type','params'=>'###'))
			 ->addListItem('id', '交易结果', 'callback', array('callback_name'=>'get_result_code','params'=>'###'))
			 ->addListItem('openid', '支付者头像', 'function', array('function_name'=>'get_fans_headimg'))
			 ->addListItem('openid', '支付者昵称', 'function', array('function_name'=>'get_fans_nickname'))
			 ->common_lists();
	}

	/**
	 * 获取支付信息详情
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_payment_detail($id, $field) {
		$payment = M('mp_payment')->find($id);
		$detail = json_decode($payment['detail'], true);
		return $detail[$field];
	} 

	/**
	 * 获取支付金额
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_total_fee($id) {
		$total_fee = $this->get_payment_detail($id, 'total_fee');
		return floatval($total_fee)/100;
	}

	/**
	 * 获取微信支付订单号
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_transaction_id($id) {
		return $this->get_payment_detail($id, 'transaction_id');
	}

	/**
	 * 获取支付方式
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_trade_type($id) {
		return $this->get_payment_detail($id, 'trade_type');
	}

	/**
	 * 获取交易结果
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_result_code($id) {
		return $this->get_payment_detail($id, 'result_code');
	}

}

?>