<?php 

namespace Mp\Controller;
use Mp\Controller\BaseController;

/**
 * 自动回复控制器
 * @author 魔派<180256122@qq.com>
 */
class AutoReplyController extends BaseController {
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
	 * 关键词回复
	 * @author 魔派<180256122@qq.com>
	 */
	public function keyword() {
		$options = array(
			'add' => array(
				'title' => '',
				'url' => U('edit', array('id'=>'{id}')),
				'class' => 'btn btn-primary btn-sm icon-edit'
			),
			'delete' =>	array(
				'title' => '',
				'url' => U('delete', array('id'=>'{id}')),
				'class' => 'btn btn-danger btn-sm icon-delete'
			)
		);
		$this->addNav('关键词回复', '', 'active')
			 ->addNav('特殊消息回复', U('special'), '')
			 ->addNav('事件回复', U('event'), '')
			 ->addNav('未识别回复', U('unrecognize'), '')
			 ->addButton('新增文本', U('AutoReply/addtext'), 'btn btn-primary')
			 ->addButton('新增图片', U('AutoReply/addimage'), 'btn btn-info')
			 ->addButton('新增图文', U('AutoReply/addtextimage'), 'btn btn-success')
			 ->setModel('mp_auto_reply')
			 ->setListMap(array('mpid'=>get_mpid(),'type'=>'keyword'))
			 ->setListOrder('id desc')
			 ->addListItem('id', '关键词', 'callback', array('callback_name'=>'get_keyword'))
			 ->addListItem('reply_type', '回复类型', 'enum', array('options'=>array('text'=>'文本','image'=>'图片','news'=>'图文')))
			 ->addListItem('material_id', '回复内容', 'callback', array('callback_name'=>'get_reply_content'))
			 ->addListItem('id', '操作', 'custom', array('options'=>$options))
			 ->common_lists();
	}

