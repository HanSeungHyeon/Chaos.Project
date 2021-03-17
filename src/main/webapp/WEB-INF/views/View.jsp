<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<script type="text/javascript">
	function email() {
		if (confirm("${mDTO.email} 이메일이 맞습니까?") == true) {
			document.location = "email?email=${mDTO.email}";
		} else {
			document.location = "email";
		}
	}
</script>
<!-- 글입력 시 글을 입력해야 등록가능 -->
<script type="text/javascript">
	function showbtn() {
		var content;
		content = document.getElementById("message");
		if (content.value.length > 0) {
			document.getElementById("subbtn").style.display = "block";
		} else {
			document.getElementById("subbtn").style.display = "none";
		}
	}
	function showbtn_c() {
		var content;
		content = document.getElementById("message_c");
		if (content.value.length > 0) {
			document.getElementById("subbtn_c").style.display = "block";
		} else {
			document.getElementById("subbtn_c").style.display = "none";
		}
	}
</script>

<!-- 댓글창보이기 -->
<script type="text/javascript">
function resize(img){
	   // 원본 이미지 사이즈 저장
	   var width = img.width;
	   var height = img.height;

	   // 가로, 세로 최대 사이즈 설정
	   var maxWidth = 400;   // 원하는대로 설정. 픽셀로 하려면 maxWidth = 100  이런 식으로 입력
	   var maxHeight = 300;   // 원래 사이즈 * 0.5 = 50%

	   // 가로나 세로의 길이가 최대 사이즈보다 크면 실행  
	   if(width > maxWidth || height > maxHeight){

	      // 가로가 세로보다 크면 가로는 최대사이즈로, 세로는 비율 맞춰 리사이즈
	      if(width > height){
	         resizeWidth = maxWidth;
	         resizeHeight = maxHeight;

	      // 세로가 가로보다 크면 세로는 최대사이즈로, 가로는 비율 맞춰 리사이즈
	      }else{
	         resizeHeight = maxHeight;
	         resizeWidth = maxWidth;
	      }

	   // 최대사이즈보다 작으면 원본 그대로
	   }else{
	      resizeWidth = width;
	      resizeHeight = height;
	   }

	   // 리사이즈한 크기로 이미지 크기 다시 지정
	   img.width = resizeWidth;
	   img.height = resizeHeight;
	}
</script>

<script type="text/javascript">
// onload 문서가 다 작성되고 준비되었을때
window.onload = function(){
	var id = $('#onid').val();
	 $.ajax({
		    url: "likechk",
		    type: "POST",
		    data : id,
		    dataType: "json",
		    success: function(data) {
		    	
		    	// String -> Json 으로 바꾼 함수 : JSON.parse
		    	// Json -> String 으로 바꾼 함수 : JSON.stringify
// 					let str = JSON.stringify(data);
// 					alert(str);
// 		    	for(var i=0 ; i < data.length; i++ ){
		    		$('#'+data[0]+'lchk').html("편~안");		    		
		    },
		    error: function(request, status, error){
		    },
		    async: false
		  });

}
</script>

<script type="text/javascript">
/* 좋아요 */
function like_func(no,nick){
  var Mnick = nick;
  var newsno = no;
  var idno = no+'lchk';
  var cntidno = no+'cntlk';
  //var mno = $('#mno', frm_read).val();
  //console.log("boardno, mno : " + boardno +","+ mno);
  $.ajax({
    url: "liketo",
    type: "POST",
    data: {Mnick,newsno},
    cache: false,
    dataType: "json",
    contentType : "application/json; charset=UTF-8",
    success: function(data) {
    	if(data.chk == 1){
    		$('#'+idno).html("불~편");
    		$('#'+cntidno).html("편~안 : "+data.cnt+"개");
    	}else{
    		$('#'+idno).html("편~안");
    		$('#'+cntidno).html("편~안 : "+data.cnt+"개");
    	}
    },
    error: function(request, status, error){
      alert("로그인을 해주세요");
    }
  });
}


