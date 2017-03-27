/**
 * Created by Administrator on 2016/10/17.
 */
/*正则判断一群东西*/
function isTrue() {
    this.userAg = navigator.userAgent;
}
isTrue.prototype = {
    constructor: isTrue,
    isIOS: function () {
        return !!this.userAg.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/);
    },
    isAndroid: function () {
        return (this.userAg.indexOf('Android') > -1 || this.userAg.indexOf('Adr') > -1);
    },
    isName: function (str) {
        return /^\S+$/.test(str);
    },
    isPhoneNum: function (str) {
        return /0?(13|14|15|18)[0-9]{9}/.test(str);
    },
    isEmail: function (str) {
        return /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/.test(str);
    },
    isQq: function (str) {
        return /[1-9]([0-9]{5,11})/.test(str);
    },
    isPassWord: function (str) {
        return /^[A-Za-z0-9_-]+$/.test(str);
    },
    isPostCode:function(str){
        return /^[1-9][0-9]{5}$/.test(str);
    }
};