	/**
	 * 添加文本回复
	 * @author 魔派<180256122@qq.com>
	 */
	public function add() {
		if (IS_POST) {
			$data = I('post.');
			$type = $data['reply_type'];
			$result = D('MpAutoReply')->add_auto_reply($type, $data);
			if ($result['errcode'] != 0) {
				$this->error($result['errmsg']);
			} else {
				$this->success($result['errmsg'], U('keyword'));
			}
		} else {
			$type = I('get.type');
			$type_arr = array('text'=>'文本','image'=>'图片','news'=>'图文');
			$this->addNav('新增'.$type_arr[$type].'回复', '', 'active')
				 ->addFormField('keyword', '关键词', 'text')
				 ->addFormField('reply_type', '回复类型', 'hidden', array('value'=>$type));
			switch ($type) {
				case 'text':
					$this->addFormField('content', '文本内容', 'textarea');
					break;
				case 'image':
					$this->addFormField('image', '回复图片', 'image');
					break;
				case 'news':
					$this->addFormField('title', '图文标题', 'text')  
					     ->addFormField('picurl', '图文封面', 'image')
					     ->addFormField('description', '图文描述', 'textarea')
					     ->addFormField('url', '图文链接', 'text');
					break;
				default:
					# code...
					break;
			}	 
			$this->common_add();
		}
	}
        /*
         * 微信自定义回复   新模板开发
         */
        public function addtext(){
            if(!$_POST){
                 $this->display();
            }else{
                 $mpid=$_SESSION['mpid'];
                 //$data=I('post.');
                 $keyword=$_POST['keyword'];
                 $content=$_POST['content'];
                 $arr1['mpid'] = $mpid;
                 $arr1['type']='auto_reply';
                 $count = M('mp_rule')->order('id desc')->field('reply_id')->limit(1)->select();
                 $arr1['keyword'] = $keyword;
                 $arr2['mpid'] = $mpid;
                 $arr2['content'] = $content;
                 $arr2['type']='text';
                 $times=time();
                 $arr2['create_time']=$times;
                 $re1 = M('mp_rule')->add($arr1);
                 $re2 = M('mp_material')->add($arr2);
                 $arr3['mpid']=$mpid;
                 $arr3['material_id']=$re2;
                 $arr3['type']='keyword';
                 $arr3['reply_type']="text";
                 $auto=M('mp_auto_reply')->add($arr3);
				 $count=M('mp_rule')->order('id desc')->limit(1)->field('id')->select();
				 $arr4['reply_id']= $auto;
			 	 $arr4['keyword'] = $_POST['keyword'];
				 $arr4['type']='auto_reply';
				 $where['id']=$count[0]['id'];
				 M('mp_rule')->where($where)->save($arr4);
                 $this->success('新增成功', U('Mp/AutoReply/keyword'));
            }
        }
	public function aaa(){
		$count=M('mp_rule')->order('id desc')->limit(1)->field('id')->select();
		print_r($count[0]['id']);
	}
        /*
         * 微信图片回复
         */
        public function addimage(){
            if(!$_POST){
                $this->display();
            }else{
                 $mpid=$_SESSION['mpid'];
                 $data = array(
                    'img' => I('post.img'),
                    'token' => $_SESSION['token'],
                    'fenlei_id' => 1,
                    'time' => time(),
                );
                 $keyword=$_POST['keyword'];
//               $res = M('wang_img') -> add($data);
                 $arr1['type']='auto_reply';
                 $count = M('mp_rule')->order('id desc')->field('reply_id')->limit(1)->select();
                 $arr1['reply_id']= ++$count[0]['reply_id'];
                 $arr1['keyword'] = $keyword;
                 $arr1['mpid']=$mpid;
                 $arr2['mpid'] = $mpid;
                 $arr2['type']='image';
                 $arr2['create_time']=$data['time'];
                 $arr2['image']=$data['img'];
                 $re1 = M('mp_rule')->add($arr1);
                 $re2 = M('mp_material')->add($arr2);
                 //$arr3['material']=$re2;
                 $arr3['mpid']=$mpid;
                 $arr3['material_id']=$re2;
                 $arr3['type']='keyword';
                 $arr3['reply_type']="image";
                 $auto=M('mp_auto_reply')->add($arr3);
				$count=M('mp_rule')->order('id desc')->limit(1)->field('id')->select();
				//$this->redirect('Mp/AutoReply/keyword');
				$arr4['reply_id']= $auto;
				$arr4['keyword'] = $_POST['keyword'];
				$arr4['type']='auto_reply';
				$where['id']=$count[0]['id'];
				M('mp_rule')->where($where)->save($arr4);
                 $this->success('新增成功', U('Mp/AutoReply/keyword'));
            }
        }
        public function addimages(){
            if(!$_POST){
                $this->display();
            }else{
                 $mpid=$_SESSION['mpid'];
                 $data = array(
                    'img' => I('post.img'),
                    'token' => $_SESSION['token'],
                    'fenlei_id' => 1,
                    'time' => time(),
                );
                 print_r($data);die;
            }
        }
        /*
         * 图文消息回复开发
         * @  addtextimage
         */
        public function addtextimage(){
            if(!$_POST){
                $this->display();
            }else{
            	 $mpid=$_SESSION['mpid'];
                 $data=I('post.');
                 //print_r($data['title']);die;
                 $times=time();
                 $arr1['type']='auto_reply';
                 $count = M('mp_rule')->order('id desc')->field('reply_id')->limit(1)->select();
                 $arr1['reply_id']= ++$count[0]['reply_id'];
                 $arr1['keyword'] = $data['keyword'];
                 $arr1['mpid']=$mpid;
                 $arr2['mpid'] = $mpid;
                 $arr2['type']='news';
                 $arr2['create_time']=$times;
                 $arr2['picurl']=$data['img'];
                 $arr2['title']=$data['title'];
                 $arr2['description']=$data['info'];
                 $arr2['url']=$data['url'];
                 $re1 = M('mp_rule')->add($arr1);
                 $re2 = M('mp_material')->add($arr2);
                 //$arr3['material']=$re2;
                 $arr3['mpid']=$mpid;
                 $arr3['material_id']=$re2;
                 $arr3['type']='keyword';
                 $arr3['reply_type']="news";
                 $auto=M('mp_auto_reply')->add($arr3);
				$count=M('mp_rule')->order('id desc')->limit(1)->field('id')->select();
				//$this->redirect('Mp/AutoReply/keyword');
				$arr4['reply_id']= $auto;
				$arr4['keyword'] = $_POST['keyword'];
				$arr4['type']='auto_reply';
				$where['id']=$count[0]['id'];
				M('mp_rule')->where($where)->save($arr4);
                 $this->success('新增成功', U('Mp/AutoReply/keyword'));
            }
        }
        

