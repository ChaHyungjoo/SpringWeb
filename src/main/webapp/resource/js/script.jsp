<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	/* var x={};
	x.name = "hj";
	x.phone = "010-111-111" 
	
	x["name"] = "hj";
	x["phone"] = "010-111-111"; */
	
	/* var json = [
					{id:"1", title:"hello", "writer id":"newlec"},
					{id:"2", title:"good", "writer id":"hj"}
				];
	
	alert(json[0].title);
	alert(json[1]["writer id"]); */
	
	//var data = eval("[2,4,6]");
	//var data = JSON.parse("[2,4,6]");
	//var data = eval('({id:"1", title:"hello", "writer id":"newlec"})');
	//var data = JSON.parse('{"id":2, "title":"good", "writer id":"hj"}');
	
	//alert(data.id);
	//alert(typeof data.id);
	
	//var x = 3;
	//var y = new Number(3);
	
	//alert(x===y);	//주소를 비교
	//alert(x==y);	//값을 비교
	
	/* var data = [2, 4, 6, 8, 0];
	var entity = {"id": 1, "title": "hello", "writerId": "hj"}
	
	for(var i=0; i<data.length; i++)
		alert(data[i]);
		
	for(var k in entity)
		alert(entity[k]); */
	
	/* var add = new Function("x, y", "return x+y;");
		
	alert(add(3,8)); */
	
	/* var add = function(){
		var sum = 0;
		for(var i=0; i<arguments.length; i++)
			sum += arguments[i];
		
		return sum;
	};
	
	alert(add(3,8,10)); */
	
	//a = 1;     글로벌변수(전역변수 개념)(window.a = 1 과 같음, 자바의 this)
	//var a = 1;  지역변수
	//클로저 - 리소스를 닫아주는 함수
	
	
	/* function f1(){
		a = 1;
	}
	
	function f2(){
		alert(a);
	}
	
	f1();
	f2(); */
	
	/* function f1(){
		var a = 1;
		
		return function f2(){
			return a;
		}
	}
	
	var f = f1();
	var a = f();
	alert(a); */
	
	/* var x, y;
	x = prompt("x 값을 입력하세요", 0);
	y = prompt("y 값을 입력하세요", 0);
	
	x = parseInt(x);
	y = parseInt(y);
	
	alert(x+y); */
	
