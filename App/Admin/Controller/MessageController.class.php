<?php
	namespace Admin\Controller;
	use Admin\Controller\BaseController;
	/**
	*	短信配置控制器
	*	@author
	*/
	class MessageController extends BaseController {
		public function listes() {
			$this->addCrumb('基本信息设置', U('Infomation/add'), '')
				->addCrumb('短信接口', U('Message/add'), '')
				->addCrumb('在线支付接口', U('Onlinepayment/add'), '')
				->addCrumb('平台支付配置', U('Payment/add'),'')
				->addCrumb('微信托管', U('Wechathosting/add'), '')
                ->addCrumb('微信支付服务器', U('Wechathost/add'), '')
				->addCrumb('卡卷平台', U('Card/add'), '')
				->setModel('mp')
			->common_lists();
		}
		// 列表
		public function message_list(){
			$search = I('search') ? I('search') : '';
	        $page = isset($_GET['p']) ? $_GET['p'] : 1;
	        $where = ""; 
	        if($search){
	            $where['c_name'] = array('like',"%".$search."%");
	        }
	        $data = pagination($page,'message_list',$where,25,$join,$field);
	        $this->assign('search',$search);
	        $this->assign('data',$data);
	        $this->display();
		}

		// 查看
		public function info(){
			$data = M('message_list')->where('dc_message_list.id = '.$_GET['id'])->find();
			$this->assign('data',$data);
			$this->display();exit;
		}

		// 添加
		public function add(){
			if (IS_POST) {
				$data = $_POST;
				// print_r($data);die;
				$data['time'] = time();
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$res = M($tablename)->add($data);
				// echo M()->_sql();die;
				if ($res) {
					$this->redirect($tablename);
				}else{
					$this->error('操作失败');
				}
			}else{
				$data = M('rbac_node')->field('id,name,url')->where('pid = 88')->select();
				$this->assign('data',$data);
				$this->display();exit;
			}
		}

		// 删除
		public function delete(){
			$m = M('message_list');
	        $res = $m ->where('id ='.I('post.id')) -> delete();
	        if($res){
	            $data['status'] = 1;
	            $data['info'] = '操作成功';
	        }else{
	            $data['status'] = 0;
	            $data['info'] = '操作失败';
	        }
	        $this->ajaxReturn($data);
		}

		// 删除选中
		public function delAll(){
	        $id = I('id');
	        $where['id'] = array('in',$id);
	        $res = M('message_list')->where($where) -> delete();
	        if ($res) {
	        	$data = array('status' => 1,'info' => '删除成功');
	        }else{
	        	$data = array(false,'info' => '删除失败');
	        }
	        $this->ajaxReturn($data);
	    }

		// 编辑
		public function edit(){
			if (IS_POST) {
				$data = $_POST;
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				// print_r($data);die;
				$re = M('message_list')->where('id = '.$data['id'])->delete();
				// echo M()->_sql();die;
				$res = M($tablename)->add($data);
				if ($re!==FALSE&&$res!==FALSE) {
					$this->redirect($tablename);
				}else{
					$this->error('操作失败');
				}
			}else{
				$node = M('rbac_node')->field('id,name')->where('pid = 88')->select();
				$data = M('message_list')->where('dc_message_list.id = '.$_GET['id'])->find();
				$this->assign('node',$node);
				$this->assign('data',$data);
				$this->display();
			}
		}

		/*// 厂商列表
		public function clists(){
			$search = I('search') ? I('search') : '';
	        $page = isset($_GET['p']) ? $_GET['p'] : 1;
	        if($_SESSION['token'] == "dd24c3bf0e129326b36e15a164bc01e7"){
	            $where = "";
	        }else{
	            $where['u_token']  = $_SESSION['token'] ;
	        }
	        if($search){
	            $where['name'] = array('like',"%".$search."%");
	        }
	        $data = pagination($page,'message_supplier',$where,25);
	        $this->assign('search',$search);
	        $this->assign('data',$data);
	        $this->display();
		}

		// 添加厂商
		public function cadd(){
			if (IS_POST) {
				$data = $_POST;
				$res = M('message_supplier')->add($data);
				if ($res) {
					$this->redirect('clists');exit;
				}else{
					$this->error('添加失败');exit;
				}
			}else{
				$this->display();
			}
		}

		// 编辑厂商
		public function cedit(){
			if (IS_POST) {
				$data = $_POST;
				$res = M('message_supplier')->where('id = '.$data['id'])->save($data);
				if ($res!==FALSE) {
					$this->redirect('clists');exit;
				}else{
					$this->error('修改失败');exit;
				}
			}else{
				$data = M('message_supplier')->where('id = '.$_GET['id'])->find();
				$this->assign('data',$data);
	        	$this->display();
			}
		}

		// 厂商编辑
		public function cdelete(){
			if ($_GET['id']) {
				$res = M('message_supplier')->where('id = '.$_GET['id'])->delete();
				if ($res) {
					$this->redirect();
				}else{
					$this->error('删除失败');
				}
			}else{
				$this->error('参数错误');
			}
		}*/

		/**
		*公众号接口
		*/
		public function mpapi_list(){
			$search = I('search') ? I('search') : '';
	        $page = isset($_GET['p']) ? $_GET['p'] : 1;
	        $where = ""; 
	        if($search){
	            $where['c_name'] = array('like',"%".$search."%");
	        }
	        $data = pagination($page,'mpapi_list',$where,25,$join,$field);
	        $this->assign('search',$search);
	        $this->assign('data',$data);
	        $this->display();
		}
		// 添加
		public function mpapi_add(){
			if (IS_POST) {
				$data = $_POST;
				// print_r($data);die;
				$data['time'] = time();
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$res = M($tablename)->add($data);
				// echo M()->_sql();die;
				if ($res) {
					$this->redirect($tablename);
				}else{
					$this->error('操作失败');
				}
			}else{
				$data = M('rbac_node')->field('id,name,url')->where('pid = 88')->select();
				$this->assign('data',$data);
				$this->display();exit;
			}
		}
		// 编辑
		public function mpapi_edit(){
			if (IS_POST) {
				$data = $_POST;
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$re = M('mpapi_list')->where('id = '.$data['id'])->delete();
				$res = M($tablename)->add($data);
				if ($re!==FALSE&&$res!==FALSE) {
					$this->redirect($tablename);
				}else{
					$this->error('更新失败');
				}
			}else{
				$node = M('rbac_node')->field('id,name')->where('pid = 88')->select();
				$data = M('mpapi_list')->where('dc_mpapi_list.id = '.$_GET['id'])->find();
				// print_r($data);die;
				$this->assign('node',$node);
				$this->assign('data',$data);
				$this->display();
			}
		}
		// 删除
		public function mpapi_delete(){
			$m = M('mpapi_list');
	        $res = $m ->where('id ='.I('post.id')) -> delete();
	        if($res){
	            $data['status'] = 1;
	            $data['info'] = '操作成功';
	        }else{
	            $data['status'] = 0;
	            $data['info'] = '操作失败';
	        }
	        $this->ajaxReturn($data);
		}

		// 删除选中
		public function mpapi_delAll(){

	        $id = I('id');
	        $where['id'] = array('in',$id);
	        $res = M('mpapi_list')->where($where) -> delete();
	        if ($res) {
	        	$data = array('status' => 1,'info' => '删除成功');
	        }else{
	        	$data = array(false,'info' => '删除失败');
	        }
	        $this->ajaxReturn($data);
	    }

		// 查看
		public function mpapi_info(){
			$data = M('mpapi_list')->where('dc_mpapi_list.id = '.$_GET['id'])->find();
			$this->assign('data',$data);
			$this->display();exit;
		}

		/**
		*支付接口
		*/
		public function payapi_list(){
			$search = I('search') ? I('search') : '';
	        $page = isset($_GET['p']) ? $_GET['p'] : 1;
	        $where = ""; 
	        if($search){
	            $where['c_name'] = array('like',"%".$search."%");
	        }
	        $data = pagination($page,'payapi_list',$where,25,$join,$field);
	        $this->assign('search',$search);
	        $this->assign('data',$data);
	        $this->display();
		}
		// 添加
		public function payapi_add(){
			if (IS_POST) {
				$data = $_POST;
				// print_r($data);die;
				$data['time'] = time();
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$res = M($tablename)->add($data);
				// echo M()->_sql();die;
				if ($res) {
					$this->redirect($tablename);
				}else{
					$this->error('操作失败');
				}
			}else{
				$data = M('rbac_node')->field('id,name,url')->where('pid = 88')->select();
				$this->assign('data',$data);
				$this->display();exit;
			}
		}
		// 编辑
		public function payapi_edit(){
			if (IS_POST) {
				$data = $_POST;
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$re = M('payapi_list')->where('id = '.$data['id'])->delete();
				$res = M($tablename)->add($data);
				if ($re!==FALSE&&$res!==FALSE) {
					$this->redirect($tablename);
				}else{
					$this->error('更新失败');
				}
			}else{
				$node = M('rbac_node')->field('id,name')->where('pid = 88')->select();
				$data = M('payapi_list')->where('dc_payapi_list.id = '.$_GET['id'])->find();
				$this->assign('node',$node);
				$this->assign('data',$data);
				$this->display();
			}
		}
		// 删除
		public function payapi_delete(){
			$m = M('payapi_list');
	        $res = $m ->where('id ='.I('post.id')) -> delete();
	        if($res){
	            $data['status'] = 1;
	            $data['info'] = '操作成功';
	        }else{
	            $data['status'] = 0;
	            $data['info'] = '操作失败';
	        }
	        $this->ajaxReturn($data);
		}

		// 删除选中
		public function payapi_delAll(){
	        $id = I('id');
	        $where['id'] = array('in',$id);
	        $res = M('payapi_list')->where($where) -> delete();
	        if ($res) {
	        	$data = array('status' => 1,'info' => '删除成功');
	        }else{
	        	$data = array(false,'info' => '删除失败');
	        }
	        $this->ajaxReturn($data);
	    }

		// 查看
		public function payapi_info(){
			$data = M('payapi_list')->where('dc_payapi_list.id = '.$_GET['id'])->find();
			$this->assign('data',$data);
			$this->display();exit;
		}
		/**
		*视频接口
		*/
		public function mvapi_list(){
			$search = I('search') ? I('search') : '';
	        $page = isset($_GET['p']) ? $_GET['p'] : 1;
	        $where = ""; 
	        if($search){
	            $where['c_name'] = array('like',"%".$search."%");
	        }
	        $data = pagination($page,'mvapi_list',$where,25,$join,$field);
	        $this->assign('search',$search);
	        $this->assign('data',$data);
	        $this->display();
		}
		// 添加
		public function mvapi_add(){
			if (IS_POST) {
				$data = $_POST;
				// print_r($data);die;
				$data['time'] = time();
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$res = M($tablename)->add($data);
				// echo M()->_sql();die;
				if ($res) {
					$this->redirect($tablename);
				}else{
					$this->error('操作失败');
				}
			}else{
				$data = M('rbac_node')->field('id,name,url')->where('pid = 88')->select();
				$this->assign('data',$data);
				$this->display();exit;
			}
		}
		// 编辑
		public function mvapi_edit(){
			if (IS_POST) {
				$data = $_POST;
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$re = M('mvapi_list')->where('id = '.$data['id'])->delete();
				$res = M($tablename)->add($data);
				if ($re!==FALSE&&$res!==FALSE) {
					$this->redirect($tablename);
				}else{
					$this->error('更新失败');
				}
			}else{
				$node = M('rbac_node')->field('id,name')->where('pid = 88')->select();
				$data = M('mvapi_list')->where('dc_mvapi_list.id = '.$_GET['id'])->find();
				$this->assign('node',$node);
				$this->assign('data',$data);
				$this->display();
			}
		}
		// 删除
		public function mvapi_delete(){
			$m = M('mvapi_list');
	        $res = $m ->where('id ='.I('post.id')) -> delete();
	        if($res){
	            $data['status'] = 1;
	            $data['info'] = '操作成功';
	        }else{
	            $data['status'] = 0;
	            $data['info'] = '操作失败';
	        }
	        $this->ajaxReturn($data);
		}

		// 删除选中
		public function mvapi_delAll(){
	        $id = I('id');
	        $where['id'] = array('in',$id);
	        $res = M('mvapi_list')->where($where) -> delete();
	        if ($res) {
	        	$data = array('status' => 1,'info' => '删除成功');
	        }else{
	        	$data = array(false,'info' => '删除失败');
	        }
	        $this->ajaxReturn($data);
	    }
		// 查看
		public function mvapi_info(){
			$data = M('mvapi_list')->where('dc_mvapi_list.id = '.$_GET['id'])->find();
			$this->assign('data',$data);
			$this->display();exit;
		}
		/**
		*网站接口
		*/
		public function wangapi_list(){
			$search = I('search') ? I('search') : '';
	        $page = isset($_GET['p']) ? $_GET['p'] : 1;
	        $where = ""; 
	        if($search){
	            $where['c_name'] = array('like',"%".$search."%");
	        }
	        $data = pagination($page,'wangapi_list',$where,25,$join,$field);
	        $this->assign('search',$search);
	        $this->assign('data',$data);
	        $this->display();
		}
		// 添加
		public function wangapi_add(){
			if (IS_POST) {
				$data = $_POST;
				// print_r($data);die;
				$data['time'] = time();
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$res = M($tablename)->add($data);
				// echo M()->_sql();die;
				if ($res) {
					$this->redirect($tablename);
				}else{
					$this->error('操作失败');
				}
			}else{
				$data = M('rbac_node')->field('id,name,url')->where('pid = 88')->select();
				$this->assign('data',$data);
				$this->display();exit;
			}
		}
		// 编辑
		public function wangapi_edit(){
			if (IS_POST) {
				$data = $_POST;
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$re = M('wangapi_list')->where('id = '.$data['id'])->delete();
				$res = M($tablename)->add($data);
				if ($re!==FALSE&&$res!==FALSE) {
					$this->redirect($tablename);
				}else{
					$this->error('更新失败');
				}
			}else{
				$node = M('rbac_node')->field('id,name')->where('pid = 88')->select();
				$data = M('wangapi_list')->where('dc_wangapi_list.id = '.$_GET['id'])->find();
				$this->assign('node',$node);
				$this->assign('data',$data);
				$this->display();
			}
		}
		// 删除
		public function wangapi_delete(){
			$m = M('wangapi_list');
	        $res = $m ->where('id ='.I('post.id')) -> delete();
	        if($res){
	            $data['status'] = 1;
	            $data['info'] = '操作成功';
	        }else{
	            $data['status'] = 0;
	            $data['info'] = '操作失败';
	        }
	        $this->ajaxReturn($data);
		}

		// 删除选中
		public function wangapi_delAll(){
	        $id = I('id');
	        $where['id'] = array('in',$id);
	        $res = M('wangapi_list')->where($where) -> delete();
	        if ($res) {
	        	$data = array('status' => 1,'info' => '删除成功');
	        }else{
	        	$data = array(false,'info' => '删除失败');
	        }
	        $this->ajaxReturn($data);
	    }

		// 查看
		public function wangapi_info(){
			$data = M('wangapi_list')->where('dc_wangapi_list.id = '.$_GET['id'])->find();
			$this->assign('data',$data);
			$this->display();exit;
		}
		/**
		*APP接口	
		*/
		public function appapi_list(){
			$search = I('search') ? I('search') : '';
	        $page = isset($_GET['p']) ? $_GET['p'] : 1;
	        $where = ""; 
	        if($search){
	            $where['c_name'] = array('like',"%".$search."%");
	        }
	        $data = pagination($page,'appapi_list',$where,25,$join,$field);
	        $this->assign('search',$search);
	        $this->assign('data',$data);
	        $this->display();
		}
		// 添加
		public function appapi_add(){
			if (IS_POST) {
				$data = $_POST;
				// print_r($data);die;
				$data['time'] = time();
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$res = M($tablename)->add($data);
				// echo M()->_sql();die;
				if ($res) {
					$this->redirect($tablename);
				}else{
					$this->error('操作失败');
				}
			}else{
				$data = M('rbac_node')->field('id,name,url')->where('pid = 88')->select();
				$this->assign('data',$data);
				$this->display();exit;
			}
		}
		// 编辑
		public function appapi_edit(){
			if (IS_POST) {
				$data = $_POST;
				if($data['j_name'] == '99'){
					$tablename = 'mpapi_list';
				}elseif($data['j_name'] == '100'){
					$tablename = 'payapi_list';
				}elseif($data['j_name'] == '101'){
					$tablename = 'mvapi_list';
				}elseif($data['j_name'] == '102'){
					$tablename = 'wangapi_list';
				}elseif($data['j_name'] == '104'){
					$tablename = 'appapi_list';
				}elseif($data['j_name'] == '89'){
					$tablename = 'message_list';
				}
				$re = M('appapi_list')->where('id = '.$data['id'])->delete();
				$res = M($tablename)->add($data);
				if ($re!==FALSE&&$res!==FALSE) {
					$this->redirect($tablename);
				}else{
					$this->error('更新失败');
				}
			}else{
				$node = M('rbac_node')->field('id,name')->where('pid = 88')->select();
				$data = M('appapi_list')->where('dc_appapi_list.id = '.$_GET['id'])->find();
				$this->assign('node',$node);
				$this->assign('data',$data);
				$this->display();
			}
		}
		// 删除
		public function appapi_delete(){
			$m = M('appapi_list');
	        $res = $m ->where('id ='.I('post.id')) -> delete();
	        if($res){
	            $data['status'] = 1;
	            $data['info'] = '操作成功';
	        }else{
	            $data['status'] = 0;
	            $data['info'] = '操作失败';
	        }
	        $this->ajaxReturn($data);
		}

		// 删除选中
		public function appapi_delAll(){
	        $id = I('id');
	        $where['id'] = array('in',$id);
	        $res = M('appapi_list')->where($where) -> delete();
	        if ($res) {
	        	$data = array('status' => 1,'info' => '删除成功');
	        }else{
	        	$data = array(false,'info' => '删除失败');
	        }
	        $this->ajaxReturn($data);
	    }
		// 查看
		public function appapi_info(){
			$data = M('appapi_list')->where('dc_appapi_list.id = '.$_GET['id'])->find();
			$this->assign('data',$data);
			$this->display();exit;
		}
	}