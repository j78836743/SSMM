<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/easyui/include.jsp" %>
<script type="text/javascript">
		function change(){
							var value = $('#p').progressbar('getValue'); 
						if (value < 100){ 
						value += Math.floor(Math.random() * 10); 
						$('#p').progressbar('setValue', value); 
						$('#mm').menu('show', {    
						  left: 200,    
						  top: 100    
						});  
						} 						
						}


		$(function(){
		
		
		
		$('#dd').tooltip({    
		position: 'right',    
		content: '<span style="color:#fff">This is the tooltip message.</span>',   
		onShow: function(){        
		$(this).tooltip('tip').css({            
		backgroundColor: '#666',            
		borderColor: '#666'        
		});    }});
		
		$('#p').progressbar({ 
		value: 50,
		onChange: function(value){
		
		
		alert(value)
	}
		
		}); 
				
		
		$('#ss').searchbox({ 
		searcher:function(value,name){ 
		alert(value + "," + name) 
		}, 
		menu:'#mm', 
		prompt:'请输入值',
		width:300
		}); 
	
		$('#pp').pagination({ 
		total:20, 
		pageSize:9 ,
		pageNumber:20,
		pageList: [5,10],
		
		showPageList:true,
		showRefresh:false,
		beforePageText:true,
		
		
		
	}); 
		
	
		$.extend($.fn.validatebox.defaults.rules, {    
    etoak: {    
        validator: function(value,param){   
			var reg = /^13[0-9]{9}$/
            return reg.test(value);    
        },    
        message: 'Field do not match.'   
    }    
}); 
		
		$("#et").textbox({
		required:true,
		missingMessage:'不为空',
	//	validType:'email',
	//	invalidMessage:'邮箱',
		validType:'etoak',
		width:300,height:50,prompt:'请输入',
						value:'123',type:'text',multiline:true,
						iconCls:'icon-ok',iconAlign:'left',buttonText:'按钮',buttonIcon:'icon-add',
						onChange:function(newValue,oldValue){
							console.log(newValue + oldValue)
						},
						onClickButton:function(){
							var v = $(this).textbox('getValue');
							alert(v);
							
						}		
		});
			var options = $("#et").textbox("options");
			console.log(options+"-------------------");
	});

</script>

<title>textbox</title>
</head>
<body>

	<input class="easyui-textbox" 
			data-options="width:300,height:50,prompt:'请输入',
						value:'123',type:'text',multiline:true,
						iconCls:'icon-ok',iconAlign:'left',buttonText:'按钮',buttonIcon:'icon-add',
						onChange:function(newValue,oldValue){
							console.log(newValue + oldValue)
						},
						onClickButton:function(){
							var value = $('#p').progressbar('getValue'); 
						if (value < 100){ 
						value += Math.floor(Math.random() * 10); 
						$('#p').progressbar('setValue', value); 
						} 						
						}
						"/>
<br />
<input type="text" id="et" />
<br />
<div id="pp" style="background:#efefef;border:1px solid #ccc;"></div>  
<br />
<div>
<input id="ss"></input> 
<div id="mm" style="width:120px"> 
<div data-options="name:'item1'">Search Item1</div>
	<div data-options="name:'item2'">Search Item2</div>
	<div data-options="name:'item3',selected:true">Search Item3</div>

</div> 
</div>
<div id="p" style="width:400px;"></div> 
<div> <button value="click" onclick="change()">123</button> </div>
</body>
<a id="dd" href="javascript:void(0)">Click here</a>
<br />
<p>--------------------</p>
<div id="mm1" class="easyui-menu" style="width:120px;">   
    <div>New</div>   
    <div>   
        <span>Open</span>   
        <div style="width:150px;">   
            <div><b>Word</b></div>   
            <div>Excel</div>   
            <div>PowerPoint</div>   
        </div>   
    </div>   
    <div data-options="iconCls:'icon-save'">Save</div>   
    <div class="menu-sep"></div>   
    <div>Exit</div>   
</div> 
<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">easyui</a>  
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"   
        onclick="javascript:alert('easyui')">easyui</a>  
<a href="javascript:void(0)" id="mb" class="easyui-menubutton"     
        data-options="menu:'#edit',iconCls:'icon-edit'">Edit</a>   
 <div id="edit" style="width:150px;">   
    <div data-options="iconCls:'icon-undo'">Undo</div>   
    <div data-options="iconCls:'icon-redo'">Redo</div>   
    <div class="menu-sep"></div>   
    <div>Cut</div>   
    <div>Copy</div>   
    <div>Paste</div>   
    <div class="menu-sep"></div>   
    <div data-options="iconCls:'icon-remove'">Delete</div>   
    <div>Select All</div>   
</div> 
<a href="javascript:void(0)" id="sb" class="easyui-splitbutton"   
        data-options="menu:'#SplitButton',iconCls:'icon-ok'" onclick="javascript:alert('ok')">Ok</a>   
<div id="SplitButton" style="width:100px;">   
    <div data-options="iconCls:'icon-ok'">Ok</div>   
    <div data-options="iconCls:'icon-cancel'">Cancel</div>   
</div>  
		<br />
<div>
<a href="javascript:void(0)" id="SwitchButtonv" onclick="javascript:alert('ok')">Ok</a>   


<script type="text/javascript"> 
  $(function(){ 
    $('#SwitchButtonv').switchbutton({ 
      checked: true, 
      onChange: function(checked){ 
        console.log(checked); 
      } 
    }) 
  }) 
</script>

</div>
</html>