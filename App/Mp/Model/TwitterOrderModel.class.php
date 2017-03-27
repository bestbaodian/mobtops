<?php  

namespace Mp\Model;
use Think\Model;

class TwitterOrderModel extends Model {
	/**
	 * 计算关系
	 * 当期买家的粉丝表id
	 */
	public static function get_twitter($id)
	{
		$mfModel = D('mp_fans');
		$mfdata = $mfModel ->　where(['id'=>$id]) ->field('fopenid') -> find();
		if($mfdata)
		{
			$mdata = $mfModel -> alias('a') -> join('LEFT JOIN dc_mp as b ON a.mpid=b.id') -> where(['openid'=>$mfdata['fopenid']]) ->where(['b.token'=>session('token')]) -> find();
			if($mdata)
			{

			}
		}else
		{
			// $tbMdel = D() 
		}
	}

}