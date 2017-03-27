<?php  

use WechatSdk\Wechat;
use WechatSdk\JsSdk;
/*
 * $pid 收益类型id
 * $money 收益
 * */
function get_profit($pid='1',$money='100'){
    $openid = session('openid');
    $fopenid = M('mp_fans')->where("openid = '{$openid}'")->getField('fopenid');
    $twoOpenid = M('mp_fans')->where("openid = '{$fopenid}'")->getField('fopenid');
    $threeOpenid = M('mp_fans')->where("openid = '{$twoOpenid}'")->getField('fopenid');
    $fourOpenid = M('mp_fans')->where("openid = '{$threeOpenid}'")->getField('fopenid');
    $fiveOpenid = M('mp_fans')->where("openid = '{$fourOpenid}'")->getField('fopenid');
    $sixOpenid = M('mp_fans')->where("openid = '{$fiveOpenid}'")->getField('fopenid');
    $sevenOpenid = M('mp_fans')->where("openid = '{$sixOpenid}'")->getField('fopenid');
    $eightOpenid = M('mp_fans')->where("openid = '{$sevenOpenid}'")->getField('fopenid');
    $nineOpenid = M('mp_fans')->where("openid = '{$eightOpenid}'")->getField('fopenid');
    $tenOpenid = M('mp_fans')->where("openid = '{$nineOpenid}'")->getField('fopenid');
    $biliArr = M('fen_profit')->where("id = '{$pid}'")->find();  //得到每级的收益比例
    $num = M('fen_num')->find();   //获取分销级别
    if($num == 1){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            M('fen_record')->add($data);
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 2){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 3){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];
                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 4){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];
                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];
                    if($re3 && $fourOpenid){
                        $da4['openid'] = $fourOpenid;
                        $da4['time'] = time();
                        $da4['fans_openid'] = $openid;
                        $da4['profit'] = $biliArr['fourbili']/100*$money;
                        $re4 = M('fen_record')->add($da4);
                        $arr['fourProfit'] = $da4['profit'];
                    }
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 5){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];
                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];
                    if($re3 && $fourOpenid){
                        $da4['openid'] = $fourOpenid;
                        $da4['time'] = time();
                        $da4['fans_openid'] = $openid;
                        $da4['profit'] = $biliArr['fourbili']/100*$money;
                        $re4 = M('fen_record')->add($da4);
                        $arr['fourProfit'] = $da4['profit'];
                        if($re4 && $fiveOpenid){
                            $da5['openid'] = $fiveOpenid;
                            $da5['time'] = time();
                            $da5['fans_openid'] = $openid;
                            $da5['profit'] = $biliArr['fivebili']/100*$money;
                            $re4 = M('fen_record')->add($da5);
                            $arr['fiveProfit'] = $da5['profit'];
                        }
                    }
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 6){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];

                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];

                    if($re3 && $fourOpenid){
                        $da4['openid'] = $fourOpenid;
                        $da4['time'] = time();
                        $da4['fans_openid'] = $openid;
                        $da4['profit'] = $biliArr['fourbili']/100*$money;
                        $re4 = M('fen_record')->add($da4);
                        $arr['fourProfit'] = $da4['profit'];

                        if($re4 && $fiveOpenid){
                            $da5['openid'] = $fiveOpenid;
                            $da5['time'] = time();
                            $da5['fans_openid'] = $openid;
                            $da5['profit'] = $biliArr['fivebili']/100*$money;
                            $re5 = M('fen_record')->add($da5);

                            $arr['fiveProfit'] = $da5['profit'];

                            if($re5 && $sixOpenid){
                                $da6['openid'] = $sixOpenid;
                                $da6['time'] = time();
                                $da6['fans_openid'] = $openid;
                                $da6['profit'] = $biliArr['sixbili']/100*$money;
                                $re6 = M('fen_record')->add($da6);
                                $arr['sixProfit'] = $da6['profit'];

                            }
                        }
                    }
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 7){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];

                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];

                    if($re3 && $fourOpenid){
                        $da4['openid'] = $fourOpenid;
                        $da4['time'] = time();
                        $da4['fans_openid'] = $openid;
                        $da4['profit'] = $biliArr['fourbili']/100*$money;
                        $re4 = M('fen_record')->add($da4);
                        $arr['fourProfit'] = $da4['profit'];

                        if($re4 && $fiveOpenid){
                            $da5['openid'] = $fiveOpenid;
                            $da5['time'] = time();
                            $da5['fans_openid'] = $openid;
                            $da5['profit'] = $biliArr['fivebili']/100*$money;
                            $re5 = M('fen_record')->add($da5);
                            $arr['fiveProfit'] = $da5['profit'];

                            if($re5 && $sixOpenid){
                                $da6['openid'] = $sixOpenid;
                                $da6['time'] = time();
                                $da6['fans_openid'] = $openid;
                                $da6['profit'] = $biliArr['sixbili']/100*$money;
                                $re6 = M('fen_record')->add($da6);
                                $arr['sixProfit'] = $da6['profit'];

                                if($re6 && $sevenOpenid){
                                    $da7['openid'] = $sevenOpenid;
                                    $da7['time'] = time();
                                    $da7['fans_openid'] = $openid;
                                    $da7['profit'] = $biliArr['sevenbili']/100*$money;
                                    $re7 = M('fen_record')->add($da7);
                                    $arr['sevenProfit'] = $da7['profit'];

                                }
                            }
                        }
                    }
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 8){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];

                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];

                    if($re3 && $fourOpenid){
                        $da4['openid'] = $fourOpenid;
                        $da4['time'] = time();
                        $da4['fans_openid'] = $openid;
                        $da4['profit'] = $biliArr['fourbili']/100*$money;
                        $re4 = M('fen_record')->add($da4);
                        $arr['fourProfit'] = $da4['profit'];

                        if($re4 && $fiveOpenid){
                            $da5['openid'] = $fiveOpenid;
                            $da5['time'] = time();
                            $da5['fans_openid'] = $openid;
                            $da5['profit'] = $biliArr['fivebili']/100*$money;
                            $re5 = M('fen_record')->add($da5);
                            $arr['fiveProfit'] = $da5['profit'];

                            if($re5 && $sixOpenid){
                                $da6['openid'] = $sixOpenid;
                                $da6['time'] = time();
                                $da6['fans_openid'] = $openid;
                                $da6['profit'] = $biliArr['sixbili']/100*$money;
                                $re6 = M('fen_record')->add($da6);
                                $arr['sixProfit'] = $da6['profit'];

                                if($re6 && $sevenOpenid){
                                    $da7['openid'] = $sevenOpenid;
                                    $da7['time'] = time();
                                    $da7['fans_openid'] = $openid;
                                    $da7['profit'] = $biliArr['sevenbili']/100*$money;
                                    $re7 = M('fen_record')->add($da7);
                                    $arr['sevenProfit'] = $da7['profit'];

                                    if($re7 && $eightOpenid){
                                        $da8['openid'] = $eightOpenid;
                                        $da8['time'] = time();
                                        $da8['fans_openid'] = $openid;
                                        $da8['profit'] = $biliArr['eightbili']/100*$money;
                                        $re8 = M('fen_record')->add($da8);
                                        $arr['eightProfit'] = $da8['profit'];

                                    }
                                }
                            }
                        }
                    }
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 9){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];

                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];

                    if($re3 && $fourOpenid){
                        $da4['openid'] = $fourOpenid;
                        $da4['time'] = time();
                        $da4['fans_openid'] = $openid;
                        $da4['profit'] = $biliArr['fourbili']/100*$money;
                        $re4 = M('fen_record')->add($da4);
                        $arr['fourProfit'] = $da4['profit'];

                        if($re4 && $fiveOpenid){
                            $da5['openid'] = $fiveOpenid;
                            $da5['time'] = time();
                            $da5['fans_openid'] = $openid;
                            $da5['profit'] = $biliArr['fivebili']/100*$money;
                            $re5 = M('fen_record')->add($da5);
                            $arr['fiveProfit'] = $da5['profit'];

                            if($re5 && $sixOpenid){
                                $da6['openid'] = $sixOpenid;
                                $da6['time'] = time();
                                $da6['fans_openid'] = $openid;
                                $da6['profit'] = $biliArr['sixbili']/100*$money;
                                $re6 = M('fen_record')->add($da6);
                                $arr['sixProfit'] = $da6['profit'];

                                if($re6 && $sevenOpenid){
                                    $da7['openid'] = $sevenOpenid;
                                    $da7['time'] = time();
                                    $da7['fans_openid'] = $openid;
                                    $da7['profit'] = $biliArr['sevenbili']/100*$money;
                                    $re7 = M('fen_record')->add($da7);
                                    $arr['sevenProfit'] = $da7['profit'];

                                    if($re7 && $eightOpenid){
                                        $da8['openid'] = $eightOpenid;
                                        $da8['time'] = time();
                                        $da8['fans_openid'] = $openid;
                                        $da8['profit'] = $biliArr['eightbili']/100*$money;
                                        $re8 = M('fen_record')->add($da8);
                                        $arr['eightProfit'] = $da8['profit'];

                                        if($re8 && $nineOpenid){
                                            $da9['openid'] = $nineOpenid;
                                            $da9['time'] = time();
                                            $da9['fans_openid'] = $openid;
                                            $da9['profit'] = $biliArr['ninebili']/100*$money;
                                            $re9 = M('fen_record')->add($da9);
                                            $arr['nineProfit'] = $da9['profit'];

                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }
    if($num == 10){
        if($fopenid){
            $data['openid'] = $fopenid;
            $data['time'] = time();
            $data['fans_openid'] = $openid;
            $data['profit'] = $biliArr['onebili']/100*$money;
            $re1 = M('fen_record')->add($data);
            if($re1 && $twoOpenid){
                $da['openid'] = $twoOpenid;
                $da['time'] = time();
                $da['fans_openid'] = $openid;
                $da['profit'] = $biliArr['twobili']/100*$money;
                $re2 = M('fen_record')->add($da);
                $arr['twoProfit'] = $da['profit'];

                if($re2 && $threeOpenid){
                    $da3['openid'] = $threeOpenid;
                    $da3['time'] = time();
                    $da3['fans_openid'] = $openid;
                    $da3['profit'] = $biliArr['threebili']/100*$money;
                    $re3 = M('fen_record')->add($da3);
                    $arr['threeProfit'] = $da3['profit'];

                    if($re3 && $fourOpenid){
                        $da4['openid'] = $fourOpenid;
                        $da4['time'] = time();
                        $da4['fans_openid'] = $openid;
                        $da4['profit'] = $biliArr['fourbili']/100*$money;
                        $re4 = M('fen_record')->add($da4);
                        $arr['fourProfit'] = $da4['profit'];

                        if($re4 && $fiveOpenid){
                            $da5['openid'] = $fiveOpenid;
                            $da5['time'] = time();
                            $da5['fans_openid'] = $openid;
                            $da5['profit'] = $biliArr['fivebili']/100*$money;
                            $re5 = M('fen_record')->add($da5);
                            $arr['fiveProfit'] = $da5['profit'];

                            if($re5 && $sixOpenid){
                                $da6['openid'] = $sixOpenid;
                                $da6['time'] = time();
                                $da6['fans_openid'] = $openid;
                                $da6['profit'] = $biliArr['sixbili']/100*$money;
                                $re6 = M('fen_record')->add($da6);
                                $arr['sixProfit'] = $da6['profit'];

                                if($re6 && $sevenOpenid){
                                    $da7['openid'] = $sevenOpenid;
                                    $da7['time'] = time();
                                    $da7['fans_openid'] = $openid;
                                    $da7['profit'] = $biliArr['sevenbili']/100*$money;
                                    $re7 = M('fen_record')->add($da7);
                                    $arr['sevenProfit'] = $da7['profit'];

                                    if($re7 && $eightOpenid){
                                        $da8['openid'] = $eightOpenid;
                                        $da8['time'] = time();
                                        $da8['fans_openid'] = $openid;
                                        $da8['profit'] = $biliArr['eightbili']/100*$money;
                                        $re8 = M('fen_record')->add($da8);
                                        $arr['eightProfit'] = $da8['profit'];

                                        if($re8 && $nineOpenid){
                                            $da9['openid'] = $nineOpenid;
                                            $da9['time'] = time();
                                            $da9['fans_openid'] = $openid;
                                            $da9['profit'] = $biliArr['ninebili']/100*$money;
                                            $re9 = M('fen_record')->add($da9);
                                            $arr['nineProfit'] = $da9['profit'];

                                            if($re9 && $tenOpenid){
                                                $da10['openid'] = $tenOpenid;
                                                $da10['time'] = time();
                                                $da10['fans_openid'] = $openid;
                                                $da10['profit'] = $biliArr['tenbili']/100*$money;
                                                $re10 = M('fen_record')->add($da10);
                                                $arr['tenProfit'] = $da10['profit'];

                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            $arr['oneProfit'] = $data['profit'];
            return $arr;
        }

    }

}
/*
 * 关注后绑定
 * */
function guanzhu_binging(){
    $open_id = session('openid');
    $ass = M('mp_fans')->where("openid = '{$open_id}'")->getField('fopenid');
    if(!$ass){
        $fopenid = M('fen_session')->where("openid = '{$open_id}'")->getField('fopenid');

        if($fopenid){

            $ress = M('mp_fans')->where("openid = '{$open_id}'")->setField('fopenid',$fopenid);
            if($ress){
                M('fen_session')->where("openid = '{$open_id}'")->delete();
            }
        }
    }
}
/*
 * 分享图标
 * $url 跳转路径
 * */
function get_logo($url=''){

    if($url != ''){

        $url = str_replace("/","ss",$url);
    }

    $openid = session('openid');
    $jssdk = new \WechatSdk\JsSdk(C('WX_APPID'), C('WX_APPSECRET'));

    $signPackage = $jssdk->GetSignPackage();
    $res = M('fenxiao_info')->find();

//        $signPackage['logo'] = C('LOGO_URL').$res['logo']; //分享小标图
    $signPackage['logo'] = $res['logo']; //分享小标图
    $signPackage['title'] = $res['title'];                                                               //分享标题
    $signPackage['link'] = C('LOGO_URL')."/?s=/addon/Distribution/Mobile/fenxiao/fopenid/".$openid.'/url/'.$url;               //分享链接
    $signPackage['desc'] = $res['desc'];                                                          //分享描述
   return $signPackage;
}




//获得分销级别
//function get_num(){
//    $re = M('fenxiao_num')->find();
//    return $re['num'];
//}
///*
// * 获得返还比例
// * $pid 收益类型id
// * */
//function get_bili($pid){
//    $re = M('fenxiao_profit')->where("id = '{$pid}'")->find();
//    $data['one'] = $re['onebili']/100;
//    $data['two'] = $re['twobili']/100;
//    return $data;
//}
///*
// * 获得父级openid
// * $openid  当前openid
// * */
//function getFatherOpenid($openid){
//    $fopenid = M('mp_fans')->where("openid = '{$openid}'")->getField('fopenid');
//    return $fopenid;
//}
///*
// * 获得二级openid
// * $openid  当前openid
// * */
//function getGrandOpenid($openid){
//    $yopenid = M('mp_fans')->where("openid = '{$openid}'")->getField('yopenid');
//    return $yopenid;
//}


function dd($data){
    echo "<pre>";
    print_r($data);
    echo "</pre>";
}

/**
 * 弹框
 */
function alerts($str, $url="") {
    if($url == '') {
        $url = $_SERVER["HTTP_REFERER"];
    }
    echo "<script>alert('".$str."');location.href='".$url."';</script>";
}
/**
 * 系统公共库文件
 * 主要定义系统公共函数库
 */
function endTime($stime,$yue){

    $ktime=date('Y-m-d H:i:s',$stime);
    $tyue=strtotime("$ktime +$yue month");
    return $tyue;
}
/**
 * @param string $url
 * 生成二维码
 */
function  img($url = 'http://www.baidu.com',$size=4) {
    vendor("phpqrcode.phpqrcode");
    $data = $url;
    // 纠错级别：L、M、Q、H
    $level = 'L';
    // 点的大小：1到10,用于手机端4就可以了

    // 下面注释了把二维码图片保存到本地的代码,如果要保存图片,用$fileName替换第二个参数false
    //	$path = __ROOT__."/Public/Uploads/";
    ////	 生成的文件名
    //	$fileName = $path.$size.'.png';
    QRcode::png($data, false, $level, $size);
}
function http_get($url){
    $oCurl = curl_init();
    if(stripos($url,"https://")!==FALSE){
        curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
        curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
    }
    curl_setopt($oCurl, CURLOPT_URL, $url);
    curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
    $sContent = curl_exec($oCurl);
    $aStatus = curl_getinfo($oCurl);
    curl_close($oCurl);
    if(intval($aStatus["http_code"])==200){
        return $sContent;
    }else{
        return false;
    }
}
/**
 * 添加钩子
 * @author 魔派<180256122@qq.com>
 */
function add_hook($tag,$name) {
    \Think\Hook::add($tag,$name);
}

/**
 * 执行钩子
 * @author 魔派<180256122@qq.com>
 */
function hook($tag, $params=NULL) {
    return \Think\Hook::listen($tag,$params);
}

/**
 * 生成插件访问链接
 * @author 魔派<180256122@qq.com>
 */
function create_addon_url($url, $param = array()){
    if (!$param['mpid']) {
       // $param['mpid'] = get_mpid();
    }
    if (CONTROLLER_NAME == 'Mobile') {
        $act = 'mobile';
    } elseif (CONTROLLER_NAME == 'Web') {
        $act = 'web';
    } else {
        $act = strtolower(CONTROLLER_NAME);
    }
    return U('/addon/'.get_addon().'/'.$act.'/'.$url.'@'.C('HTTP_HOST'), $param);
}

/**
 * 生成移动端访问链接
 */
function create_mobile_url($url, $param = array()) {
    return U('/addon/'.get_addon().'/mobile/'.$url.'@'.C('HTTP_HOST'), $param);
}


/**
 * 设置/获取当前公众号标识
 * @author 魔派<180256122@qq.com>
 */
function get_mpid($mpid = '') {
    if ($mpid) {                            // 手动设置当前公众号
        session('mpid', intval($mpid));
        session('token', M('mp')->where(array('id'=>$mpid))->getField('token'));
    } elseif (I('mpid')) {                  // 如果浏览器中带有公众号标识，则设置为当前公众号
        session('mpid', intval(I('mpid')));   
        session('token', M('mp')->where(array('id'=>I('mpid')))->getField('token'));      
    }
    $mpid = session('mpid');                        // 返回当前公众号标识
    if (empty($mpid)) {                             // 如果公众号标识不存在，则返回0
        return 0;
    }
    return $mpid;
}

/**
 * 设置/获取当前公众号标识
 * @author 魔派<180256122@qq.com>
 */
function get_token($token = '') {
    if ($token) {
        session('token', $token);
        session('mpid', M('mp')->where(array('token'=>$token))->getField('id'));
    } elseif (I('token')) {
        session('token', I('token'));
        session('mpid', M('mp')->where(array('token'=>I('token')))->getField('id'));
    }
    $token = session('token');
    if (empty($token)) {
        return null;
    }
    return $token;
}

/**
 * 获取公众号信息
 * @author 魔派<180256122@qq.com>
 */
function get_mp_info($mpid = '') {
    if (empty($mpid)) {
        $mpid = get_mpid();
    }
    // $mp_info = D('Mp')->get_mp_info($mpid);
    $mp_info = M('mp')->where("id=$mpid")->find();
    return $mp_info;
}

/**
 * 设置/获取用户标识
 * @author 魔派<180256122@qq.com>
 */
function get_openid($openid = '') {
    $token = get_token();                     
    if (empty($token)) {                         // 如果公众号标识不存在
        return null;
    }
    if ($openid) {                              // 设置当前用户标识
        session('openid_'.$token, $openid);
    } elseif (I('openid')) {                    // 如果浏览器带有openid参数，则缓存用户标识
        session('openid_'.$token, I('openid'));
    }
    $openid = session('openid_'.$token);                 // 获取当前用户标识
    if (empty($openid)) {
        return null;
    }
    return $openid;
}

// /**
// 	 * 根据公众号ID获取公众号基本信息
// 	 * @author 魔派<180256122@qq.com>
// 	 */
// 	public function get_mp_info($mpid = '') {
// 		if (!$mpid) {
// 			return false;
// 		}
// 		$mp_info = $this->find(intval($mpid));
// 		if (!$mp_info) {
// 			return false;
// 		}
// 		return $mp_info;
// 	}

/**
 * 初始化粉丝信息
 */
function init_fans() {
    $mp_info = get_mp_info();
    $mpid = get_mpid();
    $openid = get_openid();
    $token = get_token();
    // echo $openid;exit;
    if (empty($openid) && is_wechat_browser() && $mp_info['appid'] && $mp_info['appsecret'] && $mp_info['type'] == 4) {     // 通过网页授权拉取用户标识
        $wechatObj = get_wechat_obj();
        if ($wechatObj->checkAuth($mp_info['appid'], $mp_info['appsecret'])) {              // 公众号有网页授权的权限
            $callback = get_current_url();                  // 当前访问地址
            $redirect_url = $wechatObj->getOauthRedirect($callback);        // 网页授权跳转地址
            if (!I('code')) {                               // 授权跳转第一步
                redirect($redirect_url);
            } elseif (I('code')) {                          // 授权跳转第二步
                $result = $wechatObj->getOauthAccessToken();
                $user_info = $wechatObj->getOauthUserinfo($result['access_token'], $result['openid']);
                if ($user_info) {
                    $fans_info = M('mp_fans')->where(array('mpid'=>get_mpid(),'openid'=>$result['openid']))->find();
                    if ($fans_info) {
                        if ($fans_info['is_bind'] !== 1) {
                            $update['nickname'] = $user_info['nickname'];
                            $update['sex'] = $user_info['sex'];
                            $update['country'] = $user_info['country'];
                            $update['province'] = $user_info['province'];
                            $update['city'] = $user_info['city'];
                            $update['headimgurl'] = $user_info['headimgurl'];
                            M('mp_fans')->where(array('mpid'=>get_mpid(),'openid'=>$result['openid']))->save($update);
                        }
                    } else {
                        $insert['mpid'] = get_mpid();
                        $insert['openid'] = $result['openid'];
                        $insert['is_subscribe'] = 0;
                        $insert['nickname'] = $user_info['nickname'];
                        $insert['sex'] = $user_info['sex'];
                        $insert['country'] = $user_info['country'];
                        $insert['province'] = $user_info['province'];
                        $insert['city'] = $user_info['city'];
                        $insert['headimgurl'] = $user_info['headimgurl'];
                        M('mp_fans')->add($insert);
                    }
                } 
                session('openid_'.$token, $result['openid']);        // 缓存用户标识
                redirect($callback);                                 // 跳转回原来的地址
            }
        }
    }
}
/**
 * 获取jssdk参数
 */
function get_jssdk_sign_package() {
    $mp_info = get_mp_info();
    $jssdk = new JsSdk($mp_info['appid'], $mp_info['appsecret']);
    $sign_package = $jssdk->getSignPackage();        // 获取jssdk配置包
    return $sign_package;
}

/**
 * 获取微信支付参数
 * @author 魔派<180256122@qq.com>
 */
function get_jsapi_parameters($data) {
    vendor('WechatPaySdk.WxPayPubHelper');
    $appid = M('mp_setting')->where(array('mpid'=>get_mpid(),'name'=>'appid'))->getField('value');
    $appsecret = M('mp_setting')->where(array('mpid'=>get_mpid(),'name'=>'appsecret'))->getField('value');
    $mchid = M('mp_setting')->where(array('mpid'=>get_mpid(),'name'=>'mchid'))->getField('value');
    $paysignkey = M('mp_setting')->where(array('mpid'=>get_mpid(),'name'=>'paysignkey'))->getField('value');
    $jsApi = new JsApi_pub($appid,$mchid,$paysignkey,$appsecret); 
    $orderid = $data['orderid'];      
    if($orderid == ""){
        $orderid = $data['single_orderid'];
    }   
    $price= floatval($data['price']);
    $data['mpid'] = get_mpid();
    unset($data['price']);
    $unifiedOrder = new UnifiedOrder_pub($appid,$mchid,$paysignkey,$appsecret);
    $unifiedOrder->setParameter("openid",session('openid'));
    // $unifiedOrder->setParameter("openid",C('M_OPENID')); 
    $unifiedOrder->setParameter("body",$orderid);
    $unifiedOrder->setParameter("out_trade_no",$orderid);
    // $unifiedOrder->setParameter("total_fee",1);
    $unifiedOrder->setParameter("total_fee",$price*100);
    $unifiedOrder->setParameter("notify_url", C('HTTP_HOST') . '/Data/notify.php');
    $unifiedOrder->setParameter("trade_type","JSAPI");
    $unifiedOrder->setParameter("attach", json_encode($data));//附加数据
    $prepay_id = $unifiedOrder->getPrepayId();
    $jsApi->setPrepayId($prepay_id);
    $jsApiParameters = $jsApi->getParameters();
    return $jsApiParameters;
}


/**
 * 获取插件模型
 * @author 魔派<180256122@qq.com>
 */
function get_addon_model($model) {
    return D('Addons')->get_addon_model($model);
}

/**
 * 获取插件侧边导航
 * @author 魔派<180256122@qq.com>
 */
function get_addon_config($addon) {
    if (empty($addon)) {
        return false;
    }
    $addon_config = include ADDON_PATH . $addon . '/config.php';
    return $addon_config;
}

/**
 * 获取插件配置信息
 * @author 魔派<180256122@qq.com>
 */
function get_addon_settings($addon = '', $mpid = '') {
    if ($addon == '') {
        $addon = get_addon();
    }
    if ($mpid == '') {
        $mpid = get_mpid();
    }
    if (!$addon || !$mpid) {
        return false;
    }
    $addon_settings = D('AddonSetting')->get_addon_settings($addon, $mpid);
    if (!$addon_settings) {
        return false;
    }
    return $addon_settings;
}

/**
 * 获取功能入口信息
 * @author 魔派<180256122@qq.com>
 */
function get_addon_entry($act, $addon = '', $mpid = '') {
    if ($addon == '') {
        $addon = get_addon();
    }
    if ($mpid == '') {
        $mpid = get_mpid();
    }
    if (!$act || !$addon || !$mpid) {
        return false;
    }
    $addon_entry = D('AddonEntry')->get_addon_entry($act, $addon, $mpid);
    if (empty($addon_entry)) {
        $addon_config = get_addon_config($addon);
        foreach ($addon_config['entry_list'] as $k => $v) {
            if ($v['act'] == $act) {
                $addon_entry['name'] = $v['name'];
                $addon_entry['act'] = $v['act'];
                $addon_entry['url'] = U('Mobile/'.$v['act'].'@'.C('HTTP_HOST'), array('addon'=>$addon));
                break;
            }
        }
    } else {
        $addon_entry['url'] = U('Mobile/'.$addon_entry['act'].'@'.C('HTTP_HOST'), array('addon'=>$addon));
        $addon_entry['rule'] = D('MpRule')->get_entry_($addon_entry['id']);
    }
    
    if (!isset($addon_entry)) {
        return false;
    }
    return $addon_entry;
}

/**
 * 获取入口信息
 * @author 魔派<180256122@qq.com>
 */
function get_entry_info($entry_id) {
    if (!$entry_id) {
        return false;
    }
    $entry_info = D('AddonEntry')->get_entry_info($entry_id);
    return $entry_info;
}

/**
 * 获取插件响应规则
 * @author 魔派<180256122@qq.com>
 */
function get_addon_rule($addon = '', $mpid = '') {
    if ($addon == '') {
        $addon = get_addon();
    }
    if ($mpid == '') {
        $mpid = get_mpid();
    }
    if (!$addon || !$mpid) {
        return false;
    }
    $addon_rule = D('MpRule')->get_respond_rule();
    return $addon_rule;
}

/**
 * 获取当前访问的完整URL地址
 * @author 魔派<180256122@qq.com>
 */
function get_current_url() {
    $url = 'http://';
    if (isset ( $_SERVER ['HTTPS'] ) && $_SERVER ['HTTPS'] == 'on') {
        $url = 'https://';
    }
    if ($_SERVER ['SERVER_PORT'] != '80') {
        $url .= $_SERVER ['HTTP_HOST'] . ':' . $_SERVER ['SERVER_PORT'] . $_SERVER ['REQUEST_URI'];
    } else {
        $url .= $_SERVER ['HTTP_HOST'] . $_SERVER ['REQUEST_URI'];
    }
    // 兼容后面的参数组装
    if (stripos ( $url, '?' ) === false) {
        $url .= '?t=' . time ();
    }
    return $url;
}

/**
 * 根据公众号标识获取公众号基本信息
 * @author 魔派<180256122@qq.com>
 */
function get_wechat_info($token = '') {
    $token || $token = session('token');                // 获取token
    $wechatInfo = M('mp')->where(array('token'=>$token))->find();
    return $wechatInfo;
}

/**
 * 获取微信api对象
 * @author 魔派<180256122@qq.com>
 */
function get_wechat_obj() {
    $wechatInfo = get_mp_info();
    $options = array(
        'token'             =>  $wechatInfo['valid_token'],                 
        'encodingaeskey'    =>  $wechatInfo['encodingaeskey'],      
        'appid'             =>  $wechatInfo['appid'],               
        'appsecret'         =>  $wechatInfo['appsecret']            
    );
    $wechatObj = new Wechat($options);
    $wechatObj->getRev();
    return $wechatObj;
}

/**
 * 回复文本消息
 * @author 魔派<180256122@qq.com>
 */
function reply_text($text) {
    $wechatObj = get_wechat_obj();
    if (!$text) {
        return;
    }
    return $wechatObj->text($text)->reply();
}

/**
 * 回复图文消息
 * @author 魔派<180256122@qq.com>
 */
function reply_news($articles) {
    $wechatObj = get_wechat_obj();
    return $wechatObj->news($articles)->reply();
}

/**
 * 回复音乐消息
 * @author 魔派<180256122@qq.com>
 */
function reply_music($arr) {
    if (!isset($arr['title']) || !isset($arr['description']) || !$arr['musicurl']) {
        return false;
    }
    $wechatObj = get_wechat_obj();
    return $wechatObj->music($arr['title'], $arr['description'], $arr['musicurl'], $arr['hgmusicurl'], $arr['thumbmediaid'])->reply();
} 

/**
 * 发送客服消息
 * @author 魔派<180256122@qq.com>
 */
function send_custom_message($data) {
    $wechatObj = get_wechat_obj();
    $result = $wechatObj->sendCustomMessage($data);
    if (!$result) {
        return $wechatObj->errMsg;
    }
    return $result;
}

function get_menu() {
    $wechatObj = get_wechat_obj();
    return $wechatObj->getMenu();
}

function create_menu($data) {
    $wechatObj = get_wechat_obj();
    $result = $wechatObj->createMenu($data);
    if (!$result) {
        $result['errcode'] = $wechatObj->errCode;
        $result['errmsg'] = $wechatObj->errMsg;
    }
    return $result;
}

function delete_menu() {
    $wechatObj = get_wechat_obj();
    $result = $wechatObj->deleteMenu();
    if (!$result) {
        return $wechatObj->errMsg;
    }
    return $result;
}

/**
 * 创建二维码ticket
 * @param int|string $scene_id 自定义追踪id,临时二维码只能用数值型
 * @param int $type 0:临时二维码；1:永久二维码(此时expire参数无效)；2:永久二维码(此时expire参数无效)
 * @param int $expire 临时二维码有效期，最大为1800秒
 * @return array('ticket'=>'qrcode字串','expire_seconds'=>1800,'url'=>'二维码图片解析后的地址')
 */
function get_qr_code($scene_id,$type=0,$expire=1800){
    $wechatObj = get_wechat_obj();
    $result = $wechatObj->getQRCode($scene_id,$type,$expire);
    if (!$result) {
        $return['errcode'] = 1001;
        $return['errmsg'] = $wechatObj->errMsg;
        return $return;
    }
    return $result;
}

/**
 * 获取二维码图片
 * @param string $ticket 传入由getQRCode方法生成的ticket参数
 * @return string url 返回http地址
 */
function get_qr_url($ticket) {
    $wechatObj = get_wechat_obj();
    return $wechatObj->getQRUrl($ticket);
}

/**
 * 长链接转短链接接口
 * @param string $long_url 传入要转换的长url
 * @return boolean|string url 成功则返回转换后的短url
 */
function get_short_url($long_url){
    $wechatObj = get_wechat_obj();
    return $wechatObj->getShortUrl($long_url);
}

/**
 * 获取接收TICKET
 */
function get_rev_ticket(){
    $wechatObj = get_wechat_obj();
    return $wechatObj->getRevTicket();
}

/**
* 获取二维码的场景值
*/
function get_rev_scene_id(){
    $wechatObj = get_wechat_obj();
    return $wechatObj->getRevSceneId();
}

/**
 * 利用微信接口获取微信粉丝信息
 * @author 魔派<180256122@qq.com>
 */
function get_fans_wechat_info($openid = '') {
    $openid || $openid = get_openid();
    $wechatObj = get_wechat_obj();
    return $wechatObj->getUserInfo($openid);
}

/**
 * 获取粉丝基本资料
 * @author 魔派<180256122@qq.com>
 */
function get_fans_info($openid = '', $field = '') {
    if ($openid == '') {
        $openid = get_openid();
    }
    if (!$openid) {
        return false;
    }
    $fans_info = D('MpFans')->get_fans_info($openid, $field);
    if (!$fans_info) {
        return false;
    }
    return $fans_info;
}

/**
 * 获取粉丝头像
 * @author 魔派<180256122@qq.com>
 */
function get_fans_headimg($openid = '', $attr = 'width=50 height=50') {
    if ($openid == '') {
        $openid = get_openid();
    }
    if (!$openid) {
        return false;
    }
    $headimgurl = get_fans_info($openid, 'headimgurl');
    if (empty($headimgurl)) {
        $headimgurl = __ROOT__ . '/Public/Admin/img/noname.jpg';
    }
    return "<img src='".$headimgurl."' ".$attr." />";
}

function get_fans_nickname($openid) {
    if ($openid == '') {
        $openid = get_openid();
    }
    if (!$openid) {
        return false;
    }
    $nickname = get_fans_info($openid, 'nickname');
    if (empty($nickname)) {
        $nickname = '匿名';
    }
    return $nickname;
}

function get_nickname($openid) {
    return D('MpFans')->get_fans_info($openid, 'nickname');
}

function get_headimg($openid) {
    return D('MpFans')->get_fans_info($openid, 'headimgurl');
}

function get_message($msgid) {
    $message = D('MpMessage')->get_message($msgid);
    switch ($message['msgtype']) {
        case 'text':
            return $message['content'];
            break;
        case 'image':
            // 感谢 @  平凡<58000865@qq.com> 提供的微信图片防盗链解决方案
            return '<img src="http://www.zorhand.com/img?url='.$message['picurl'].'" width="100" height="100" />';      
            break;
        default:
            return '';
            break;
    }
}

/**
 * 将图片路径或者媒体文件转换为可访问的图片地址
 * @author 魔派<180256122@qq.com>
 */
function tomedia($path) {
    if (preg_match('/(.*?)\.(jpg|jpeg|png|gif)$/', $path)) {
        if (preg_match('/^\.\/(.*)\.(jpg|png|gif|jpeg)$/', $path)) {
            return str_replace('./', SITE_URL, $path);
        } else {
            return $path;
        }
    } else {
        return SITE_URL . 'Public/Admin/img/nopic.jpg';
    }
}

/**
 * 增加积分
 * @author 魔派<180256122@qq.com>
 */
function add_score($value,$remark='',$type='score',$flag='',$source='addon') {
    return D('MpScoreRecord')->add_score($value,$remark,$type,$flag,$source);
}

/**
 * 获取积分
 */
function get_score($type='', $source='', $flag='', $openid='') {
    return D('MpScoreRecord')->get_score($type, $source, $flag, $openid);
}

/**
 * 创建目录或文件
 * @author 魔派<180256122@qq.com>
 */
function create_dir_or_files($files) {
    foreach ( $files as $key => $value ) {
        if (substr ( $value, - 1 ) == '/') {
            mkdir ( $value );
        } else {
            @file_put_contents ( $value, '' );
        }
    }
}
/**
 * 生成随机字符串
 * @param $length int 字符串长度
 * @return $nonce string 随机字符串
 */
function get_nonce($length=32) {
	$str = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$nonce = '';
	for ($i=0; $i<$length; $i++) {
		$nonce .= $str[mt_rand(0, 61)];
	}
	return $nonce;
}

/**
 * 检测用户是否登录
 * @author 魔派<180256122@qq.com>
 */
function is_user_login() {
    $user_id = session('user_id');
    if (!$user_id || $user_id < 0) {
        return false;
    } else {
        return true;
    }
}

/**
 * 获取当前用户ID
 * @author 魔派<180256122@qq.com>
 */
function get_user_id() {
	$user_id = session('user_id');
    if (!$user_id || $user_id < 0) {
        return false;
    }
    return $user_id;
}

/**
 * 获取用户资料
 * @author 魔派<180256122@qq.com>
 */
function get_user_info($user_id = '') {
    if (!$user_id) {
        $user_id = get_user_id();
    }
    $user_info = M('user')->find($user_id);
    return $user_info;
}



/**
 * 判断是否处在微信浏览器内
 * @author 魔派<180256122@qq.com>
 */
function is_wechat_browser() {
    $agent = $_SERVER ['HTTP_USER_AGENT'];
    if (! strpos ( $agent, "icroMessenger" )) {
        return false;
    }
    return true;
}


/**
 * 执行sql文件
 * @author 魔派<180256122@qq.com>
 */
function execute_sql_file($sql_path) {
    // 读取SQL文件
    $sql = file_get_contents($sql_path);
    $sql = str_replace("\r", "\n", $sql);
    $sql = explode(";\n", $sql);
    
    // 替换表前缀
    $orginal = 'dc_';
    $prefix = C('DB_PREFIX');
    $sql = str_replace("{$orginal}", "{$prefix}", $sql);
    
    // 开始安装
    foreach ($sql as $value) {
        $value = trim($value);
        if (empty($value)) {
            continue;
        }
        $res = M()->execute($value);
    }
}

/**
 * 生成分页导航
 * @author 魔派<180256122@qq.com>
 */
// function pagination($count, $per = 10, $params = array()) {
//     if (!$count || intval($count) < 0) {
//         return '';
//     }
//     if (get_addon()) {
//         $params['addon'] = get_addon();
//     }
//     $Page = new \Think\Page($count, $per, $params);
//     $Page->setConfig('rollPage', 7);
//     $Page->setConfig('lastSuffix', false);
//     $Page->setConfig('page_begin_wrap', '<div class="page-control"><ul class="pagination pull-right">');    
//     $Page->setConfig('page_end_wrap', '</ul></div>');
//     $Page->setConfig('link_begin_wrap', '<li>');
//     $Page->setConfig('link_end_wrap', '</li>');
//     $Page->setConfig('current_begin_wrap', '<li class="active"><a>');
//     $Page->setConfig('current_end_wrap', '</a></li>');
//     $Page->setConfig('first', '<<');
//     $Page->setConfig('last', '>>');
//     $Page->setConfig('prev', '<');  
//     $Page->setConfig('next', '>');  
//     $pagination = $Page->show();
//     return $pagination;
// }
/**
*自定义分页类
*@param $page 当前页 $tablename  表名 $condition 条件 $pagenum 每页显示条数
*/
function pagination($page,$tablename,$condition,$pagenum){
    $page = isset($page) ? $page : 1;
    $count = M($tablename)-> where($condition)->count();
    //设置每页记录数
    $pagesize = $pagenum;
    //查看总页数
    $pagesum = ceil($count/$pagesize);
    if($pagesum == 0){
        $pagesum = 1;
    }
    //上下页
    $pre = ($page-1 < 1) ? 1 : $page-1;

    $next = ($page+1 > $pagesum) ? $pagesum : $page+1;
    //偏移量
    $start = ($page-1)*$pagesize;
    //limit分页查询数据
    $list = M($tablename)->where($condition)->limit("$start,$pagesize")->select();
    $str = "<a href='javascript:page(1)'>首页</a>
            <a href='javascript:page($pre)'>上一页</a>
            <a href='javascript:page($next)'>下一页</a>
            <a href='javascript:page($pagesum)'>末页</a>";
    $data['pre'] = $pre;
    $data['next'] = $next;
    $data['str'] = $str;
    $data['page'] = $page;
    $data['counts'] = $count;
    $data['lists'] = $list;
    $data['pagesum'] = $pagesum;
    return $data;
}

//分页 v2.0 $page 当前页  $results 结果集  $pagenum每页显示条数

function paginations($page,$count,$pagenum){
    $page = isset($page) ? $page : 1;
    //设置每页记录数
    $pagesize = $pagenum;
    //查看总页数
    $pagesum = ceil($count/$pagesize);
    if($pagesum == 0){
        $pagesum = 1;
    }
    //上下页
    $pre = ($page-1 < 1) ? 1 : $page-1;

    $next = ($page+1 > $pagesum) ? $pagesum : $page+1;
    //偏移量
    $start = ($page-1)*$pagesize;
    $data['pre'] = $pre;
    $data['next'] = $next;
    $data['str'] = $str;
    $data['page'] = $page;
    $data['counts'] = $count;
    $data['pagesum'] = $pagesum;
    $data['start'] = $start;
    return $data;
}



/**
 * 获取当前访问的插件名称
 * @author 魔派<180256122@qq.com>
 */
function get_addon() {
    preg_match('/\/addon\/([^\/]+)/', '/'.$_SERVER['PATH_INFO'], $m);
    if (!$m[1]) {
        return false;
    }
    return $m[1];
}

function get_agent() {
    $agent = $_SERVER ['HTTP_USER_AGENT']; 
    return $agent;
}

function get_ip(){
    if (isset($_SERVER['HTTP_CLIENT_IP']) and !empty($_SERVER['HTTP_CLIENT_IP'])){
        return $_SERVER['HTTP_CLIENT_IP'];
    }
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) and !empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
        return strtok($_SERVER['HTTP_X_FORWARDED_FOR'], ',');
    }
    if (isset($_SERVER['HTTP_PROXY_USER']) and !empty($_SERVER['HTTP_PROXY_USER'])){
        return $_SERVER['HTTP_PROXY_USER'];
    }
    if (isset($_SERVER['REMOTE_ADDR']) and !empty($_SERVER['REMOTE_ADDR'])){
        return $_SERVER['REMOTE_ADDR'];
    } else {
        return "0.0.0.0";
    }
}
function pages($model, $where='',$order='id asc',$page_size=25) {
    $count  = $model->where($where)->count();// 查询满足要求的总记录数
    $Page = new \Think\Pages($count,$page_size,$str='new',$class='');// 实例化分页类 传入总记录数和每页显示的记录数(25)
    $show = $Page->show();// 分页显示输出
    $member = $model->limit($Page->firstRow.','.$Page->listRows)->where($where)->order($order)->select();
    $arr['page'] = $show;
    $arr['list'] = $member;
    return $arr;
}
function get_cate($arr,$pid = 0,$level = 0){
    static  $data = [];
    foreach($arr as $k=>$v){
        if($v['re_pid']==$pid){
            $v['level']=$level;
            $data[]=$v;
            get_cate($arr,$v['re_id'],$level+1);
        }
    }
    return $data;
}
//批量删除函数
function delAll($table,$where){
    static $data = [];
    $where =  trim($where,',');
    $res = M($table)-> delete($where);
    if($res){
        $data['status'] = 1;
        $data['info'] = '删除成功';
    }else{
        $data['status'] = 0;
        $data['info'] = '删除失败';
    }
    return $data;
}

//
function removeRepeat($b){

}

/**
*单个删除功能封装
*/
function delete_one($tablename,$condition){
    $res = M($tablename)->where($condition)->delete();
    if($res){
          $data['status'] = 1;
          $data['info'] = "删除成功";
    }else{
          $data['status'] = 0;
          $data['info'] = "删除失败";
    }
    return $data;
}

/**
*批量删除功能封装
*/
function delete_all($tablename,$str){
    $lengths = strlen($str);
    $val = substr($str,0,lengths-1);
    // echo $val;die;
    $res = M($tablename)->delete($val);
    if($res){
        $data['status'] = 1;
        $data['info'] = '删除成功';
    }else{
        $data['status'] = 0;
        $data['info'] = '删除失败';
    }
    return $data;
}

/**
 *   订单号
*  @return number
 *   @author root@258025.com
*/
function build_order_no(){
  return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
}
function trimall($str)//删除空格
     {
     $qian=array(" ","　","\t","\n","\r");$hou=array("","","","","");
     return str_replace($qian,$hou,$str);    
 }
 function curl_func($url,$method,$data){
    $ch = curl_init();   //1.初始化  
    curl_setopt($ch, CURLOPT_URL, $url); //2.请求地址  
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);//3.请求方式
    if($method=="POST"){//5.post方式的时候添加数据  
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);  
    }  
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);  
    $tmpInfo = curl_exec($ch);//6.执行  
    curl_close($ch);//8.关闭
    return $tmpInfo;
}
function getMillisecond(){
	list($t1, $t2) = explode(' ', microtime());
	return (float)sprintf('%.0f',(floatval($t1)+floatval($t2))*1000);
}
function postSMS($url,$data='')
{
	$row = parse_url($url);
	$host = $row['host'];
	$port = $row['port'] ? $row['port']:80;
	$file = $row['path'];
	while (list($k,$v) = each($data)) 
	{
		$post .= rawurlencode($k)."=".rawurlencode($v)."&";	//转URL标准码
	}
	$post = substr( $post , 0 , -1 );
	$len = strlen($post);
	$fp = @fsockopen( $host ,$port, $errno, $errstr, 10);
	if (!$fp) {
		return "$errstr ($errno)\n";
	} else {
		$receive = '';
		$out = "POST $file HTTP/1.0\r\n";
		$out .= "Host: $host\r\n";
		$out .= "Content-type: application/x-www-form-urlencoded\r\n";
		$out .= "Connection: Close\r\n";
		$out .= "Content-Length: $len\r\n\r\n";
		$out .= $post;		
		fwrite($fp, $out);
		while (!feof($fp)) {
			$receive .= fgets($fp, 128);
		}
		fclose($fp);
		$receive = explode("\r\n\r\n",$receive);
		unset($receive[0]);
		return implode("",$receive);
	}
}
    function findNum($str=''){
            $str=trim($str);
            if(empty($str)){return '';}
            $temp=array('1','2','3','4','5','6','7','8','9','0');
            $result='';
            for($i=0;$i<strlen($str);$i++){
                if(in_array($str[$i],$temp)){
                    $result.=$str[$i];
                }
            }
            return $result;
        }
/**
 * 生成0~1随机小数
 * @param  Int   $min
 * @param  Int   $max
 * @return Float
 */
function randFloat($min=0, $max=1){
    return $min + mt_rand()/mt_getrandmax() * ($max-$min);
}
function objarray_to_array($obj) {
    $ret = array();
    foreach ($obj as $key => $value) {
        if (gettype($value) == "array" || gettype($value) == "object"){
            $ret[$key] =  objarray_to_array($value);
        }else{
            $ret[$key] = $value;
        }
    }
    return $ret;
}
/**
 * curl  post请求
 */

function https_post($url, $data = null){
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
    if (!empty($data)){
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    }
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    $output = curl_exec($curl);
    curl_close($curl);
    return $output;
}