	/**
	 * 编辑自动回复
	 * @author 魔派<180256122@qq.com>
	 */
	public function edit() {
		if (IS_POST) {
			$data = I('post.');
			$type = $data['reply_type'];
			$result = D('MpAutoReply')->edit_auto_reply($type, $data);
			if ($result['errcode'] != 0) {
				$this->error($result['errmsg']);
			} else {
				$this->success($result['errmsg'], U('keyword'));
			}
		} else {
			$result = D('MpAutoReply')->get_auto_reply(I('get.id'));
			if ($result['errcode'] != 0) {
				$this->error($result['errmsg']);
			}
			$form_data = $result['result'];
			$type = $form_data['reply_type'];
			$type_arr = array('text'=>'文本','image'=>'图片','news'=>'图文');
			$this->addCrumb('公众号管理', U('Index/index'), '')
				 ->addCrumb('关键词回复', U('AutoReply/keyword'), '')
				 ->addCrumb('编辑'.$type_arr[$type].'回复', '', 'active')
				 ->addNav('编辑'.$type_arr[$type].'回复', '', 'active')
				 ->addFormField('keyword', '关键词', 'text', array('attr'=>'readonly'))
				 ->addFormField('reply_id', '回复规则ID', 'hidden')
				 ->addFormField('material_id', '素材ID', 'hidden')
				 ->addFormField('rule_id', '关键词触发规则ID', 'hidden')
				 ->addFormField('reply_type', '回复类型', 'hidden')
				 ->setFormData($form_data);
			switch ($type) {
				case 'text':
					$this->addFormField('content', '文本内容', 'textarea');
					break;
				case 'image':
					$this->addFormField('image', '回复图片', 'image');
					break;
				case 'news':
					$this->addFormField('title', '图文标题', 'text')
					     ->addFormField('picurl', '图文封面', 'image')
					     ->addFormField('description', '图文描述', 'textarea')
					     ->addFormField('url', '图文链接', 'text');
					break;
				default:
					# code...
					break;
			}
			$this->common_edit();
		}
	}

	/**
	 * 获取自动回复关键词
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_keyword($reply_id) {
		$reply_rule = D('MpRule')->get_auto_reply_rule($reply_id);
		return $reply_rule['keyword'];
	}

	/**
	 * 获取回复内容
	 * @author 魔派<180256122@qq.com>
	 */
	public function get_reply_content($material_id) {
		return D('MpMaterial')->get_material($material_id);
	}

	/**
	 * 删除关键词回复
	 * @author 魔派<180256122@qq.com>
	 */
	public function delete() {
		$result = D('MpAutoReply')->get_auto_reply(I('get.id'));
		if ($result['errcode'] != 0) {
			$this->error($result['errmsg']);
		} else {
			$data = $result['result'];
			$type = $data['reply_type'];
			unset($result);
			$result = D('MpAutoReply')->delete_auto_reply($type, $data);
			if ($result['errcode'] != 0) {
				$this->error($result['errmsg']);
			} else {
				$this->success($result['errmsg']);
			}
		}
	}

