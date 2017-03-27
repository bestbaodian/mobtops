<?php 
namespace Mp\Controller;
use Mp\Controller\BaseController;
/**
 * 公众号支付控制器
 * @author 魔派<180256122@qq.com>
 */
class PaymentController extends BaseController {
        
    //初始化
	public function _initialize()
	{
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
			'url' => U('Mp/Mp/lists'),
			'class' => ''
		);
		$this->assign('topmenu', $topmenu);
		$uid = session('user_id');
		$user_info = M('user')->find($uid);
		$user_id = $user_info['id'];
		$role_data = M('rbac_role_user')->where("user_id=$user_id")->select();
		$role = $role_data[0]['role_id'];
		if ($role == 2) {
			add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');                // 添加生成侧边栏导航的钩子
			add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
			$sidenav = hook('sidenav');
			if (empty($sidenav)) {
				$sidenav = $this->meau();
			}
		}elseif($role==1){
			add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');				// 添加生成侧边栏导航的钩子
			add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
			$sidenav = hook('sidenav');
			if(empty($sidenav)){
				$sidenav = $this->meau();
			}
		} else {
			$where['username'] = $_SESSION['username'];
			$datas = M('user')->where($where)->select();
			$wheres['name'] = $datas[0]['application'];
			$wheres['is_show'] = 1;
			$arr = M('mp_rbac_node')->where($wheres)->select();
			$sidenav = array(
				array(
					'title' => '基本设置',
					'url' => 'javascript:;',
					'class' => 'icon icon-setting',
					'attr' => 'data="icon"',
					'children' => array(
						array(
							'title' => '自动回复',
							'url' => U('AutoReply/keyword'),
						),
						array(
							'title' => '自定义菜单',
							'url' => U('CustomMenu/publish'),
						),
						array(
							'title' => '场景二维码',
							'url' => U('SceneQrcode/lists'),
						),
						array(
							'title' => '粉丝管理',
							'url' => U('Fans/lists'),
						),
						array(
							'title' => '消息管理',
							'url' => U('Message/lists'),
						),
						array(
							'title' => '素材管理',
							'url' => U('Material/text'),
						),
						array(
							'title' => '微信支付',
							'url' => U('Payment/wechat'),
						)
					),
				),
				array(
					'title' => '行业应用',
					'url' => 'javascript:;',
					'class' => 'icon icon-setting',
					'attr' => 'data="icon"',
					'children' => array(
						array(
							'title' => $arr[0]['name'],
							'url' => 'index.php?s=' . $arr[0]['folder'] . '/' . $arr[0]['url'],
						),
					)
				)
			);
			$this->assign('sidenav', $sidenav);
		}
	}
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
			$this->addNav('支付配置', '', 'active')
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
               $username=$_SESSION['username'];
               $user_id = session('user_id');
			   $User = M("mp");
                if($username=='admin'){
                     $data = $User->join('dc_rbac_nodes ON dc_mp.type = dc_rbac_nodes.nid')->select();
                }else{
                     $data = $User->join('dc_rbac_nodes ON dc_mp.type = dc_rbac_nodes.nid')->where("user_id = $user_id")->select();                    
               }
		        $this->assign('data',$data);
		        $this->display(); // 输出模板
        	}
        public function page(){
        		$search = isset($_POST['search']) ? $_POST['search'] : '';
				$page = isset($_GET['p']) ? $_GET['p'] : 1;
				if($search){
					$condition['name'] = array('like',"%".$search."%");
				}else{
					$condition = "";
				}
				$count = M('mp')->where($condition)->count();
		        //设置每页记录数
		        $pagesize = 25;
		        //查看总页数
		        $pagesum = ceil($count/$pagesize);
		        //上下页
		        $pre = ($page-1 < 1) ? 1 : $page-1;

		        $next = ($page+1 > $pagesum) ? $pagesum : $page+1;
		        //偏移量
		        $start = ($page-1)*$pagesize;
		        //limit分页查询数据
		        if($search){
					$condition['name'] = array('like',"%".$search."%");
				}else{
					$condition = "";
				}
				$list = M('mp')->where($condition)->limit("$start,$pagesize")->select();
		        $str = "<a href='javascript:page(1)'>首页</a>
		        		<a href='javascript:page($pre)'>上一页</a>
		                <a href='javascript:page($next)'>下一页</a>
		                <a href='javascript:page($pagesum)'>末页</a>";
		        $this->assign('search',$search);
		        $this->assign('str',$str);
		        $this->assign('page',$page);
		        $this->assign('counts',$count);
		        $this->assign('data',$list);
		        $this->assign('pagesum',$pagesum);//末页
		        $this->display(); // 输出模板
        }

       /**
	 * 新增
	 * @author 魔派<180256122@qq.com>
	 */
	public function add() {
		$mp_count = M('mp')->where(array('user_id'=>get_user_id()))->count();
		if ($this->user_access['mp_count'] !== 0 && $mp_count >= $this->user_access['mp_count']) {
			$this->error('你最多只能创建'.$this->user_access['mp_count'].'个公众号');
		}
		$this->addNav('新增记录', '', 'active')
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
			 ->setAddSuccessUrl(U('Index/index', array('mpid'=>'{pk}')))
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
		$this->addCrumb('公众号管理', U('Mp/Mp/lists'), '')
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
		$this->addNav('支付配置', U('Payment/wechat'), '')
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
        
    public function search(){
        $search = I('search');
        $type = I('type');
        //dump($search);
        $data = M("mp")->where("name like '%$search%' and type = $type")->field('id,name,type,create_time,headimg')->select();
        
        $counts = count($data);
        if (empty($data)) {
            $this->error('搜索用户信息失败');
        } else {
            $this->assign('search',$search);
            $this->assign('data',$data);
            $this->assign('counts',$counts);
            $this->display('lists');
        }
    }  

    public function mess(){
    	$id = I('get.id');
    	$data = M('mp')->where("id=$id")->find();
    	// print_r($data);
    	$this->assign('data',$data);
    	$this->display();
    }
    
    /*
    添加公众号
    */
    public function adds(){
        $this->display();
    }

	/*
	 * 支付宝支付
	 */
	public function zhifubao(){
		header("content-type:text/html;charset=utf8");
		// ******************************************************配置 start*************************************************************************************************************************
		//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		//合作身份者id，以2088开头的16位纯数字
		$alipay_config['partner']		= '2088002075883504';
		//收款支付宝账号
		$alipay_config['seller_email']	= 'li1209@126.com';
		//安全检验码，以数字和字母组成的32位字符
		$alipay_config['key']			= 'y8z1t3vey08bgkzlw78u9cbc4pizy2sj';
		//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
		//签名方式 不需修改
		$alipay_config['sign_type']    = strtoupper('MD5');
		//字符编码格式 目前支持 gbk 或 utf-8
		//$alipay_config['input_charset']= strtolower('utf-8');
		//ca证书路径地址，用于curl中ssl校验
		//请保证cacert.pem文件在当前文件夹目录中
		$alipay_config['cacert']    = getcwd().'\\cacert.pem';
		//访问模式,根据自己的服务器是否支持ssl访问，若支持请选择https；若不支持请选择http
		$alipay_config['transport']    = 'http';
		// ******************************************************配置 end*************************************************************************************************************************
		// ******************************************************请求参数拼接 start*************************************************************************************************************************
                $data['price']='0.01';
                $data['name']='郝云支付宝订单测试';
                $parameter = array(
			"service" => "create_direct_pay_by_user",
			"partner" => $alipay_config['partner'], // 合作身份者id
			"seller_email" => $alipay_config['seller_email'], // 收款支付宝账号
			"payment_type"	=> '1', // 支付类型
			"notify_url"	=> "http://www.mobtop.com.cn", // 服务器异步通知页面路径
			"return_url"	=> "http://www.mobtop.com.cn", // 页面跳转同步通知页面路径
			"out_trade_no"	=> "2016033011292156432", // 商户网站订单系统中唯一订单号
			"subject"	=> $data['name'], // 订单名称
			"total_fee"	=> $data['price'], // 付款金额
			"body"	=> "这个仅仅是郝云测试的支付宝订单测试功能", // 订单描述 可选
			"show_url"	=> "", // 商品展示地址 可选
			"anti_phishing_key"	=> "", // 防钓鱼时间戳  若要使用请调用类文件submit中的query_timestamp函数
			"exter_invoke_ip"	=> "", // 客户端的IP地址
			"_input_charset"	=> 'utf-8', // 字符编码格式
		);
		// 去除值为空的参数
		foreach ($parameter as $k => $v) {
			if (empty($v)) {
				unset($parameter[$k]);
			}
		}
                // 参数排序
		ksort($parameter);
		reset($parameter);
                // 拼接获得sign
		$str = "";
		foreach ($parameter as $k => $v) {
			if (empty($str)) {
				$str .= $k . "=" . $v;
			} else {
				$str .= "&" . $k . "=" . $v;
			}
		}
		$parameter['sign'] = md5($str . $alipay_config['key']);
		$parameter['sign_type'] = $alipay_config['sign_type'];
		$end="";
		foreach ($parameter as $k => $v) {
			$end .= "&" . $k . "=" . $v;
		}
		$url="https://mapi.alipay.com/gateway.do?_input_charset=utf-8".$end;
		header("Location: $url");
	}
        
        /*
         * 支付宝配置信息填写编辑
         * @author Mr.haoyunyun   1270657697@qq.com
         */
        public function alipay(){
            if(!$_POST){
                $this->display();
            }else{
                $data=$_POST;
                $data['username']=$_SESSION['username'];
                $data['time']=time();
                $arr=M('mp_alipay')->add($data);
                if($arr==1){
                    header("Location:".U('Mp/Payment/alipaylist')."");
                }else{
                    $this->error("操作失败");
                }
            }
        }
        
        /*
         * 支付宝信息展示
         */
        public function alipaylist(){
            $where['username']=$_SESSION['username'];
            $data=M('mp_alipay')->where($where)->select();
            $this->assign('data',$data);
            $this->display();
        }
        
        
        /*
         * 支付宝编辑
         */
        public function alipayedit(){
            $id = I('id');
            $res = M('mp_alipay')->where('id='.$id)->find();
            $this -> assign('res',$res);
            $this -> display();
        }
        public function alipayupdate(){
             $id = I('id');
             $data=$_POST;
             $res = M('mp_alipay') ->where('id='.$id)->save($data);
            if($res!== flase){
                header("Location:".U('Mp/Payment/alipaylist')."");
            }else{
                $this -> error('添加失败!');
            }
        }
        
        /*
         * 支付宝编辑
         */
        public function alipaydel(){
            $id = I('id');
            $res = M('mp_alipay')->where('id='.$id)->delete();
            if($res){
                echo 1;
            }else{
                echo 0;
            }
        }
         
}

?>