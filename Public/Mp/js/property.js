	$(function() {
		//点击添加属性展开input组
		$('.form-item-1 .add-spec-addSp').click(function() {
			$('.form-item-1 .add-spec-specifications').show();
		})
		$('.form-item-2 .add-spec-addSp').click(function() {
			$('.form-item-2 .add-spec-specifications').show();
		})

		//点击展开对应的菜单
		$('.add-spec-item').on('click', 'li .spec-items-small-value .val', function() {
			$('.spec-items-small-value .spec-items-small-choose').hide();
			$(this).next().show();
		})

		//鼠标移除关闭对应列表
		$('.spec-items-small-value').each(function(i, e) {
			$(e).mouseleave(function() {
				$(this).find('.spec-items-small-choose').hide();
			})
		})

		//点击取消关闭规格框
		$(".add-spec-specifications .add-spec-del").click(function() {
			$(this).siblings("input[type='text']").val("");
			$(this).parent().hide();
		})

		//点击减号关闭规格框
		$(".form-item-1 .operation-1 .icons-delete").click(function() {
			$('.form-item-1 .add-spec-specifications').hide().find("[type='text']").val("");
		});
		$(".form-item-2 .operation-1 .icons-delete").click(function() {
			$('.form-item-2 .add-spec-specifications').hide().find("[type='text']").val("");
		});

		//form-1 点击a标签来修改对应内容
		$('.form-item-1 .add-spec-item').on('click', 'li .spec-items-small-value .spec-items-small-choose a', function() {
			var html = $(this).html().split('<')[0];
			html = html + '<' + $(this).parents('.spec-items-small-value').find('.val').html().split("<")[1];
			$(this).parents('.spec-items-small-value').find('.val').html(html);
			$(this).parent().hide();
		})

		//form-1  最小的删除
		$('.form-item-1 .add-spec-item').on('click', 'li .spec-items-small-value .spec-items-small-choose a img', function() {
				var parentsId = $(this).parents('li').find('p').attr('data-id');
				var thisId = $(this).parent().attr('data-id');
				var isSure = window.confirm("确定删除？");
				if(isSure) {
					$.ajax({
						type: "post",
						url: "{:U('Mp/Shopping/ajax_del_mintype')}",
						data: {
							v_id: thisId
						},
						success: function(re) {
							if(re == 1) {
								window.location.reload();
							}
						}
					});

				} else {
					return false;
				}
				return false;
			})
			//form-2  最小的删除
		$('.form-item-2 .add-spec-item').on('click', 'li .spec-items-small-value .spec-items-small-choose a img', function() {
			var parentsId = $(this).parents('li').find('p').attr('data-id');
			var thisId = $(this).parent().attr('data-id');
			var isSure = window.confirm("确定删除？");
			if(isSure) {
				$.ajax({
					type: "post",
					url: "{:U('Mp/Shopping/ajax_del_minspec')}",
					data: {
						v_id: thisId
					},
					success: function(re) {
						if(re == 1) {
							window.location.reload();
						}
					}
				});

			} else {
				return false;
			}
			return false;
		})

		var KeyArr1 = [];
		var KeyArr2 = [];

		$('.form-item-1 .add-spec-item li p').each(function(i, e) {
			KeyArr1.push($(e).html());
		})
		$('.form-item-2 .add-spec-item li p').each(function(i, e) {
				KeyArr2.push($(e).html());
			})
			//点击添加form-1的属性
		$(".form-item-1 .add-spec-specifications .add-spec-sure").click(function() {
			var inputs = $(this).siblings('input[type="text"]');
			var itemKey = $(inputs[0]).val();
			var itemValue = $(inputs[1]).val();
			var c_id_arr = window.location.search.split('/');
			var cId = c_id_arr[c_id_arr.indexOf('name') + 1];

			//如果key没有添加过，并且key和value不为空
			if(KeyArr1.indexOf(itemKey) === -1 && itemKey !== "" && itemValue !== "") {
				$.ajax({
					type: 'POST',
					url: '{:U("Mp/Shopping/add_ajax_property")}',
					data: {
						c_id: cId,
						g_name: itemKey,
						v_val: itemValue
					},
					success: function(re) {
						if(re == 1) {
							window.location.reload();
						} else {
							alert('添加失败');
						}
					}
				})
			} else if(KeyArr1.indexOf(itemKey) !== -1) {
				alert('不可以重复添加相同属性');
			} else if(itemKey == "" && itemValue == "") {
				alert("数值不能为空");
			} else {

			}
			inputs.val("");
			$(this).parent().hide();
		})

		//添加form2-规格
		$(".form-item-2 .add-spec-specifications .add-spec-sure").click(function() {
			var inputs = $(this).siblings('input[type="text"]');
			var itemKey = $(inputs[0]).val();
			var itemValue = $(inputs[1]).val();
			var c_id_arr = window.location.search.split('/');
			var cId = c_id_arr[c_id_arr.indexOf('name') + 1];
			//如果key没有添加过，并且key和value不为空
			if(KeyArr2.indexOf(itemKey) === -1 && itemKey !== "" && itemValue !== "" && KeyArr2.length < 4) {
				$.ajax({
					type: 'POST',
					url: '{:U("Mp/Shopping/add_ajax_spec")}',
					data: {
						c_id: cId,
						g_name: itemKey,
						v_val: itemValue
					},
					success: function(re) {
						if(re == 1) {
							window.location.reload();
						} else {
							alert('添加失败');
						}
					}
				})
			} else if(KeyArr2.indexOf(itemKey) !== -1) {
				alert('不可以重复添加相同属性');
			} else if(itemKey == "" && itemValue == "") {
				alert("数值不能为空");
			} else if(KeyArr2.length >= 4) {
				alert("规格不能超过4个");
			} else {

			}
			inputs.val("");
			$(this).parent().hide();
		})

		//渲染Li
		function randerLis(key, value) {
			return '<li class="col-sm-6 col-xs-6"><p class="float-l" data-id="' + key + '">' + key + '</p><select name="' + value + '" class="float-l"><option value="' + value + '">' + value + '</option></select><div class="change float-l"><i class="icons icons-plus">+</i><i class="icons icons-delete">X</i></div></li>'
		}

		//点击+添加
		$('.form-item-1 .add-spec-item').on('click', 'li i.icons-plus', function() {
			var __this = $(this);
			var offsetObj = $(this).offset();
			$('#add-change-mask').show();
			$('.add-change-popups').find('input').val("");
			form1SetSpec(__this);
		})
		$('.form-item-2 .add-spec-item').on('click', 'li i.icons-plus', function() {
			var __this = $(this);
			var offsetObj = $(this).offset();
			$('#add-change-mask').show();
			$('.add-change-popups').find('input').val("");
			form2SetSpec(__this);
		})

		//点击X删除
		$('.form-item-1 .add-spec-item').on('click', 'li i.icons-delete', function() {
			var __this = $(this);
			var fatherId = __this.parents("li").find('p').attr('data-id');
			var isSure = window.confirm('确认删除？');
			if(isSure) {
				$.ajax({
					type: "POST",
					url: '{:U("Mp/Shopping/ajaxDel_type")}',
					data: {
						g_id: fatherId
					},
					success: function(re) {
						if(re == 1) {
							window.location.reload();
						}
					}
				})
			} else {
				return;
			}

		})

		//form2点击X删除
		$('.form-item-2 .add-spec-item').on('click', 'li i.icons-delete', function() {
			var __this = $(this);
			var fatherId = __this.parents("li").find('p').attr('data-id');
			var isSure = window.confirm('确认删除？');
			if(isSure) {
				$.ajax({
					type: "POST",
					url: '{:U("Mp/Shopping/ajaxDel_spec")}',
					data: {
						g_id: fatherId
					},
					success: function(re) {
						// alert(re);
						if(re == 1) {
							window.location.reload();
						}
					}
				})
			} else {
				return;
			}
		})

		//form-1点击edit修改

		function form1SetSpec(that) {
			var value = $('#add-change-mask .add-popups-input');
			var sub = $('#add-change-mask .add-spec-sure');
			var del = $('#add-change-mask .add-spec-del');
			var fatherId = that.parents("li").find('p').attr('data-id');
			var oldOpt = []
			that.parents('li').find('option').each(function(i, e) {
				oldOpt.push($(e).html().split('<')[0]);
			});
			//删除
			del.click(function() {
					$(this).parents("#add-change-mask").hide();
					value.val("");
				})
				//添加
			sub.unbind('click').click(function() {
				var inpVal = value.val();
				//不为空且不重复
				if(inpVal != "" && oldOpt.indexOf(inpVal) === -1) {
					$.ajax({
						type: 'POST',
						url: '{:U("Mp/Shopping/ajax_Add_type")}',
						data: {
							g_id: fatherId,
							v_val: inpVal
						},
						success: function(re) {
							if(re == 1) {
								var op = '<option value="' + inpVal + '">' + inpVal + '</option>';
								that.parents('li').find('select').append(op);
								window.location.reload();
							}
						}
					})
				} else {
					alert('属性值不能为空，且不能重复');
					return;
				}
				$(this).parents("#add-change-mask").hide();
				value.val("");
			})
		}

		function form2SetSpec(that) {
			var value = $('#add-change-mask .add-popups-input');
			var sub = $('#add-change-mask .add-spec-sure');
			var del = $('#add-change-mask .add-spec-del');

			var fatherId = that.parents("li").find('p').attr('data-id');
			var oldOpt = []
			that.parents('li').find('option').each(function(i, e) {
				oldOpt.push($(e).html().split('<')[0]);
			});
			//删除
			del.click(function() {
					$(this).parents("#add-change-mask").hide();
					value.val("");
				})
				//添加
			sub.unbind('click').click(function() {
				var inpVal = value.val();
				//不为空且不重复
				if(inpVal != "" && oldOpt.indexOf(inpVal) === -1) {
					$.ajax({
						type: 'POST',
						url: '{:U("Mp/Shopping/ajax_Add_spec")}',
						data: {
							g_id: fatherId,
							v_val: inpVal
						},
						success: function(re) {
							if(re == 1) {
								var op = '<option value="' + inpVal + '">' + inpVal + '</option>';
								that.parents('li').find('select').append(op);
								window.location.reload();
							}
						}
					})
				} else {
					alert('属性值不能为空，且不能重复');
					return;
				}
				$(this).parents("#add-change-mask").hide();
				value.val("");
			})
		}

		//最小的删除
		function smallDel(that) {
			var pId = that.parnets('li').find('p').attr('data-id');
			var selName = that.parnets('li').find('select').attr('name');
			var thisId = that.parent().val();
			var isSure = window.confirm('确认删除？');
			if(isSure) {
				$.ajax({
					type: 'POST',
					url: '',
					data: {
						fatherId: pId,
						thisId: thisId
					},
					success: function(re) {
						if(re == 1) {
							window.location.reload();
						}
					}
				})
			} else {
				return false;
			}
		}

		//form1 点击edit修改
		$('.form-item-1 .add-spec-item').on('click', '.icons-edit', function() {
				var picEdit = '__PUBLIC__/Mp/img/edit.png';
				var picSure = '__PUBLIC__/Mp/img/makeSure.png';
				if($(this).attr('data-type') === "true") {
					$(this).parents('li').find('.father-left p').hide();
					$(this).parents('li').find('.father-left input').show();
					$(this).find('img').attr('src', picSure)
					$(this).attr('data-type', 'false');
				} else {
					var fatherId = $(this).parents('li ').find('.father-left input').attr('name');
					var content = $(this).parents('li').find('.father-left input').val();
					if(KeyArr1.indexOf(content) === -1 && content !== "") {
						//证明没有重复的且不为空
					} else {
						alert('规格名不能重复且不能为空')
					}
					$.ajax({
						url: "{:U('Mp/Shopping/save_spec_max')}",
						type: 'POST',
						data: {
							id: fatherId,
							val: content
						},
						success: function(re) {
							if(re == 1) {
								window.location.reload();
							} else {
								alert('修改失败');
							}
						}
					})
				}

			})
			//form2 点击edit修改
		$('.form-item-2 .add-spec-item').on('click', '.icons-edit', function() {
			var picEdit = '__PUBLIC__/Mp/img/edit.png';
			var picSure = '__PUBLIC__/Mp/img/makeSure.png';
			if($(this).attr('data-type') === "true") {
				$(this).parents('li').find('.father-left p').hide();
				$(this).parents('li').find('.father-left input').show();
				$(this).find('img').attr('src', picSure)
				$(this).attr('data-type', 'false');
			} else {
				var fatherId = $(this).parents('li ').find('.father-left input').attr('name');
				var content = $(this).parents('li').find('.father-left input').val();
				if(KeyArr1.indexOf(content) === -1 && content !== "") {
					//证明没有重复的且不为空
				} else {
					alert('规格名不能重复且不能为空')
				}
				$.ajax({
					url: "{:U('Mp/Shopping/save_guige_max')}",
					type: 'POST',
					data: {
						id: fatherId,
						val: content
					},
					success: function(re) {
						if(re == 1) {
							window.location.reload();
						} else {
							alert('修改失败');
						}
					}
				})
			}

		})
	})