	/**
	 * 非关键词回复
	 * @author 魔派<180256122@qq.com>
	 */
	public function special() {
		if (IS_POST) {
			C('TOKEN_ON', false);
			if (!I('type') || count(I('type')) == 0) {
				$this->error('无法设置非关键词回复');
			}
			$types = I('type');
			$AutoReply = D('MpAutoReply');
			$data['mpid'] = get_mpid();
			foreach ($types as $k => $v) {
				$data['type'] = $v;
				$data['reply_type'] = I($v);
				$data['keyword'] = I($v.'_keyword');
				$data['addon'] = I($v.'_addon');
				if (!$AutoReply->create($data)) {
					$this->error($AutoReply->getError());
				} else {
					$res = $AutoReply->get_auto_reply_by_type($v);
					if ($res) {
						$data['id'] = $res['id'];
						$AutoReply->save($data);
					} else {
						unset($data['id']);
						$AutoReply->add($data);
					}
				}
			}
			
			$this->success('保存特殊消息回复成功');
		} else {
			$AutoReply = D('MpAutoReply');
			$show = array(
				array(
					'name' => 'image',
					'title' => '图片消息',
					'value' => $AutoReply->get_auto_reply_by_type('image')
				),
				array(
					'name' => 'voice',
					'title' => '语音消息',
					'value' => $AutoReply->get_auto_reply_by_type('voice')
				),
				array(
					'name' => 'shortvideo',
					'title' => '短视频消息',
					'value' => $AutoReply->get_auto_reply_by_type('shortvideo')
				),
				array(
					'name' => 'location',
					'title' => '位置消息',
					'value' => $AutoReply->get_auto_reply_by_type('location')
				),
				array(
					'name' => 'link',
					'title' => '链接消息',
					'value' => $AutoReply->get_auto_reply_by_type('link')
				),
			);
			$this->assign('show', $show);
			$addons = D('Addons')->get_installed_addons();
			$this->assign('addons', $addons);
			$crumb = array(
				
			);
			$nav = array(
				array(
					'title' => '关键词回复',
					'url' => U('keyword'),
					'class' => ''
				),
				array(
					'title' => '特殊消息回复',
					'url' => U('special'),
					'class' => 'active'
				),
				array(
					'title' => '事件回复',
					'url' => U('event'),
					'class' => ''
				),
				array(
					'title' => '未识别回复',
					'url' => U('unrecognize'),
					'class' => ''
				)
			);
			$tip = '当用户在公众号发送以下几种类型消息时，如果选择了响应插件，系统会把消息分发到指定的插件进行处理。如果绑定了关键词，系统会根据关键词回复中设置的内容直接回复。';
			$this->assign('crumb', $crumb);
			$this->assign('nav', $nav);
			$this->assign('tip', $tip);
			$this->display();
		}
	}

