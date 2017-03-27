<?php
namespace Admin\Controller;
use Admin\Controller\BaseController;
/**
 * 使用帮助控制器
 * @author 魔派<180256122@qq.com>
 */
class HelpController extends BaseController {
    /*
     * 公众号
     */
    public function mp(){
        $this->display();
    }

    /*
     * 支付
     */
    public function payment(){
        $this->display();
    }

    /*
     * 视频使用帮助
     */
    public function video(){
        $this->display();
    }

    /*
     * 网站使用帮助
     */
    public function website(){
        $this->display();
    }

    /*
     * app使用帮助
     */
    public function app(){
        $this->display();
    }

    /*
    公共弹框  代码管理
    */
   public function phpcode(){
        $search = I('search');
        $page = isset($_GET['p']) ? $_GET['p'] : 1;
        if($search){
            $where['sg_name'] = array('like',"%".$search."%");
            $where['sg_status_distinguish'] = 2;
        }else{
            $where['sg_status_distinguish'] = 2;
        }
        #展示对应公众号的商品信息
        $where1['token']=$_SESSION['token'];
        $arr=M("mp")->where($where1)->field('user_id,token')->select();
        $where['token']=$arr[0]['user_id'];
        $count = M('shop_goods')->where($where)->count();
        $pages = paginations($page,$count,8);
        $pages['lists'] = M('shop_goods')
                          ->where($where)
                          ->limit($pages['start'],8)
                          ->field('sg_id,sg_img_url,sg_name,sg_price,sg_sales,sgs_total_stock')
                          ->select();
        $this->assign('data',$pages);
        #展示对应公众号的粉丝用户信息
        global $_G;
        $where2['mpid']=$_G['user_info']['default_mpid'];
        $pages= isset($_GET['p1'])?$_GET['p1']:1;
        $counts = M('mp_fans')->where($where2)->count();
        $pages1 = paginations($pages,$counts,8);
        $pages1['lists'] = M('mp_fans')->where($where2)->limit($pages1['start'],8)->field("id,mpid,openid,nickname,sex,is_subscribe,headimgurl,subscribe_time,score")->select();
        $this->assign('arr',$pages1);
        $this->display();
   }
    /*
     * 公共弹框  分页展示
     */
   public function phpcodes(){
        $where1['token']=$_SESSION['token'];
        $arr=M("mp")->where($where1)->field('user_id,token')->select();
        $condition['token']=$arr[0]['user_id'];
        $search = I('sear') ? I('sear') : '';
        if($search){
            $condition['sg_name'] = array('like',"%".$search."%");
            $condition['sg_status_distinguish'] = 2;
        }else{
            $condition['sg_status_distinguish'] = 2;
        }
        $page = I('p') ? I('p') : 1;
        $count = M('shop_goods')->where($condition)->count();
        $pages = paginations($page,$count,8);
        $pages['lists'] = M('shop_goods')
                          ->where($condition)
                          ->limit($pages['start'],8)
                          ->field('sg_id,sg_img_url,sg_name,sg_price,sg_sales,sgs_total_stock')
                          ->select();
        $this->assign('data',$pages);
        $this->display();
   }
   /*
   公共弹框  粉丝信息
    */
   public function phpcodefan(){
        global $_G;
        $search = I('sears') ? I('sears') : '';
        if($search){
            $where2['nickname|sex'] = array('like',"%".$search."%");
            $where2['mpid']=$_G['user_info']['default_mpid'];
        }else{
            $where2['mpid']=$_G['user_info']['default_mpid'];
        }
        $pages= isset($_GET['p1'])?$_GET['p1']:1;
        $counts = M('mp_fans')->where($where2)->count();
        $pages1 = paginations($pages,$counts,8);
        $pages1['lists'] = M('mp_fans')->where($where2)->limit($pages1['start'],8)->field("id,mpid,openid,nickname,sex,is_subscribe,headimgurl,subscribe_time")->select();
        $this->assign("arr",$pages1);
        $this->display();
   }
   /*
    * 公共列表页面  使用方法
    * 1.设置按钮搬迁   show_set   js同时牵动
    * 2.点击设置     通过搬迁的js展开对应的数据
    * 3.展开数据进行勾选   点击确定   mask-sure   将对应的方法进行复制  这是会将你勾选的数据存储跳到另一个setting控制器中
    * setting中只是对勾选的数据转存   
    * mase-sure中会有一个跳转地址
    * 4.跳到跳转地址之后将数据接过来之后，对库里的数据进行修改   
    * 例如：global $_G;
            $wheres['mpid']=$_G['user_info']['default_mpid'];
            $savedata['settingname'] = I('get.fields') ? I('get.fields') : '';
            if($savedata['settingname']){
               M('mp_setting_name')->join("dc_mp on dc_mp_setting_name.mpid=dc_mp.id")->where($wheres)->save($savedata);
            }
    注意：$savedata['settingname']中settingname  你需要在mp_setting_name表中加入你所建立的字段  ：例如 建一个settingnames 字段     $savedata['settingnames']
    5.在你所展示的页面  将你的设置中的值显示出来 
    例如：$fieldsData = M("mp_setting_name")
                      ->join("dc_mp on dc_mp_setting_name.mpid=dc_mp.id")
                      ->where($wheres)
                      ->getField('settingname');
          $new_fields = explode(',', $fieldsData);
          $this->assign('new_fields',$new_fields);
          $this->assign('fieldsData',$fieldsData);
     6.将这些信息复制到你的js中
     $(function(){
            var fields = $("#fields").val();
            if(fields === ""){
                return;
            }else{
                var classArr = fields.split(",");
                classArr.unshift('ida','idb','idc','idd');
                $.each(classArr, function(i, c) {
                    $('td').each(function() {
                        if($(this).hasClass(c)) {
                            $(this).show();
                        }
                    })
                });
            }
        });
        findTd();
        function findTd() {
            var href = window.location.href.split("/");
            var hrefData = href[href.length - 1];
            if(hrefData == "couponcard" || hrefData === "") {
                return;
            } else {
                var classArr = hrefData.split(",");
                classArr.unshift('ida','idb','idc','idd');
                $('td').hide();
                $.each(classArr, function(i, c) {
                    $('td').each(function() {
                        if($(this).hasClass(c)) {
                            $(this).show();
                        }
                    })
                });
            }
        }
        7.对比lists.html 中的字段拼   
        例如：<td width="4%" class="ida">选中</td>
              <td width="4%" class="idb">序号</td>
              <td class="headimgurl"><img src="{$vo.headimgurl}" width="30px" height="30px"></td>
              <td class="nickname">{$vo.nickname}</td>
        8.完工
    */
    public function lists(){
        global $_G;
        $wheres['mpid']=$_G['user_info']['default_mpid'];
        $savedata['settingname'] = I('get.fields') ? I('get.fields') : '';
        //$savedata['mpid']=$_G['user_info']['default_mpid'];
        if($savedata['settingname']){
           M('mp_setting_name')->join("dc_mp on dc_mp_setting_name.mpid=dc_mp.id")->where($wheres)->save($savedata);
        }
        $search = I('search');
        $page = isset($_GET['p']) ? $_GET['p'] : 1;
        if($search){
            $where['nickname|sex'] = array('like',"%".$search."%");
            $where['mpid']=$_G['user_info']['default_mpid'];
        }else{
            $where['mpid']=$_G['user_info']['default_mpid'];
        }
        $count=M("mp_fans")->where($where)->count();
        $pages = paginations($page,$count,15);
        $arr=M("mp_fans")->where($where)->field("id,mpid,openid,nickname,sex,headimgurl,country,province,city,score,money")->limit($pages['start'],15)->select();
        $pages['lists']=$arr;
        #数据粉丝展示
        $this->assign('data',$pages);
        #字段设置展示对应
        $fieldsData = M("mp_setting_name")
                      ->join("dc_mp on dc_mp_setting_name.mpid=dc_mp.id")
                      ->where($wheres)
                      ->getField('settingname');
        $new_fields = explode(',', $fieldsData);
        $this->assign('new_fields',$new_fields);
        $this->assign('fieldsData',$fieldsData);
        $this->display();
    }
    /*
     * 设置信息入库
     */
    public function setting(){
        $field = I('post.field');
        $fields =  trim($field,',');
        echo $fields;die;
    }
    /*
    公共添加模块
     */
    public function add(){
      $this->display();
    }
    /*
    公共时间模块
     */
    public function times(){
      $this->display();
    }
}       