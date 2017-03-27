$(function () {
    
    $('#captcha').click();
    // bs???????-???????
    $('.aw-content-wrap .md-tip').tooltip('hide');
//    var flag
//        $('.mod-bar').on('click', '.list', function(){           
//            if(flag){
//                $(this).next('.ulList').hide();
//            }else{
//                $(this).next('.ulList').show();
//            }
//            flag = !flag
//        })
    
    // ????????????????
    //?????????????
    $('.date-input').each(function () {
        $(this).flatpickr({
            // minDate: new Date()
        });
    });
    
    $('.aw-header .mod-head-btn').click(function () {
        if ($('#aw-side').is(':visible')) {
            $('#aw-side').hide();
            
            $('.aw-content-wrap, .aw-footer').addClass('active');
        }
        else {
            $('#aw-side').show();
            
            $('.aw-content-wrap, .aw-footer').removeClass('active');
        }
    });
    
    // ?????????????
    $("#aw-side").perfectScrollbar({
        wheelSpeed: 20,
        wheelPropagation: true,
        minScrollbarLength: 20
    });
    
    // ??????????????????
    $('.mod-bar > li > a').click(function () {
        if ($(this).next().is(':visible')) {
            $(this).next().slideUp('');
            
            $(this).removeClass('active');
        }
        else {
            $('#aw-side').find('li').children('ul').slideUp('slow');
            
            $(this).addClass('active').parent().siblings().find('a').removeClass('active');
            
            $(this).next().slideDown('');
        }
        
        $("#aw-side").perfectScrollbar('update');
    });
    
    // ???????
    if (typeof (DateInput) != 'undefined') {
        $('input.mod-data').date_input();
    }
    
    // ????? input checked radio ?????
    $('.aw-content-wrap').find("input").iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%'
    });
    
    // input ????????????????
    $('.aw-nav-menu li .mod-set-head').click(function () {
        if ($(this).parents('li').find('.mod-set-body').is(':visible')) {
            $(this).parents('li').find('.mod-set-body').slideUp();
        }
        else {
            $(this).parents('li').find('.mod-set-body').slideDown();
            
            $(this).parents('li').siblings('li').find('.mod-set-body').slideUp();
        }
    });
    
    $(".aw-nav-menu").find('ul:first').dragsort({
        dragEnd: function () {
            var arr = [];
            $.each($('.aw-nav-menu ul li'), function (i, e) {
                arr.push($(this).attr('data-sort'));
            });
            $('#nav_sort').val(arr.join(','));
            
        }
    });
    
    
    // input ???????or ????
    $('.aw-content-wrap .table').find(".check-all").on('ifChecked', function (e) {
        e.preventDefault();
        //.parents('table')
        $(this).find(".icheckbox_square-blue").iCheck('check');
    });
    
    $('.aw-content-wrap .table').find(".check-all").on('ifUnchecked', function (e) {
        e.preventDefault();
        //.parents('table')
        $(this).find(".icheckbox_square-blue").iCheck('uncheck');
    });
    
    
    //??????????
    $('.aw-admin-weibo-answer .search-input').bind("keydown", function () {
        if (window.event && window.event.keyCode == 13) {
            return false;
        }
    });
    
    // ?????????????
    $(document).on('click', '.aw-admin-weibo-publish .delete', function () {
        $('.aw-admin-weibo-publish').find('.search-input').val('').show();
        
        $(this).parents('li').detach();
    });
    
    // ?????????????
    $(document).on('click', '.aw-admin-weibo-answer li .delete', function () {
        $(this).parent().detach();
        
        weiboPost($(this));
    });
    
    
    // ???????????????????????????
    $('#sorttable thead').delegate("td", "click", function () {
        if ($(this).index() == 0) {
            return false;
        }
        else {
            $(this).find('i').addClass('icon-down').show();
            
            $(this).siblings('td').find('i').removeClass('icon-down').hide();
            
            if ($(this).index() == 1) {
                subjectData('week');
            }
            else if ($(this).index() == 2) {
                subjectData('month');
            }
            else if ($(this).index() == 3) {
                subjectData('all');
            }
        }
    });
    
    $('#sorttable thead td:eq(2)').click();
    
});

function subjectData(type) {
    AWS.loading('show');
    
    var tempTop = $('#sorttable').offset().top + $('#sorttable').height() / 2 - 50;
    
    var tempLeft = $('#sorttable').offset().left + $('#sorttable').width() / 2;
    
    $('#aw-loading').css({top: tempTop + 'px', left: tempLeft + 'px', position: 'absolute'});
    
    $.get(G_BASE_URL + '/admin/ajax/topic_statistic/tag-' + type + '__limit-10', function (result) {
        var tempLyout = '';
        
        for (var i = result.length - 1; i >= 0; i--) {
            tempLyout += '<tr><td></td><td></td><td></td><td></td></tr>';
        }
        ;
        $('#sorttbody').html(tempLyout);
        
        AWS.loading('hide');
        
        if (result == '') {
            $('.sorttable-mask').show();
        }
        else {
            $('.sorttable-mask').hide();
            
            $.each(result, function (key, value) {
                var tempObj = $('#sorttable tbody tr:eq(' + key + ')');
                tempObj.find('td:eq(3)').text(value.all);
                tempObj.find('td:eq(2)').text(value.month);
                tempObj.find('td:eq(1)').text(value.week);
                tempObj.find('td:eq(0)').text(value.title);
            });
        }
    }, 'json');
}

function weiboPost(obj) {
    $.post(G_BASE_URL + '/admin/ajax/weibo_batch/', {
        'uid': obj.attr('data-id'), 'action': obj.attr('data-actions')
    }, function (result) {
        if (result.errno == -1) {
            AWS.alert(result.err);
            
            $('.mod-weibo-reply li:last').detach();
        }
        else if (result.errno == 1) {
            if (result.rsm != null) {
                if (result.rsm.staus == 'bound') {
                    $('.mod-weibo-reply li:last .btn-primary').text('???? Access Token');
                }
                else {
                    $('.mod-weibo-reply li:last .btn-primary').text('?????');
                }
            }
            
            $(".alert-box").modal('hide');
        }
    }, 'json');
}

//alert
function bootAlert(mes, thisType, thisTitle) {
    /*type:text, input, ok, warning, info, error??*/
    thisType = thisType || 'ok';
    thisTitle = thisTitle || '提示';
    x0p({
        title: thisTitle,
        text: mes,
        animationType: "slideDown",
        icon: thisType,
        buttons: [],
        autoClose: 1500
    })
}

//???
function getPage(id, url) {
    var page = $(id).val();
    var searchVal = $('.search').val();
    if (isNaN(Number(page))) {
        alert('请输入一个页码');
        return;
    }
    page = page === "" ? 1 : page;
    if (searchVal) {
        window.location.href = url + '/p/' + page + '/search/' + searchVal;
    } else {
        window.location.href = url + '/p/' + page + '/search/';
    }
    
}

//1.2 后页面刷新
function pageReload(time) {
    time = time || 1200;
    setTimeout(function () {
        window.location.reload();
    }, time);
}