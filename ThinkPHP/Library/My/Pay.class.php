<?php
/**
 * Created by PhpStorm.
 * User: 张宪强|So-Love-KK
 * Date: 2016/8/19
 * Time: 13:46
 */

namespace My;

vendor("WechatPaySdk.WxPayPubHelper");
class Pay
{
    public static function info($price, $openid,$notify_url = '',$shopid='') {
        $jssdk = new \My\JSSDK(C('RED_APPID'), C('RED_APPSECRET'));
        $signPackages = $jssdk->GetSignPackage();
//        return $signPackages;
        $jsApi = new \JsApi_pub(C('RED_APPID'),C('RED_MCHID'),C('RED_KEY'),C('RED_APPSECRET'));


        $unifiedOrder = new \UnifiedOrder_pub(C('RED_APPID'),C('RED_MCHID'),C('RED_KEY'),C('RED_APPSECRET'));
        $unifiedOrder->setParameter("openid",$openid);//用户openid
        $unifiedOrder->setParameter("body",'魔派商城商品');//商品描述
        $orid = 'wx'.time();
        //自定义订单号，此处仅作举例
        $unifiedOrder->setParameter("out_trade_no",$orid);//商户订单号
        $total_fee = $price*100;
        $unifiedOrder->setParameter("total_fee",$total_fee);//总金额
        $notify_url = $notify_url ? $notify_url: C('RED_REURL');
        $unifiedOrder->setParameter("notify_url",$notify_url);//通知地址
        $unifiedOrder->setParameter("trade_type","JSAPI");//交易类型
        $unifiedOrder->setParameter("attach",$shopid);//附加数据
        $unifiedOrder->setParameter("product_id",2);//商品ID

        $prepay_id = $unifiedOrder->getPrepayId();
        //         echo "string:",$prepay_id;
        //=========步骤3：使用jsapi调起支付============
        $jsApi->setPrepayId($prepay_id);
        $jsApiParameters = $jsApi->getParameters();
        $jsApiParameters['signature'] = $signPackages['signature'];
        return $jsApiParameters;
    }
    public function mm() {
        echo 1;exit;
    }
}