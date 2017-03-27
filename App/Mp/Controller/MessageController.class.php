<?php 

namespace Mp\Controller;
use Mp\Controller\BaseController;

/**
 * 公众号消息管理控制器
 * @author 魔派<180256122@qq.com>
 */
class MessageController extends BaseController {
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
			'url' => U('Mp/Mp/lists'),
			'class' => ''
		);
        $this->assign('topmenu', $topmenu);
		$uid = session('user_id');
		$user_info = M('user')->find($uid);
		$user_id=$user_info['id'];
		$role_data = M('rbac_role_user')->where("user_id=$user_id")->select();
		$role=$role_data[0]['role_id'];
		if($role==2){
			add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');				// 添加生成侧边栏导航的钩子
			add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
			$sidenav = hook('sidenav');
			if(empty($sidenav)){
				$sidenav = $this->meau();
			}
		}elseif($role==1){
			add_hook('sidenav', 'Mp\Behavior\SidenavBehavior');				// 添加生成侧边栏导航的钩子
			add_hook('editor', 'Mp\Behavior\EditorBehavior');// 执行钩子，获取侧边栏数据
			$sidenav = hook('sidenav');
			if(empty($sidenav)){
				$sidenav = $this->meau();
			}
		}else{
			$where['username']=$_SESSION['username'];
			$datas=M('user')->where($where)->select();
			$wheres['name']=$datas[0]['application'];
			$wheres['is_show']=1;
			$arr=M('mp_rbac_node')->where($wheres)->select();
			$sidenav  = array(
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
							'url'   => 'index.php?s='.$arr[0]['folder'].'/'.$arr[0]['url'],
						),
					)
				)
			);
			$this->assign('sidenav', $sidenav);
		}
	}
	/**
	 * 消息列表
	 * @author 魔派<180256122@qq.com>
	 */
	public function lists() {
		$custom = array(
			'options' => array(
				'save_to_material' => array(
					'title' => '',
					'url' => U('save_to_material', array('msgid'=>'{msgid}')),
					'class' => 'btn btn-sm btn-primary icon-signup'
				),
				'reply_message' => array(
					'title' => '',
					'url' => U('reply_message', array('msgid'=>'{msgid}')),
					'class' => 'btn btn-sm btn-info icon-topic'
				)
			)
		);
		$this->addNav('消息列表', '', 'active')
			 ->setModel('mp_message')
			 ->setListMap(array('mpid'=>get_mpid()))
			 ->setListOrder('create_time desc')
			 ->setListSearch(array(
			 	'msgtype' => '消息类型',
			 	'content' => '消息内容'
			 ))
			 ->addListItem('msgtype', '消息类型', 'enum', array('options'=>array('text'=>'文本消息','image'=>'图片消息','voice'=>'语音消息','shortvideo'=>'短视频消息','location'=>'地理位置消息','link'=>'链接消息')))
			 ->addListItem('msgid', '消息内容', 'callback', array('callback_name'=>'get_message_content'))
			 ->addListItem('create_time', '消息发送时间', 'function', array('function_name'=>'date','params'=>'Y-m-d H:i:s,###'))
			 ->addListItem('openid', '粉丝头像', 'function', array('function_name'=>'get_fans_headimg'))
			 ->addListItem('openid', '粉丝昵称', 'function', array('function_name'=>'get_fans_nickname'))
			 ->addListItem('msgid', '操作', 'custom', $custom)
			 ->common_lists();
	}

	/**
	 * 保存为素材
	 * @author 魔派<180256122@qq.com>
	 */
	public function save_to_material() {
		$msgid = I('get.msgid');
		$message = M('mp_message')->where(array('mpid'=>get_mpid(),'msgid'=>$msgid))->find();
		if (!$message) {
			$this->error('消息不存在');
		} elseif ($message['save_status'] == 1) {
			$this->error('该消息已保存为素材');
		} else {
			$msgtype = $message['msgtype'];
			switch ($msgtype) {
				case 'text':
					$insert['content'] = $message['content'];
					break;
				
				default:
					$this->error('此类型消息暂时不支持保存为素材');
					break;
			}
			$insert['mpid'] = get_mpid();
			$insert['type'] = $msgtype;
			$insert['create_time'] = time();
			if (!M('mp_material')->add($insert)) {
				$this->error('保存素材失败');
			} else {
				M('mp_message')->where(array('mpid'=>get_mpid(),'msgid'=>$msgid))->setField('save_status',1);
				$this->success('保存素材成功', U('lists'));
			}
		}
	}

	/**
	 * 回复消息
	 * @author 魔派<180256122@qq.com>
	 */
	public function reply_message() {
		if (IS_POST) {
			$data = I('post.');
			$content = $data['content'];
			if (!$content) {
				$this->error('请填写回复内容');
			} else {
				$reply = array(
					'touser' => I('openid'),
					'msgtype' => 'text',
					'text' => array(
						'content' => I('content')
					)
				);
				$result = send_custom_message($reply);
				if ($result['errcode'] != 0) {
					$this->error($result['errmsg']);
				} else {
					M('mp_message')->where(array('mpid'=>get_mpid(),'msgid'=>I('msgid')))->setField('reply_status', 1);
					$this->success('回复成功', U('lists'));
				}
			}
		} else {
			$message = M('mp_message')->where(array('mpid'=>get_mpid(),'msgid'=>I('get.msgid')))->find();
			if (!$message) {
				$this->error('消息不存在');
			} elseif (time()-$message['create_time'] > 48*3600) {
				$this->error('该消息发送时间距离此刻已超过48小时，不能回复');
			} else {
				$this->addCrumb('公众号管理', U('Index/index'), '')
					 ->addCrumb('消息管理', U('Message/lists'), '')
					 ->addCrumb('回复消息', '', 'active')
					 ->addNav('回复消息', '', 'active')
					 ->addFormField('content', '回复内容', 'textarea')
					 ->addFormField('msgid', '消息ID', 'hidden', array('value'=>$message['msgid']))
					 ->addFormField('openid', '粉丝openid', 'hidden', array('value'=>$message['openid']))
					 ->common_add();
			}
		}
	}

	/**
	 * 获取消息内容
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_message_content($msgid) {
		$map['msgid'] = $msgid;
		$map['mpid'] = get_mpid();
		$message = M('mp_message')->where($map)->find();
		if (!$message) {
			return '';
		}
		switch ($message['msgtype']) {
			case 'text':
				return $message['content'];
				break;
			case 'image':
				// 感谢 @  平凡<58000865@qq.com> 提供的微信图片防盗链解决方案
            	return '<img src="'.$message['picurl'].'" width="100" height="100" />';      
				break;
			case 'voice':
				return '【语音】';
				break;
			case 'shortvideo':		
				return '【视频】';
				break;
			case 'location':
				return '【位置】'.$message['label'];
				break;
			case 'link':
				return '【链接】<a style="color:#08a5e0" href="'.$message['url'].'" target="_blank">'.$message['title'].'</a>';
				break;
			default:
				return '';
				break;
		}
	}
}



 ?>