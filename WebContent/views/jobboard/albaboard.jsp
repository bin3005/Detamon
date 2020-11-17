<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대타몬:대타찾기</title>
<link rel="stylesheet" type="text/css" href="views/css/albaboard.css">
<%@ page import = "java.util.List" %>
<%@ page import = "detamon.dto.JobBoardDto" %> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#fo").submit(function(){
		var list = document.getElementsByName("type1");
		var cnt = 0;
		for(var i=0; i<list.length; i++){
			if(list[i].checked == true){
				cnt++;
			
			}
		}
		if(cnt==0){
			for(var i=0; i<list.length; i++){
				list[i].checked = true;
				console.log(list[i].checked);
			}
		}
	});
});
$(function(){
	$("#fo").submit(function(){
		var list = document.getElementsByName("type2");
		var cnt = 0;
		for(var i=0; i<list.length; i++){
			if(list[i].checked == true){
				cnt++;
			
			}
		}
		if(cnt==0){
			for(var i=0; i<list.length; i++){
				list[i].checked = true;
				console.log(list[i].checked);
			}
		}
	});
	
});
function movePage(pagenum){
	$("#pagenum").val(pagenum.text);
	var pageform = document.getElementById('pageform');
	pageform.submit();
	
}
function nextPageGroup(){
	if( ${endPage + 1 < totalPageNum}){
		$("#pagenum").val(${endPage+1});
		var pageform = document.getElementById('pageform');
		pageform.submit();
	}
	
}
function prePageGroup(){
	if( ${startPage - 1 > 0}){
		$("#pagenum").val(${startPage-1});
		var pageform = document.getElementById('pageform');
		pageform.submit();
	}
}	
</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<jsp:include page="../common/header.jsp"></jsp:include>

<body>
<div id="boardtitle">
		<p>대타 찾기</p>
	</div>
