/**
 * Script login with ajax
 */

$(function() {

	$("#frmLogin").submit(function(e) {

		e.preventDefault();

		$.ajax({
			url : "./login",
			type : "POST",
			data : $("#frmLogin").serialize(),
			//   	            beforeSend: function (xhr) {
			//   	                xhr.setRequestHeader("X-Ajax-call", "true");
			//   	            },
			success : function(data) {
				if (data == "User account is locked") {
					alert(data);
				} else if (data == "User is disabled") {
					alert(data);
				} else if (data == "Bad credentials") {
					alert(data);
				} else {
					location.href = "./" + data;
				}

			},
			error : function(data) {
				console.log(data);
			}
		});

	});

	/*
	$.ajax({ 
	    url: "http://localhost:9999/api/user?page=3&limit=5", 
	    type: 'GET', 
	    beforeSend: function(xhr) {
	        xhr.setRequestHeader("Accept", "application/json");
	        xhr.setRequestHeader("Content-Type", "application/json");
	//                     xhr.setRequestHeader("Authorization" , "Basic ZGV2OiFAI2FwaQ==");
	    },
	    success: function(data) { 
			console.log(data);
		  
			
	    },
	    error:function(data,status,er) { 
	        console.log("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	 */

});