/* 	function printResult(){
		var x, y;
		x = prompt("x 값을 입력하세요", 0);
		y = prompt("y 값을 입력하세요", 0);
		
		x = parseInt(x);
		y = parseInt(y);
		
		alert(x+y);
		
	} */
	

	
	/* function calcApp(){
		var btnPrint = document.getElementById("btn-print");
		btnPrint.onclick = printResult;
		
		function printResult(){
			var x, y;
			x = prompt("x 값을 입력하세요", 0);
			y = prompt("y 값을 입력하세요", 0);
			
			x = parseInt(x);
			y = parseInt(y);
			
			btnPrint.value = x+y;
			//btnPrint.type = "text";
		}
	}

	window.onload = calcApp; */
	
	function calcApp(){
		
		var x = document.getElementById("x");
		var y = document.getElementById("y");
		var addClick = document.getElementById("add-button");
		var resultText = document.getElementById("result");
		
		addClick.onclick = addBtnClick;
		
		function addBtnClick(){
			
			x = parseInt(x.value);
			y = parseInt(y.value);
			
			resultText.value = x+y;
			//btnPrint.type = "text";
		}
	}
	
	window.onload = calcApp;
	//-------------------------------------------------------------------------------------
	
	window.onload = function(){
		var countLabel = document.getElementById("count-label");
		var countButton = document.getElementById("count-button");
		var timerId = null;
		
		var ex1 = document.getElementById("ex1");
		ex1.style.marginTop = "0px";
		
		countButton.onclick = countButtonClick;
		
		function countButtonClick(){
			
			if(timerId ==null)
				timerId = setInterval(function(){
					var count = parseInt(countLabel.textContent);
					var marginTop = parseInt(ex1.style.marginTop);
					
					//목표치에 도달했을 경우
					if(count <= 0){
						clearInterval(timerId);
						timerId = null;
					}
					
					if(marginTop >= 100){
						clearInterval(timerId);
						timerId = null;
					}
					
					//countLabel.textContent = count - 1;
					ex1.style.marginTop = (marginTop+1)+"px";
					
				}, 30);
		}
		
		
		
	};
	
	<!-- open a window 예제 ------------------------------------------------>
	
	window.onload = function(){

		var openButton = document.getElementById("open-button");
		var movButton = document.getElementById("mov-button");
		var transButton = document.getElementById("trans-button");
		var iframe = window.frames[0];
		
		var win = null;
		
		
		openButton.onclick = function(){
			if(win==null)
				win = open("notice.html", "_blank", "width=500px height=300px");
		};
		
		movButton.onclick = function(){
			if(win != null)
				win.moveBy(-10, 0);
		};
		
		transButton.onclick = function(){
			//iframe.location.href="http://www.daum.net";
			iframe.document.write("hello");
		};
		
	};
	
	<!-- iframe 예제 ------------------------------------------------>
	/* 
	window.onload = function(){

		var navButton = document.getElementById("nav-button");
		var win = window.frames[0];
		
		navButton.onclick = function(){
			win.location.href="http://www.newlecture.com";
		};
		
	}; */
	
	<!-- 노드 순회 예제 ------------------------------------------------>
	
	window.onload = function(){
		
		var chButton = document.getElementById("ch-button");
		var p = document.getElementById("p");
		
		chButton.onclick = function(){
			//p.firstElementChild.style.border = "blue solid 1px";
			for(var node = p.firstChild; node != null ; node = node.nextSibling)
				alert(node.nodeType);
			
		};
	};
	
	<!-- Selector 예제 ------------------------------------------------>
	
	window.onload = function(){
		
		var chButton = document.querySelector("#ch-button1");
		//var p = document.querySelector("#module1 > div:first-child + div > div");
		var divs = document.querySelectorAll("#module1 > div");
		var p = divs[1].querySelector("div");
				
		chButton.onclick = function(){
			p.style.border = "red solid 1px";
			
		};
	};
	
	<!-- 속성 변경 예제 ------------------------------------------------>
	
	window.onload = function(){
		
		var url = document.querySelector("#url");
		var chImgButton = document.querySelector("#ch-img-button");
		var container = document.querySelector("#img-container");
		var img = container.querySelector("img");
				
		chImgButton.onclick = function(){
			
			//img.src = "https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png";
			img.src = url.value;
			
		};
	};
	
	
	<!-- 속성 변경 예제 ------------------------------------------------>
	
	window.onload = function(){
		
		var chNodeButton = document.querySelector("#ch-node-button");
		var container = document.querySelector("#ch-node-container");
				
		chNodeButton.onclick = function(){
			//container.textContent = "<h1>hahahaha</h1>";
			container.innerHTML = "<h1>hahahaha</h1>";
			
		};
	};
	
	<!-- 텍스트 노드 추가 예제 ------------------------------------------------>
	
	window.onload = function(){
		
		var addTextNodeButton = document.querySelector("#add-text-node-button");
		var addImgNodeButton = document.querySelector("#add-img-node-button");
		var removeNodeButton = document.querySelector("#remove-node-button");
		var container = document.querySelector("#node-container");
		
		var remove = function(e){
			//alert(e.target);
			container.removeChild(e.target);
		};
		
		var index = 0;
		
		addTextNodeButton.onclick = function(){
			var span = document.createElement("span");
			
			//1. TextNode 생성
			var txt = document.createTextNode("안녕안녕" + index++);
			
			//2. container(부모)를 얻기
			
			//3. 부모에 자식을 추가
			span.appendChild(txt);
			container.append(span);
			
			span.onclick = remove;
		};
		
		addImgNodeButton.onclick = function(){
			// way 1
			/* var img = document.createElement("img");
			img.src = "https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png";
			img.style.width = "200px";
			container.appendChild(img); */
			
			// way 2
			container.innerHTML += '<img onclick = "remove()" src="https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png" style="width:200px">';
			
		};
		
		removeNodeButton.onclick = function(e){
			//1. 내정된 노드를 지우기 - 예: 막내 지우기
			//container.parent	//container.parentElement
			//container.removeChild(container.lastChild);
			
			//2. 선택된 노드를 지우기
			
		};
		
	};
	
	<!-- 노드 바꾸기 예제 ------------------------------------------------>
	
	window.addEventListener("load", function(){
		var swapNodeButton = document.querySelector("#swap-node-button");
		var container = document.querySelector("#node-swap-container");
		
		
		swapNodeButton.onclick = function(){
			//var node1 = container.querySelector("img:first-child");
			var nodes = container.getElementsByTagName("img");
			
			var node1 = nodes[0];
			var node3 = nodes[2];
			var nodeNext = node1.nextElementSibling;
			
			var oldNode = container.replaceChild(node1/* new */, node3/* old */);
			//var aaa = container.insertBefore(node3, node1);
			var aaa = container.insertBefore(node3, nodeNext);
			
		};
		
	});
	
	<!-- 노드 바꾸기 예제 2------------------------------------------------>
	
	window.addEventListener("load", function(){
		var moveUpButton = document.querySelector("#move-up-button");
		var container = document.querySelector("#move-up-container");
		
		var checkedId = 0;
		
		var tr = null;
		
		var tbody = container.querySelector("tbody");
		//var td = tbody.querySelector("tr:first-child td:last-child");
		var td = tbody.firstElementChild.lastElementChild;
		
		/* td.onclick = function(e){
			e.stopPropagation();	//bubbling을 멈춤? 이벤트 상위전파 중단
			
			console.log("td");
			e.target.style.background = "green";
		}; */
		
		td.addEventListener("click", function(e){
			e.stopPropagation();	//bubbling을 멈춤? 이벤트 상위전파 중단
			
			console.log("td");
			e.target.style.background = "green";
		}, true);	//true는 capturing, false는 bubbling을 하는 것(false가 기본값)
		
		
		tbody.addEventListener("click", function(e){
			
			if(e.target.nodeName == "INPUT"){
				//alert("라디오 버튼 클릭");
				tr = e.target.parentNode.parentNode;
				
				
				//var oldNode = container.replaceChild(tr1/* new */, tr2/* old */);
				//container.insertBefore(tr2, container.firstElementChild);
				
			}
			
			//alert("target: " + e.target.nodeName + ", current: " + e.currentTarget.nodeName);
			//target: 이벤트가 발생한 곳	currentTarget: 이벤트를 처리해주는 곳			
			//e.target.parentNode.style.background = "pink";
			//e.target.style.background = "pink";
			//console.log("tbody");
			
		}, true);
		
		
		/* var trs = container.querySelectorAll("tbody tr");
		
		for(var i=0; i<trs.length; i++)
			trs[i].onclick = function(e){
				e.target.style.background = "pink";
			}; */
			
		moveUpButton.onclick = function(){
			if(tr ==null)
				return;
			
			var bf = tr.previousElementSibling;
			var af = tr.nextElementSibling;
			
			var container = tr.parentNode;
			
			container.replaceChild(tr, bf);
			container.insertBefore(bf, af);
		};
		
	});
	
	
	<!-- 기본 행위 막기 예제 ------------------------------------------------>
	
	window.addEventListener("load", function(){
		
		var titleText = document.querySelector("form input[name]");
		var submitButton = document.querySelector("form input[type='submit']");
		var cancelButton = document.querySelector("form a");
		
		submitButton.onclick = function(e){
			if(titleText.value == ""){
				alert("제목을 입력하세요.");
				e.preventDefault();
			}
			
		};
		
		cancelButton.onclick = function(e){
			if(titleText.value != ""){
				if(!confirm("작성중이던 입력을 취소하시겠습니까?"))
					e.preventDefault();
				
			}
			
		};
		
		
	});
	
	<!-- 노드 복제 예제 ------------------------------------------------>
	
	window.addEventListener("load", function(){
		
		var cloneButton = document.querySelector("#ex-clone input[value='단순 복제']");
		var tbody = document.querySelector("#ex-clone tbody");
		
		cloneButton.onclick = function(e){
			var tr = tbody.querySelector("tr");
			var clone = tr.cloneNode(true);
			
			tbody.appendChild(clone);
		};
		
	});
	
	<!-- Template 태그를 이용한 노드 복제 예제 ------------------------------------------------>
	
	window.addEventListener("load", function(){
		
		var cloneButton = document.querySelector("#ex2-clone input[value='단순 복제']");
		var ajaxButton = document.querySelector("#ex2-clone input[value='Ajax요청']");
		var tbody = document.querySelector("#ex2-clone tbody");
		var template = document.querySelector("#ex2-clone template");
		var container = document.querySelector("#ex2-clone div:first-child");
		
		var data = [
			{id:"1", title:"aaaa", content:"123"},
			{id:"2", title:"bbbb", content:"456"},
			{id:"3", title:"cccc", content:"789"}
		];
		
		ajaxButton.onclick = function(e){
			/* //1. 동기형으로 요청한 방식
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "../../customer/notice-ajax", false);	//open: 요청하기위한 문서의 설정
			xhr.send();		//send: 요청
			data = eval(xhr.responseText); */
			
			//2. 비동기형으로 요청한 방식
			var xhr = new XMLHttpRequest();
			
			//xhr의 상태에 따라 실행할 이벤트를 위임(설정)해놓음
			/* xhr.onreadystatechange = function(e){
				if(xhr.readyState == 4)
					data = eval(xhr.responseText);
				
			}; */
			xhr.onload = function(){
				data = JSON.parse(xhr.responseText);
				
				//2. ajax icon 제거
				container.removeChild(container.lastChild);
				
			}
			xhr.onerror = function(e){
				alert("예기치 못한 오류");
			};
			xhr.open("GET", "../../customer/notice-ajax", true);	
			xhr.send();		//요청
			
			//1. ajax icon 추가
			var img = document.createElement("img");
			img.src = "ajax-loader.gif";
			container.appendChild(img);
			
		};
		
		cloneButton.onclick = function(e){
			//현재 브라우저가 template 태그를 지원하는지에 대한 확인
			if('content' in template){
				//alert("template!!");
				
				/* //1. template의 content에 값을 설정하고 노드를 복제 하는 경우
				//template의 content에 값을 설정
				var tds = template.content.querySelectorAll("td");
				
				tds[0].appendChild(document.createTextNode("1"))
				//tds[0].textContent = "1";	
				tds[1].textContent = "test title";
				tds[2].textContent = "newlec";
				
				//값이 설정된 content를 복제
				var clone = document.importNode(template.content, true); */
				
				//2. 복제를 한 후에 content를 설정하는 경우
				
				for(var i=0; i<data.length; i++){
					var clone = document.importNode(template.content, true);
					
					var tds = clone.querySelectorAll("td");
					
					tds[0].appendChild(document.createTextNode(data[i].id));
					tds[1].textContent = data[i].title;
					tds[2].textContent = data[i].content;
					//tds[1].textContent = "test title";
					//tds[2].textContent = "newlec";
				
				//복제된 tr을 노드 트리에 추가
				tbody.appendChild(clone);
				
				}
				
			}
			
		};
	});
	
	
	<!-- Ajax로 파일 전송과 트리거 ------------------------------------------------------>
	window.addEventListener("load", function(){
		var fileInput = document.querySelector("#ex3-upload input");
		var submitButton = document.querySelector("#ex3-upload span");
		var progressBar = document.querySelector("#ex3-upload #progress-bar");
		progressBar.style.width = "0px";
		
		submitButton.onclick = function(e){
			
			var event = new MouseEvent("click", {
				'view': window,
				'bubbles': true,
				'cancelable': true
			});
			
			fileInput.dispatchEvent(event);
			fileInput.onchange = function(){
				var file = fileInput.files[0];
				
				var formData = new FormData();
				formData.append("title", "test");
				formData.append("file", file);
				
				var xhr = new XMLHttpRequest();
				
				xhr.upload.onprogress = function(e){
					//console.log(Math.round(e.loaded*100/e.total) + "%");
					var percentage = Math.round(e.loaded*100/e.total);
					progressBar.textContent = percentage + "%";
					progressBar.style.width = percentage + "px";
					progressBar.style.background = "aqua";
				};
				//loaded : x = total : 100
				
				xhr.onload = function(){
					
				}
				
				xhr.onerror = function(e){
					alert("예기치 못한 오류");
				};
				xhr.open("POST", "../../upload?${_csrf.parameterName}=${_csrf.token}", true);	
				xhr.send(formData);
				
				
				//alert(file.name);
				/* for(var key in fileInput.files[0])
					alert(key); */
			};
			
		};
	});
	
	
	
