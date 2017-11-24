<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	#drop-zone{
		width:500px;
		height: 200px;
		border: 1px solid lime;
	}

</style>
<script type="text/javascript">
	window.addEventListener("load", function(event){
		var dropZone = document.querySelector("#drop-zone");
		
		dropZone.addEventListener("dragenter", function(e){
			e.stopPropagation();
			e.preventDefault();
			
			dropZone.style.background = "skyblue";
			console.log("enter");
		});
		
		dropZone.addEventListener("dragover", function(e){
			e.stopPropagation();
			e.preventDefault();
			
			console.log("over");
		});
		
		dropZone.addEventListener("dragleave", function(e){
			e.stopPropagation();
			e.preventDefault();
			
			dropZone.style.background = "white";
			console.log("leave");
		});
		
		dropZone.addEventListener("drop", function(e){
			e.stopPropagation();
			e.preventDefault();
			
			console.log("drop");
			
			
			/* for(var key in e.dataTransfer.types[0])
				console.log(key); */
			
			//console.log(typeof e.dataTransfer.types[0]);
			
			var isValidate = e.dataTransfer
							&& e.dataTransfer.types
							&& e.dataTransfer.types[0].indexOf("Files") >= 0;
			
			if(!isValidate){
				alert("incorrect file type.");
				return;
			}
			
			var files = e.dataTransfer.files;
			
			var count = files.length;
			if(count > 1){
				alert("you can transfer files one by one.");
				return;
			}
			
			var size = files.size;
			if(size > 300*1024*1024){
				alert("sorry~ you can't transfer over 300mb sized files. ");
				return;
			}
			
			// String
			//key=value&key=value&key=value
			
			var formData = new FormData();
			formData.append("file", files[0]);
			
			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress", function(evt){
				if(evt.lengthComputable){
					dropZone.textContent = "진척도: " + Math.round(evt.loaded*100/evt.total) + "%";
				}
			});
			
			xhr.addEventListener("load", function(evt){
				//서버에 있는 파일 목록을 다시 가져와서
				//현재 페이지에 목록에 포함시켜야 한다.
				
				
				
			});
			
			xhr.open("POST", "../../upload?${_csrf.parameterName}=${_csrf.token}");
			xhr.send(formData);
			
			//for(var key in files)
			
			
			
		});
		
		
	});

</script>
</head>
<body>

	<div id="drop-zone">
	
	</div>




</body>
</html>