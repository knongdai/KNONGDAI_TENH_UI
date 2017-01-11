<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   <style>
   	
	#scrolltop{
		width:50px;
		height:50px;
		position:fixed;
		right:10px;
		bottom:10px;
		display:none;
	}
	#scrolltop img{
		width:100%;
		height:100%;	
	}
   
   </style>
   <script>
	$(document).ready(function(){
    	$(window).scroll(function(){
        	if($(this).scrollTop()>=350){
        	
				$("#scrolltop").fadeIn(100);	
			}
			else{
				$("#scrolltop").fadeOut(300);
			}
			
    	});	
    	
	});
	function goTop(){

		 $('html, body').animate({ scrollTop: 0 }, 'fast');
		
	}
</script>
   
<div id="scrolltop" style="z-index:99999999999">
	<img src="${pageContext.request.contextPath}/resources/static/images/home/up.png" onClick="goTop()"/>
</div>
   
  