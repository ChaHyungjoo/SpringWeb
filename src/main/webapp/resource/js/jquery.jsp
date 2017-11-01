<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	//window.addEventListener("load", function() {
	$(function(){
		//DOM 객체를
		//var _chButton = document.getElementById("ch-button");
		
		//jQuery 객체로 바꾸는 방법 1: jQuery 함수 이용하기
		//var chButton = jQuery(_chButton);
		
		//jQuery 객체로 바꾸는 방법 2: $ 함수 이용하기
		//var chButton = $(_chButton);
		
		//jQuery 객체로 바꾸는 방법 3: css selector 이용하기
		var chButton = $("#ch-button");
		
		/* //이벤트 바인딩 두 가지 옵션: 첫 번째 범용 이벤트 바인딩 함수 on()
		chButton.on("click", function(){
			alert("hi~");
		}); */
		
		//이벤트 바인딩 두 가지 옵션: 두 번째 범용 이벤트 바인딩 함수 click/keydown ...()
		chButton.click(function(){
			/* //여러 개의 수타일을 설정해야 하는 경우 1
			$("#p").css("background", "red");
			$("#p").css("font-size", "13px"); */
			
			//여러 개의 수타일을 설정해야 하는 경우 2
			$("#p").css({
				"background": "red",
				"font-size": "23px"
			});
			
		});
		
		
	});
	
	
	//--속성변경예제 --
	$(function() {
		var chImgButton = $("#ch-img-button");
		var container = $("#img-container");   
	    var img = $("img");
	    var imgSrc = $("#img-src");
	    
	    chImgButton.click(function() {
	    	img.attr("src", imgSrc.val());
	    });
	    
	});
	
	
	//--자식노드변경예제 -->
	$(function() {
	   var chNodeButton = $("#ch-node-button");
	   var container = $("#ch-node-container");   
	   
	   chNodeButton.click(function() {
		 	//1. 텍스트 노드 추가
		   	//container.textContent = "<h1>testtestset</h1>"
		   	//container.text("<h1>아 빈혜진</h1>");	//""안에 있는 글씨 그대로 출력
		 	
		   	//2. 엘리먼트 노드 추가
		   	//container.innerHTML = "<h1>testtestset</h1>"
		   	container.html("<h1>아 빈혜진</h1>");
		   
	   });
	   
	});


	$(function() {
		var addTextNodeButton = $("#add-text-node-button");
		var addImgNodeButton = $("#add-img-node-button");
		var removeNodeButton = $("#remove-node-button");
		var container = $("#node-container");

		var remove = function(e) {
			//container.removeChild(e.target);
			$(this).remove();
		}
		
		var idx = 0;
		addTextNodeButton.click(function() {
			//1.TextNode 생성
			//var span = document.createElement('span');
			var span = $('<span />');	//span 태그 생성
			//var txt = document.createTextNode('안녕하세여' + idx++);
			var txt = '안녕하세여' + idx++;
			
			//2. container(부모) 얻기
			//3. 부모에 자식을 추가
			//span.appendChild(txt);
			//container.appendChild(span);
			span.append(txt);
			container.append(span);

			span.click(remove);

		});
		
		addImgNodeButton.click(function() {
			//How to 1(성능에 좋음)
			//1. Element 생성
			// 이 방법은 너무 DOM을 사용하는 스타일로 구현한 코드
			/* var img = $('<img />');
			img.attr("src", "https://s-media-cache-ak0.pinimg.com/originals/f7/d8/97/f7d8977935a3ef91038141f04e7e759c.png");
			container.append(img);
			img.click(remove); */
			
			$("<img src='https://s-media-cache-ak0.pinimg.com/originals/f7/d8/97/f7d8977935a3ef91038141f04e7e759c.png' style='width: 200px;''/>")
			.appendTo(container/* 부모 */)
			.click(remove);
			
			
			//How to 2 (성능에 좋지 않지만 편리함.-> 한두개 넣는 상황의 성능에 영향을 주지 않을 거라면 이를 사용)
			//container.innerHTML += '<img onClick="remove()" src="http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile1.uf.tistory.com/image/2134514F579B4C7D165741" />';


		});
		
		removeNodeButton.click(function() {
			// 1. 내정된 노드를 지우기
			/* if (container.hasChildNodes()) {
				container.removeChild(container.lastChild);
			} */
			
			// 2. 선택된 노드를 지우기
			//막내 찾기
			//$("#node-container :last-child").remove();
			//$("#node-container").children().last().remove();
			
			//jquery 형식으로 찾기
			//$("#node-container img").eq(0).attr("src", "https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png");
			//DOM 형식으로 찾기
			//$("#node-container img").get(0).src="https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png";
			//each로 순회하면서 img가 있을 때 마다 삭제
			$("#node-container img").each(function(index){
				$(this).remove();	//DOM 형식으로 존재
			});
			
		});
	});
	
	//!--노드 바꾸기 예제 -->
	$(function() {
	   var swapNodeButton = $("#swap-node-button");
	   var container = $("#swap-node-container");   
	   
	   swapNodeButton.click(function() {
		   //var nodes = $("#swap-node-button img");
		   var nodes = container.find("img");
	      
	      //var node1 = nodes[0];
	      var node1 = nodes.eq(0);
	      var node2 = nodes.eq(1);
	      var node3 = nodes.eq(2);
	      
	      /* var node1 = container.firstElementChild;
	      var node3 = container.lastElementChild; */
	      //var oldNode = container.replaceChild(node1, node3);
	      //container.insertBefore(node3, container.firstChild);
	      
	      //var oldNode = container.replaceChild(node2, node3);
	      //container.insertBefore(node3, container.firstElementChild);
	      
	      //jQuery 기능을 이용한 코드
	      /* var oldNode = node3.replaceWith(node2);	//old.replaceWith(new)
	      node1.before(oldNode); */
	      
	      //jQuery 스러운 코드
	      node3.replaceWith(node2).insertBefore(node1);
	      
	   });
	});
	
	
	//!--노드 바꾸기 예제 2 -->
	$(function() {
		var moveUpButton = $("#move-up-button");
		//var radioButton = document.
		var container = $("#move-up-container");

		var checkedId = 0;

		var tbody = container.find("tbody");
		//var td = tbody.querySelector("tr:first-child td:last-child");
		//var td = tbody.firstElementChild.lastElementChild;
		//var td = tbody.children().first().children().last();
		var td = tbody.children(":first-child").children(":last-child");

		var tr = null;

		td.click(function(e) {
			//e.stopPropagation();

			console.log("td");
			//e.target.style.background = "green";
			$(e.target).css("background", "green");

		});

		tbody.click(function(e) {

			if (e.target.nodeName == "INPUT") {

				//tr = e.target.parentNode.parentNode;
				tr = $(e.target).parent().parent();


				//var oldNode = container.replaceChild(tr1, tr2);
				//container.insertBefore(oldNode, tr3);

			}

		//console.log("tbody");
		//alert("target : " + e.target.nodeName + ", current : " + e.currentTarget.nodeName);
		//e.target.style.background = "pink";
		//e.target.style.background = "pink";
		});

		/* var trs = container.querySelectorAll("tbody tr");
		
		for(var i=0; i<trs.length; i++)
		   trs[i].onclick = function(e){
		      e.target.style.background = "pink";
		   }; */

		moveUpButton.click(function() {

			if (tr == null)
				return;

			var container = tr.parent();

			//var bf = tr.previousElementSibling;
			var bf = tr.prev();
			//var af = tr.nextElementSibling;
			var af = tr.next();

			if (bf == null)
				bf = container.children().first();
				//bf = container.firstElementChild;
			
			//container.replaceChild(tr, bf);
			bf.replaceWith(tr);

			if (af == null)
				container.append(bf);
				//container.appendChild(bf);
			else
				bf.insertBefore(af);
				//container.insertBefore(bf, af);
		});
	});


	/* --- 엘리먼트의 기본 행위 막기 ------------------------------------------------- */
	window.addEventListener("load", function() {
		var titleText = $("form input[name]");
		var submitButton = $("form input[type='submit']");
		var cancelButton = $("form a");

		submitButton.click(function(e) {
			if (titleText.val() == "") {
				alert("제목을 입력하세요.");
				e.preventDefault();
			}
		});

		cancelButton.click(function(e) {
			if (titleText.val() != "") {
				if (!confirm("작성중이던 입력을 취소하시겠습니까?"))
					e.preventDefault();
			}
		});
		
	});


	/* --- 노드복제 예제----------------------------------------------------------------- */
	window.addEventListener("load", function() {
		var cloneButton = $("#ex-clone input[value='단순복제']");
		var tbody = $("#ex-clone tbody");

		cloneButton.click(function(e) {
			/* var tr = tbody.querySelector("tr");

			var clone = tr.cloneNode(true);
			tbody.appendChild(clone); */
			
			tbody.find("tr").clone(true).appendTo(tbody);
			
		});

	});
