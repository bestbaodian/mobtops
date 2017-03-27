/**
	myAlert:简单的弹框函数
	author:niuxiaokui
	要先引入jQquery
	myAlert(bool,content,time)
	bool:true/false
	content:自定义内容
	time:显示时间(毫秒)
**/
var myAlertHidden=null;
function myAlert(bool,content,time){
	var times = time || 1000;
	if($("body .nk_myAlert").length){
		clearTimeout(myAlertHidden);
		$("body .nk_myAlert").remove();
	};
	if(bool){
		text = content || "操作成功！";
	}
	else{
		text = content || "操作失败！";
	}

	var Alert = "<div class='nk_myAlert' style='z-index: 10000;position: absolute;top: 0;bottom: 0;left: 0;right: 0;width: 200px;height: 100px;line-height: 100px;text-align: center;margin: auto;border-radius: 20px;background-color: rgba(0,0,0,0.7);color: white;'>" + text + "</div>";
	$("body").append(Alert);
	myAlertHidden=setTimeout(function(){
		$("body .nk_myAlert").remove();
	},times);
}