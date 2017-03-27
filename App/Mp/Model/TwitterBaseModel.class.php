<?php 

namespace Mp\Model;
use Think\Model;

class TwitterBaseModel extends Model {

	//根据分销商id取出分销的等级
	public function get_grade($id)
	{	
		//var_dump($id);
		$where['tb_id'] = array('in',$id);
		$tbdata = $this-> alias('a') 
	            -> join('LEFT JOIN dc_twitter_grade as b ON b.tg_id=a.tb_grade_id')
	            -> where($where)
	            -> field('a.tb_id,b.tg_grade_type,b.tg_grade_name,b.tg_grade_condition,a.tb_grade_expir')
	            -> select();
        var_dump($tbdata);die();
	    $grades = [];
	    foreach($tbdata as $v) 
	    {	
	    	if($v['tg_grade_type'] == 1)
	    	{	
	    		if($v['tb_grade_expir'] == null)
	    		{
	    			$grades[] = [$v['tb_id']=>$v['tg_grade_name']];
	    		}
	    		if($v['tb_grade_expir'] != null && strtotime($v['tb_grade_expir']) > time())
	    		{
	    			$grades[] = [$v['tb_id'] =>$v['tg_grade_name']];
	    		}
	    		if($v['tb_grade_expir'] != null && strtotime($v['tb_grade_expir']) < time())
	    		{	
	    			$grades[] = $this -> grade_cost([$v['tb_id']]);
	    		}    	
	    	}
	    	if($v['tg_grade_type'] == 0)
	    		$grades[] = $this -> grade_cost([$v['tb_id']]);
	    }
	    return $grades;
	}
	//计算等级
	public function grade_cost($id)
	{		
		$commission = $this -> commission_cost($id,2);
		$tgdata = D('twitter_grade') -> where(['token'=>session('token')]) 
									-> where(['tg_grade_type'=>0]) 
									-> field('tg_grade_type,tg_id,tg_grade_name,tg_grade_condition') 
									-> select();		
		$user_grade = [];

		$sort = array(  
        'direction' => 'SORT_ASC', 
        'field'     => 'tg_grade_condition',  
		);  
		$arrSort = array();  
		foreach($tgdata AS $uniqid => $row){  
		    foreach($row AS $key=>$value){  
		        $arrSort[$key][$uniqid] = $value;  
		    }  
		}  
		if($sort['direction']){  
		    array_multisort($arrSort[$sort['field']], constant($sort['direction']), $tgdata);  
		}  


		foreach($tgdata as $tgv)
		{
			foreach($commission as $cv)
			{	
				if((float)$cv['sum(tc_commission)'] >= (float)$tgv['tg_grade_condition'])
				{	
					$user_grade[$cv['tc_twitter_id']] = $tgv['tg_grade_name'];
				}else
					break;
			}
		}
		return $user_grade;
	}
	//计算佣金  $id为数组 $status == 1  未结算  == 2 结算  3提现
	public function commission_cost($id,$cs_status)
	{	
		$tcModel = D('twitter_commission');
		$where['tc_commission_status_id'] = array('eq',$cs_status);
		$tcdata = [];
		foreach($id as $v)
		{
			$where['tc_twitter_id'] = array('eq',$v);
			$res = $tcModel -> where($where) -> field('sum(tc_commission),tc_twitter_id') -> find();
			if($res['sum(tc_commission)']==null && $res['tc_twitter_id'] ==null)
				$tcdata[] = ['sum(tc_commission)'=>0,'tc_twitter_id'=>$v];
			 else
				$tcdata[] = $res;
		}
		return $tcdata;
	}
	//计算推荐人  $id 分销商id 结构为数组
	public function get_referee($id)
	{
	    if(empty($id))
	        return '';
		$where['tb_id'] = array('in',$id);
		$tbdata = $this -> alias('a')
		 		-> join('LEFT JOIN dc_mp_fans as b ON a.tb_referee=b.id')
		 		-> where($where) 
		 		-> field('a.tb_id,b.nickname')
		 		-> select();
        return $tbdata;
	}
	//计算推荐人数
	public function get_referee_mumber()
	{	
		//$mpModel = D('twitter_base');
		$data = $this -> alias('a')
						-> join('LEFT JOIN dc_mp_fans as b ON a.tb_referee = b.id')
						-> group('tb_referee')
						-> field('count(a.tb_referee),b.id as fans_id')
						-> select();
		$dataarr = [];
		foreach($data as $v)
		{
			$dataarr[$v['fans_id']] = $v['count(a.tb_referee)'];
		}
		return $dataarr;
	}

	//计算佣金  $id为数组 $status == 1  未结算  == 2 结算  3提现
	public static function commission_cost1($id,$cs_status)
	{	
		$tcModel = D('twitter_commission');
		$where['tc_commission_status_id'] = array('eq',$cs_status);
		$tcdata = [];

		foreach($id as $v)
		{	
			//var_dump($v);
			$where['tc_twitter_id'] = array('eq',$v);
			$res = $tcModel -> where($where) -> field('sum(tc_commission),tc_twitter_id') -> find();
			if($res['sum(tc_commission)']==null && $res['tc_twitter_id'] ==null)
				$tcdata[] = ['sum(tc_commission)'=>0,'tc_twitter_id'=>$v];
			 else
				$tcdata[] = $res;
		}
		return $tcdata;
	}
}