</script>

</head>
<body>

	

	<!-- Ajax로 파일 전송과 트리거 ------------------------------------------------------>
	<div id="ex3-upload">
		<input type="file" style="display: none;"/>
		<span style="border: 1px solid #999; border-radius: 5px; background: pink; padding: 3px; cursor: pointer;">파일 선택</span>
		<span id="progress-bar" style="display: inline-block;" ></span>
		
		<%-- <form action="../../upload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		
			<div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<input type="submit" value="전송" />
				<input type="button" value="Ajax요청" />
			</div>
			
			<div id="clone-container">
				<table border="1">
					<tbody>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="file" name="file" /></td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</form> --%>
		
		<div>
			<ul>
				<li></li>
			</ul>
		</div>
				
	</div>

	<hr />


	<!-- Template 태그를 이용한 노드 복제 예제 ------------------------------------------------------>
	<div id="ex2-clone">
		<div>
			<input type="button" value="단순 복제" />
			<input type="button" value="Ajax요청" />
		</div>
		<div id="clone-container">
			<table border="1">
				<thead>
					<tr>
						<td></td>
						<td>코드</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
				
			<template>
			<!-- 복제할 대상을 template 태그에 넣어서 숨김 -->
				<tr>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</template>
			
		</div>
	</div>

	<hr />


	<!-- 노드 복제 예제 ------------------------------------------------------>
	<div id="ex-clone">
		<div>
			<input type="button" value="단순 복제" />
		</div>
		<div id="clone-container">
			<table border="1">
				<thead>
					<tr>
						<td></td>
						<td>코드</td>
						<td>제목</td>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td><input name="id" type="radio" value="1" /></td>
						<td>1</td>
						<td>ㅋㅋㅋㅋ</td>
					</tr>
				</tbody>
			</table>
			
		</div>
	</div>

	<hr />
	
	<!-- 기본 행위 막기 예제 ------------------------------------------------------>
	<form>
		<input type="text" name="title" /><br />
		<input type="submit" value="전송 " />	
		<a href="">취소</a>
	</form>
	
	<hr />
	
	<!-- 노드 바꾸기 예제2 + 이벤트 심화: 버블링과 캡쳐링 ------------------------------------------------------>
	<input id="move-up-button" type="button" value="위로 옮기기" />
	<div id="move-up-container">
		<table border="1">
			<thead>
				<tr>
					<td></td>
					<td>코드</td>
					<td>제목</td>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td><input name="id" type="radio" value="1" /></td>
					<td>1</td>
					<td>ㅋㅋㅋㅋ</td>
				</tr>
				
				<tr>
					<td><input name="id" type="radio" value="2" /></td>
					<td>2</td>
					<td>ㅠㅠㅠㅠ</td>
				</tr>
				
				<tr>
					<td><input name="id" type="radio" value="3" /></td>
					<td>3</td>
					<td>ㅂㅂㅂㅂ</td>
				</tr>
				
				<tr>
					<td><input name="id" type="radio" value="4" /></td>
					<td>4</td>
					<td>ㄱㄱㄱㄱ</td>
				</tr>
			</tbody>
		</table>
		
	</div>
	
	<hr />
	
	<!-- 노드 바꾸기 예제 ------------------------------------------------------>
	<input id="swap-node-button" type="button" value="노드 바꾸기" />
	<div id="node-swap-container">
		<img src="https://s-media-cache-ak0.pinimg.com/originals/f7/d8/97/f7d8977935a3ef91038141f04e7e759c.png" style="width: 200px;">
		<img src="http://mblogthumb1.phinf.naver.net/20160803_208/kdh_14_14702059507367QGJT_PNG/%C4%AB%C4%AB%BF%C0%C7%C1%B7%BB%C1%EE_%B6%F3%C0%CC%BE%F0_%C1%BE%C0%CC%C0%CE%C7%FC_%C4%AB%C4%AB%BF%C0%C7%C1%B7%BB%C1%EE%C1%BE%C0%CC%C0%CE%C7%FC_%C4%AB%C5%E5%C1%BE%C0%CC%C0%CE%C7%FC_%C4%AB%C5%E5%C0%CE%C7%FC_%C4%AB%C5%E5_%C4%AB%C4%AB%BF%C0%C5%E5_%B6%F3%C0%CC%BE%F0%C1%BE%C0%CC%C0%CE%C7%FC_%B6%F3%C0%CE_%281%29.png?type=w2" style="width: 200px;">
		<img src="https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png" style="width: 200px;">
	</div>
	
	<hr />

	<!-- 텍스트 노드 추가 예제 ------------------------------------------------------>
	<input id="add-text-node-button" type="button" value="텍스트노드 추가" />
	<input id="add-img-node-button" type="button" value="이미지노드 추가" />
	<input id="remove-node-button" type="button" value="노드 삭제" />
	<div id="node-container">
			
	</div>
	
	<hr />


	<!-- 자식 노드 변경 예제 ------------------------------------------------------>
	<input id="ch-node-button" type="button" value="자식노드 변경" />
	<div id="ch-node-container">
		hello	
	</div>
	
	<hr />
	
	<!-- 속성 변경 예제 ------------------------------------------------------>
	<input id="url" type="text" />
	<input id="ch-img-button" type="button" value="이미지 변경" />
	<div id="img-container">
		<img src="https://s-media-cache-ak0.pinimg.com/originals/f7/d8/97/f7d8977935a3ef91038141f04e7e759c.png" style="width: 200px;">
		<!-- https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png -->
	</div>	
	
	<hr />

	<!-- Selector API 예제 ------------------------------------------------------>
	<input id="ch-button1" type="button" value="배경색 변경" />
	<div id="module1">
		<div>1</div>
		<div>
			<div>2</div>
			<!-- comment -->	
		</div>
		<div>3</div>
	</div>	
	
	<hr />

	<!-- 노드 순회 예제 ------------------------------------------------------>
	<input id="ch-button" type="button" value="배경색 변경" />
	<div>
		<div>1</div>
		<div id="p">
			<div>2</div>
			<!-- comment -->	
		</div>
		<div>3</div>
	</div>	
	
	<hr />

	<!-- ifrmae 예제 ------------------------------------------------------>
	
	<div>
		<input id="nav-button" type="button" value="페이지 전환" />
		<iframe src="notice.html" style="width:500px; height:300px;" ></iframe>	
	</div>
	<hr />
	
	<!-- open a window 예제 ------------------------------------------------>
	<div>
		<input id="open-button" type="button" value="새창띄우기"/>
		<input id="mov-button" type="button" value="왼쪽으로 이동"/>
		<input id="trans-button" type="button" value="페이지  이동"/>
	</div>
	<hr />
	
	<!-- Timer 예제 -------------------------------------------------------->
	<p>
		남은시간 <span id="count-label">60</span>초
		<input id="count-button" type="button" value="카운트 시작" />
	</p>
	<hr />
	
	
	<!-- Calculator 예제 -------------------------------------------------------->
	<!-- <input type="button" value="출력" onclick="alert('안내 메시지');" /> -->
	<div id="ex1">
		<input type="text" id="x" placeholder="x값을 입력하세요" /> +
		<input type="text" id="y" placeholder="y값을 입력하세요" /> =
		<input type="button" value="더하기" id="add-button" />
		<input type="text" value="" id="result" />
	</div>



</body>
</html>