// 출처: https://shxrecord.tistory.com/6 [첫 발]
</script>
<style>
html {
    scroll-behavior: smooth;
}
#subbtn {
	display: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s;
	height: 40px;
	font-weight: 400;
	text-align: center;
}

#subbtn_c {
	display: none;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s;
	height: 40px;
	font-weight: 400;
	text-align: center;
}

#HHH {
	height: 235px;
}

#r_date {
	margin-bottom: 5px;
	text-align: right !important;
}
</style>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<!--To Work with icons-->
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<title>ChoasSNS</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper.min.css">
<script type="text/javascript" src="js/swiper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/swiper.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
		var swiper = new Swiper('.swiper-container', {
			loop: false,
			pagination: '.swiper-pagination',
            paginationClickable: true
		});
	});
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<nav class="left">
			<a href="#menu"><span>Menu</span></a>
		</nav>
		<a href="chaos" class="logo">CHAOS</a>

		<c:if test="${Nick != null }">
			<nav class="right">
				<a href="logout" class="button alt">Log out</a>
			</nav>
		</c:if>
		<c:if test="${Nick == null }">
			<nav class="right">
				<a href="login" class="button alt">Log in</a>
			</nav>
		</c:if>
		<input type="hidden" value="${Id }" id="onid" />
	</header>

	<!-- Menu -->
	<nav id="menu">
		<ul class="links">
			<li><a href="chaos">Home</a></li>
			<li><a href="mypage">Mypage</a></li>
		</ul>
		<ul class="actions vertical">
			<li><c:if test="${Nick == null }">
					<a href="login" class="button fit">Login</a>
				</c:if> <c:if test="${Nick != null }">
					<a href="logout" class="button fit">Logout</a>
				</c:if></li>
		</ul>
	</nav>

	<!-- //Header -->

	<!-- 게시글 몸통 -->
	<nav class="navbar navbar-light bg-white" id="top">
		<a href="#" class="navbar-brand">ChaosSNS</a>
		<form class="form-inline">
			<div class="input-group">
				<input type="text" class="form-control"
					aria-label="Recipient's username" aria-describedby="button-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-primary" type="button"
						id="button-addon2">
						<i class="fa fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</nav>



	<div class="container-fluid gedf-wrapper">
		<div class="row">
			<div class="col-md-3">
				<div class="card">
               <div class="card-body">
                  <div class="h5" >
                     <c:if test="${Nick != null}">
                        <div style="padding-left:20px">@${Nick }</div>
                     </c:if>
                     <c:if test="${Nick == null}">
                        비회원입니다.
                     </c:if>
                  </div>
               </div>
               <ul class="list-group list-group-flush">
                  
                  <c:if test="${mDTO.status == 'N'}">
                     <li class="list-group-item"><a href="javascript:void(0);"
                        onclick="email();"><font color="red">이메일인증 하러가기</font></a></li>
                  </c:if>
               </ul>
            </div>
			</div>
			<div class="col-md-6 gedf-main">
				<!--- \\\\\\\Post-->
				<div class="card gedf-card">
					<div class="card-header">
						<div class="d-flex justify-content-between align-items-center">
							<div class="d-flex justify-content-between align-items-center">
								<div class="mr-2">
								<c:if test="${nview.pname == 'N' }">
									<img class="rounded-circle" width="45"
										src="${pageContext.request.contextPath}/resources/images/default.png" alt="">
								</c:if>
								<c:if test="${nview.pname != 'N' }">
									<img class="rounded-circle" width="45" style="height:45px"
										src="${pageContext.request.contextPath}/download?filename=${nview.pname}" alt="">
								</c:if>
								</div>
								<div class="ml-2">
									<div class="h5 m-0">@${nview.nick }</div>
								</div>
							</div>
							<div>
								<div class="dropdown">
									<button class="btn btn-link dropdown-toggle" type="button"
										id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">
										<i class="fa fa-ellipsis-h"></i>
									</button>
									<div class="dropdown-menu dropdown-menu-right"
										aria-labelledby="gedf-drop1">
										<div class="h6 dropdown-header">Configuration</div>
										<c:if test="${news.nick == Nick }">
											<a class="dropdown-item" href="#">수 정</a>
											<a class="dropdown-item" href="del?no=${news.no }">삭 제</a>
										</c:if>
										<c:if test="${news.nick != Nick }">
											<a class="dropdown-item" href="#">확 1</a>
											<a class="dropdown-item" href="#">확 2</a>
										</c:if>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="card-body">
						<div class="text-muted h7 mb-2">
							<i class="fa fa-clock-o"></i>${nview.dt }
						</div>
						<input type="hidden" value="${nview.no }">
						<div class="swiper-container">
							<div class="swiper-wrapper" style="text-align: center">
								<c:forEach var="img" items="${files }">
									<c:if test="${img.no == nview.no }">
										<div class="swiper-slide">
											<img class="img_topplace" onload="resize(this)"
												src="${pageContext.request.contextPath}/download?filename=${img.fname}"	/>
										</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						<p class="card-text">${nview.content }</p>
					</div>
					<div class="card-footer">
						<c:if test="${nview.no != like.no }">
							<a href="javascript:void(0);"
								onclick="like_func(${nview.no},${Id });" id="${nview.no }lchk"><i
								class="fa fa-gittip"></i>불~편 </a>
						</c:if>
						<a href="#" class="card-link"><i class="fa fa-comment"></i>Comment</a>
						<span style="color: BLUE" class="card-link" id="${nview.no }cntlk">
							편~안 : ${nview.likes } 개</span>
					</div>
				</div>
				<!-- 댓글부분 -->
				<%@ include file="../views/comment.jsp"%>

				<!--//댓글부분 -->

				<!-- Post /////-->

			</div>
			<div class="col-md-3">
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">한 승 현</h5>
						<h6 class="card-subtitle mb-2 text-muted">이 시대의 최고 개발자</h6>
						<p class="card-text">나이 : 26, 거주지 : 천안시 서북구 두정동, 주특기 : 사격지휘, 키
							: 180, 몸무게 : 모델급, 별명 : 한해인</p>
						<a href="mailto:tmdgus4720@naver.com" class="card-link">이메일</a> <a href="https://open.kakao.com/o/s6VArW1c"
							class="card-link">개발자 문의</a>
					</div>
				</div>
				<div class="card gedf-card">
					<div class="card-body">
						<h5 class="card-title">오 남 규</h5>
						<h6 class="card-subtitle mb-2 text-muted">둘째라면 서러운 개발자</h6>
						<p class="card-text">나이 : 26, 거주지 : 천안시 서북구 부대동, 주특기 : 명령복종, 키
							: 173, 몸무게 : 돼지, 별명 : 오남규리</p>
						<a href="mailto:qaz5344@naver.com" class="card-link">이메일</a> <a href="https://open.kakao.com/o/svc0tW1c"
							class="card-link">개발자 문의</a>
					</div>
				</div>
				<div class="card gedf-card">
					<div class="card-body">
						<h3 class="card-title">광고 받아요</h3>
						<a href="#" class="card-link">이메일</a> <a href="#"
							class="card-link">010-0000-0000</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //게시글 몸통 -->

	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<h2>Create HSH And ONG SNS</h2>
			<ul class="actions">
				<li><span class="icon fa-phone"></span> <a href="tel:010-4720-5289">전화 문의</a></li>
				<li><span class="icon fa-envelope"></span> <a target="#" href="https://open.kakao.com/o/s6VArW1c">카카오톡 문의하기</a></li>
				<li><span class="icon fa-map-marker"></span> 카카오,네이버,구글 거기서보자</li>
			</ul>
		</div>
		<div class="copyright">
			&copy; Untitled. Design <a href="https://templated.co">TEMPLATED</a>.
			Images <a href="https://unsplash.com">Unsplash</a>.
		</div>
	</footer>
	<!--// Footer -->

	<!-- 하단퀵메뉴영역 -->
	<div class="quick_area">
		<p class="to_top">
			<a href="#top" class="s_point" value="TOP">TOP</a>
		</p>
	</div>
	<!-- //하단퀵메뉴영역 -->

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.smooth-scroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>


</body>
</html>