</script>

</head>
<body>

	<!--노드복제 예제 -->
	<div id="ex-clone">
		<div>
			<input type="button" value="단순복제" />
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
						<td>아~ 괜히 하자고 했지?</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr />


	<!--기본 행위 막기 예제 -->
	<form>
		<input type="text" name="title" /><br /> 
		<input type="submit" value="전송" /><a href="">취소</a>
	</form>
	<hr />

	<!--노드 바꾸기 예제 2 + 이벤트 심화 : 버블링과 캡처링 -->
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
					<td>아~ 괜히 하자고 했지?</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="2" /></td>
					<td>2</td>
					<td>졸ㄹ려~~</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="3" /></td>
					<td>3</td>
					<td>아~ 졸ㄹ려~~</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="4" /></td>
					<td>4</td>
					<td>정말 졸ㄹ려~~</td>
				</tr>
				<tr>
					<td><input name="id" type="radio" value="5" /></td>
					<td>5</td>
					<td>미쳐버리게 졸ㄹ려~~</td>
				</tr>
			</tbody>
		</table>

		<img src="https://s-media-cache-ak0.pinimg.com/originals/f7/d8/97/f7d8977935a3ef91038141f04e7e759c.png" style="width: 200px;" />
		<img src="https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png" style="width: 200px;" />
	</div>
	<hr />

	<!--노드 바꾸기 예제 -->
	<input id="swap-node-button" type="button" value="노드 바꾸기" />
	<div id="swap-node-container">
		<img src="https://s-media-cache-ak0.pinimg.com/originals/f7/d8/97/f7d8977935a3ef91038141f04e7e759c.png" style="width: 200px;" />
		<img src="http://mblogthumb1.phinf.naver.net/20160803_208/kdh_14_14702059507367QGJT_PNG/%C4%AB%C4%AB%BF%C0%C7%C1%B7%BB%C1%EE_%B6%F3%C0%CC%BE%F0_%C1%BE%C0%CC%C0%CE%C7%FC_%C4%AB%C4%AB%BF%C0%C7%C1%B7%BB%C1%EE%C1%BE%C0%CC%C0%CE%C7%FC_%C4%AB%C5%E5%C1%BE%C0%CC%C0%CE%C7%FC_%C4%AB%C5%E5%C0%CE%C7%FC_%C4%AB%C5%E5_%C4%AB%C4%AB%BF%C0%C5%E5_%B6%F3%C0%CC%BE%F0%C1%BE%C0%CC%C0%CE%C7%FC_%B6%F3%C0%CE_%281%29.png?type=w2" style="width: 200px;" />
		<img src="https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png" style="width: 200px;" />
	</div>
	<hr />

	<!--텍스트 노드 추가 예제 -->
	<input id="add-text-node-button" type="button" value="텍스트노드 추가" />
	<input id="add-img-node-button" type="button" value="이미지노드 추가" />
	<input id="remove-node-button" type="button" value="노드 삭제" />
	<div id="node-container"></div>
	<hr />

	<!--자식노드변경예제 -->
   	<input id="ch-node-button" type="button" value="자식노드 변경" />
   		<div id="ch-node-container">hello</div>
  	<hr />
  	
	<!--속성변경예제 -->
	<input type="text" id="img-src" />
	<input id="ch-img-button" type="button" value="이미지 변경" />
	<div id="img-container">
	   <img src="https://s-media-cache-ak0.pinimg.com/originals/6b/5a/8c/6b5a8cc63ce660cd4dd0bc7752f31a98.png" style="width: 200px;"/>
	   <!-- https://s-media-cache-ak0.pinimg.com/originals/f7/d8/97/f7d8977935a3ef91038141f04e7e759c.png -->
	</div>
	<hr />

	<!-- 노드 순회 예제 ------------------------------------------------------>
	<input id="ch-button" type="button" value="배경색 변경" />
	<div>
		<div>1</div>
		<div id="p">
			<div>2</div>
		</div>
		<div>3</div>
	</div>	
	
	<hr />

</body>
</html>