	/**
	 * 事件回复
	 * @author 魔派<180256122@qq.com>
	 */
	public function event() {
		if (IS_POST) {
			C('TOKEN_ON', false);
			if (!I('type') || count(I('type')) == 0) {
				$this->error('无法设置非关键词回复');
			}
			$types = I('type');
			$AutoReply = D('MpAutoReply');
			$data['mpid'] = get_mpid();
			foreach ($types as $k => $v) {
				$data['type'] = $v;
				$data['reply_type'] = I($v);
				$data['keyword'] = I($v.'_keyword');
				$data['addon'] = I($v.'_addon');
				if (!$AutoReply->create($data)) {
					$this->error($AutoReply->getError());
				} else {
					$res = $AutoReply->get_auto_reply_by_type($v);
					if ($res) {
						$data['id'] = $res['id'];
						$AutoReply->save($data);
					} else {
						unset($data['id']);
						$AutoReply->add($data);
					}
				}
			}
			
			$this->success('保存事件回复成功');
		} else {
			$AutoReply = D('MpAutoReply');
			$show = array(
				array(
					'name' => 'subscribe',
					'title' => '用户关注',
					'value' => $AutoReply->get_auto_reply_by_type('subscribe')
				),
				array(
					'name' => 'unsubscribe',
					'title' => '用户取消关注',
					'value' => $AutoReply->get_auto_reply_by_type('unsubscribe'),
					'tip' => '用户取消关注，自动回复内容不生效。可以为用户取消关注事件指定一个插件进行响应，从而进行诸如减少积分之类的操作。'
				),
				array(
					'name' => 'scan',
					'title' => '扫描二维码',
					'value' => $AutoReply->get_auto_reply_by_type('scan')
				),
				array(
					'name' => 'report_location',
					'title' => '上报地理位置',
					'value' => $AutoReply->get_auto_reply_by_type('report_location')
				),
				array(
					'name' => 'click',
					'title' => '点击菜单拉取消息',
					'value' => $AutoReply->get_auto_reply_by_type('click'),
					'tip' => '用户点击菜单时，默认会根据菜单推送的KEY值响应对应的关键词。此处的设置会把用户点击菜单拉取消息事件分发到指定的插件进行响应'
				),
			);
			$this->assign('show', $show);
			$addons = D('Addons')->get_installed_addons();
			$this->assign('addons', $addons);
			$crumb = array(
				
			);
			$nav = array(
				array(
					'title' => '关键词回复',
					'url' => U('keyword'),
					'class' => ''
				),
				array(
					'title' => '特殊消息回复',
					'url' => U('special'),
					'class' => ''
				),
				array(
					'title' => '事件回复',
					'url' => U('event'),
					'class' => 'active'
				),
				array(
					'title' => '未识别回复',
					'url' => U('unrecognize'),
					'class' => ''
				)
			);
			$tip = '当用户在公众号触发以下几种类型事件时，如果选择了响应插件，系统会把消息分发到指定的插件进行处理。如果绑定了关键词，系统会根据关键词回复中设置的内容直接回复。';
			$this->assign('tip', $tip);
			$this->assign('crumb', $crumb);
			$this->assign('nav', $nav);
			$this->display('special');
		}
	}

	// 未识别回复
	public function unrecognize() {
		if (IS_POST) {
			C('TOKEN_ON', false);
			if (!I('type') || count(I('type')) == 0) {
				$this->error('无法设置非关键词回复');
			}
			$types = I('type');
			$AutoReply = D('MpAutoReply');
			$data['mpid'] = get_mpid();
			foreach ($types as $k => $v) {
				$data['type'] = $v;
				$data['reply_type'] = I($v);
				$data['keyword'] = I($v.'_keyword');
				$data['addon'] = I($v.'_addon');
				if (!$AutoReply->create($data)) {
					$this->error($AutoReply->getError());
				} else {
					$res = $AutoReply->get_auto_reply_by_type($v);
					if ($res) {
						$data['id'] = $res['id'];
						$AutoReply->save($data);
					} else {
						unset($data['id']);
						$AutoReply->add($data);
					}
				}
			}
			
			$this->success('保存未识别回复成功');
		} else {
			$AutoReply = D('MpAutoReply');
			$show = array(
				array(
					'name' => 'unrecognize',
					'title' => '未识别回复',
					'value' => $AutoReply->get_auto_reply_by_type('unrecognize')
				)
			);
			$this->assign('show', $show);
			$addons = D('Addons')->get_installed_addons();
			$this->assign('addons', $addons);
			$crumb = array(
				
			);
			$nav = array(
				array(
					'title' => '关键词回复',
					'url' => U('keyword'),
					'class' => ''
				),
				array(
					'title' => '特殊消息回复',
					'url' => U('special'),
					'class' => ''
				),
				array(
					'title' => '事件回复',
					'url' => U('event'),
					'class' => ''
				),
				array(
					'title' => '未识别回复',
					'url' => U('unrecognize'),
					'class' => 'active'
				)
			);
			$tip = '当用户在公众号发送的消息未触发关键词回复、特殊消息回复、事件回复几种回复规则时，如果有设置未识别回复规则，则按此处设置的规则进行回复。';
			$this->assign('tip', $tip);
			$this->assign('crumb', $crumb);
			$this->assign('nav', $nav);
			$this->display();
		}
	}

}

 ?>