<br>
	<form method="post" action="controller.do?command=albasearch" id="fo" name="search">
	<div style="display:none">
		<input type="checkbox" name="type1" value="0">
		<input type="checkbox" name="type2" value="0">
	</div>
	<table class="table"border="1" id="search">
        <tbody>
          <tr>
            <td style="width: 60px;">업종</td>
            <td>
                <input type="radio" name="type1" value="1" checked="checked">카페
                <input type="radio" name="type1" value="2">편의점
                <input type="radio" name="type1" value="3">음식점
                <input type="radio" name="type1" value="4">일용직
                <input type="radio" name="type1" value="5">배달
                <input type="radio" name="type1" value="6">유흥시설
                <input type="radio" name="type1" value="7">기타
            </td>
          </tr>
          <tr>
          	<td style="width: 60px;">지역</td>
          	<td>
          		<input type="radio" name="type2" value="4" checked="checked">강동구
          		<input type="radio" name="type2" value="2" >송파구
          		<input type="radio" name="type2" value="1">강남구
          		<input type="radio" name="type2" value="3">서초구
          		<input type="radio" name="type2" value="5">동작구
          		<input type="radio" name="type2" value="6">관악구
          		<input type="radio" name="type2" value="7">영등포구
          		<input type="radio" name="type2" value="11">금천구
          		<input type="radio" name="type2" value="9">양천구
          		<input type="radio" name="type2" value="10">구로구
          		<input type="radio" name="type2" value="8">강서구
          		<input type="radio" name="type2" value="16">마포구
          		<input type="radio" name="type2" value="17">용산구
          		<input type="radio" name="type2" value="13">중구
          		<input type="radio" name="type2" value="18">성동구
          		<input type="radio" name="type2" value="19">광진구
          		<input type="radio" name="type2" value="15">중량구
          		<input type="radio" name="type2" value="14">동대문구
          		<input type="radio" name="type2" value="12">종로구<br>
          		<input type="radio" name="type2" value="21">서대문구
          		<input type="radio" name="type2" value="20">은평구
          		<input type="radio" name="type2" value="22">성북구
          		<input type="radio" name="type2" value="25">노원구
          		<input type="radio" name="type2" value="24">도봉구
          		<input type="radio" name="type2" value="23">강북구
          	</td>
          </tr>
          <tr>
          	<td style="width: 60px;">기간</td>
          	<td>
          		<input type="radio" name="type3" value="0" checked="checked">당일
          		<input type="radio" name="type3" value="3">3일이내
          		<input type="radio" name="type3" value="7">1주일이내
          		<input type="radio" name="type3" value="14">2주일이내
          		<input type="radio" name="type3" value="21">3주일이내
          		<input type="radio" name="type3" value="30">한달이내
          	</td>
          </tr>
        </tbody>
       
      </table>
      <button class="btn btn-warning btn-sm" type="reset" style="margin-left:74%; ">초기화</button> <button class="btn btn-warning btn-sm" type="submit" onclick="search();">검색</button>
      </form>
      <div>
      <br>

      </div>
     <!-- 게시글  -->
     <br><br>
	<table class="table table-hover" id="ctn">
		<thead style="font-weight:bold;font-size:15px;">
			<tr>
				<th>아이디/제목</th>
				<th>희망지역</th>
				<th>업종</th>
				<th>신뢰도</th>
				<th>기간/시간</th>
				<th>급여</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody style="font-weight: bold; font-size:15px;">
			
					<c:forEach var = "i" begin="0" end="${list.size()-1 }" step="1">
					
						<tr style="cursor:pointer;" onclick="location.href='controller.do?command=boarddetail&no=${list.get(i).getNo()}'">
							<td style="font-size:15px;"><span>
								<p  style="color:#0075ab;">${list.get(i).writer } </p>
								<p >${list.get(i).title }</p>
							</span></td>
							<c:choose>
								<c:when test="${list.get(i).getLoc() == 1}" >
								<td>강남구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 2}" >
								<td>송파구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 3}" >
								<td>서초구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 4}" >
								<td>강동구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 5}" >
								<td>동작구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 6}" >
								<td>관악구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 7}" >
								<td>영등포구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 8}" >
								<td>강서구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 9}" >
								<td>양천구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 10}" >
								<td>구로구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 11}" >
								<td>금천구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 12}" >
								<td>종로구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 13}" >
								<td>중구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 14}" >
								<td>동대문구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 15}" >
								<td>중랑구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 16}" >
								<td>마포구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 17}" >
								<td>용산구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 18}" >
								<td>성동구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 19}" >
								<td>광진구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 20}" >
								<td>은평구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 21}" >
								<td>서대문구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 22}" >
								<td>성북구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 23}" >
								<td>강북구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 24}" >
								<td>도봉구</td>
								</c:when>
								<c:when test="${list.get(i).getLoc() == 25}" >
								<td>노원구</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${list.get(i).getCategory()==1 }">
								<td>카페</td>
								</c:when>
								<c:when test="${list.get(i).getCategory()==2 }">
								<td>편의점</td>
								</c:when>
								<c:when test="${list.get(i).getCategory()==3 }">
								<td>음식점</td>
								</c:when>
								<c:when test="${list.get(i).getCategory()==4 }">
								<td>일용직</td>
								</c:when>
								<c:when test="${list.get(i).getCategory()==5 }">
								<td>배달</td>
								</c:when>
								<c:when test="${list.get(i).getCategory()==6 }">
								<td>유흥시설</td>
								</c:when>
								<c:when test="${list.get(i).getCategory()==7 }">
								<td>기타</td>
								</c:when>
								</c:choose>
							<td>${scorelist.get(i).getM_score() }</td>
							<td>
							<fmt:formatDate value="${list.get(i).getStart_date()}" pattern="MM/dd"/>
								~
								<fmt:formatDate value="${list.get(i).getEnd_date()}" pattern="MM/dd"/>
								<br>
								<fmt:formatDate value="${list.get(i).getStart_time()}" pattern="HH:mm"/>
								~
								<fmt:formatDate value="${list.get(i).getEnd_time()}" pattern="HH:mm"/>
							</td>
							<td>시급<br>${list.get(i).getMoney() }원</td>
							<td>${fn:substring(list.get(i).getRegDate(),0,10) }</td>
							
						</tr>
						
					</c:forEach>
			
		</tbody>
	</table>
	<br>
	<button class="btn btn-warning btn-sm" style="margin-left:78%;" onclick="location.href='controller.do?command=upload-alba'">글작성</button>
	<br><br>
	<!-- 페이징 -->
	<div class = "pagin_div">
					<ul class="pagin" >
						<li class="page_li"><a class="next_page" onclick="prePageGroup();"><</a></li>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1" varStatus="status">
							<c:choose>
								<c:when test="${currentPage == startPage + status.count -1 }"><li class="page_li"><a class="page_a current_page" onclick="movePage(this);">${startPage + status.count -1 }</a></li></c:when>
								<c:otherwise><li class="page_li"><a class="page_a" onclick="movePage(this);">${startPage + status.count -1 }</a></li></c:otherwise>
							</c:choose>
						</c:forEach>
						<li class="page_li"><a class="next_page" onclick="nextPageGroup();">></a></li>
					</ul>
					
					<form action="controller.do" method="post" id="pageform" name="pageform">
						<input type="hidden" name="command" value="alba">
						<input type="hidden" name="pagenum" id="pagenum">
					</form>
				
	 </div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>