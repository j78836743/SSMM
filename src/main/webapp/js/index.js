$(function(){
	
	$("a.opts").click(function(){
		
		var url= $(this).attr("url");
		if(url != undefined && url != null && url!= ''){			
			var option ={
					"content" : '<iframe src="'+ contextPath + url +'" frameborder="0" height="100%" width="100%" scrolling="auto"></iframe>',
					"title":$(this).html()
				};
				tabs(option);		
		}		
	});
	
	
})


function logout(){
	window.location.replace(contextPath + "/login/logout");	
}

function tabs(option){	
	var tabs=$("#content");	
	var exists = $(tabs).tabs("exists",option.title);
	if(exists){
		$(tabs).tabs("select",option.title);
		var tab = $(tabs).tabs("getTab",option.title);
		$(tabs).tabs("update",{
			tab:tab,
			options:{
				title:option.title,
				content:option.content,
				closable:true
			}
		})
		
		
	}else{
		$(tabs).tabs("add",{
			title:option.title,
			content:option.content,
			closable:true
		});
	}
	
}