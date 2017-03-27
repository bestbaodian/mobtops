<?php
//处理地址数据

function getData($data,$pid = 0,$child ='child'){
    $arr =  [];
    foreach($data as $K=>$v){
        if($v['pid'] == $pid){
            $v[$child] = getData($data,$v['id']);
            if($v[$child] == null){
                unset($v[$child]);
            }
            $arr[] = $v;
        }
    }
    return $arr;
}
function setData($where=''){
    $data = getData(M('address_lists') ->where($where) -> select());
    return  $data;
}

//获取公众号的token
function getMaToken(){
    $token = M('mp') -> where(array('appid'=>C('M_APPID'))) ->getField('token');
    return $token;
}

//验证码函数
function check_verify($code, $id = ""){
    $verify = new \Think\Verify();
    return $verify->check($code, $id);
}
//计算年龄
function get_age($birthday){
    $age = date('Y', time()) - date('Y', strtotime($birthday)) - 1;
    if (date('m', time()) == date('m', strtotime($birthday))){
        if (date('d', time()) > date('d', strtotime($birthday))){
            $age++;
        }
    }elseif (date('m', time()) > date('m', strtotime($birthday))){
        $age++;
    }
    return $age;
}
?>