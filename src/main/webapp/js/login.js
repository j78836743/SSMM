$(function(){
	$("#login-dialog").dialog({
		
		title:'登录',
		width:400,
		height:200,
		closed:false,
		closable:false,
		draggable:false,
		
		buttons:[
					{
						text:'注册',
						iconCls:'icon-add',
						handler:function(){
							$("#register-dialog").dialog({
							    title: '注册g',    
							    width: 600,    
							    height: 400,    
							    closed: false,    
							    cache: false,    
							    href: contextPath +'/emp/empaddAndUpdate',    
							    modal: true,
							    buttons:[
							    	{
							    		text:'注册',
							    		iconCls:'icon-add',
							    		handler:function(){
							    			
							    			$("#emp-form").form("submit",{
							    				
							    				url:contextPath + '/emp/add',
							    				
							    				onSubmit : function(p){
							    					p.etoak = 'et1807';
							    					
							    					return $("#emp-form").form('validate');
							    				},
							    				success : function(result){
							    					var data = $.parseJSON(result);
							    					if(data.code == '200') {
					    								//关闭窗口
					    								$("#register-dialog").dialog("close");
					    								//清除窗口信息
					    								$("#register-dialog").dialog("clear");
					    							}
					    							
					    							$.messager.show({
					    								title:'提示',
					    								msg:data.msg,
					    								timeout:5000,
					    								showType:'slide'
					    							});

							    				}
							    			});
							    		}
							    	}
							    ]

							});
						}
					},
					{
						text : '登录',
	    				iconCls : 'icon-ok',
	    				handler : function() {
	    					$("#login-form").form("submit",{
	    						url : contextPath + '/login/login',
	    						onSubmit : function() {
	    							return $("#login-form").form("validate");
	    						},
	    						success : function(result) {
	    							
	    							var data = $.parseJSON(result);
	    							if(data.code == 200) {
	    								//登录成功后跳转到 logincontroller 的 index
	    								window.location.href = '/login/index';
	    								//alert('成功');
	    								//window.location.href = '';
	    							}else {
	    								$.messager.show({
		    								title:'提示',
		    								msg:data.msg,
		    								timeout:5000,
		    								showType:'slide'
		    							});
	    							}
	    						}
	    					});
	    				}
					}
				]
	});

	$("#username").textbox({
		width:180,
		required:true,
		missingMessage:'请输入用户名',
		iconCls:'icon-man'
	});

	$("#password").textbox({
		width:180,
		required:true,
		missingMessage:'请输入密码',
		iconCls:'icon-lock'
	});
	
}


)