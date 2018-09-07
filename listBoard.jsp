<%@page import="sist.mvc.action.LoginAction"%>
<%@page import="sist.com.bean.Board"%>
<%@page import="java.util.List"%>
<%@page import="sist.com.dao.BoardDao"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<style>
a {text-decoration: none; color: black;}

* {
  box-sizing: border-box;
  font-family: SpoqaHanSans;
}
/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 15px;
  border: 1px solid grey;
  float: right;
  width: 20%;
  background: #f1f1f1;

}
/* Style the submit button */
form.example button {
  float: right;
  width: 5%;
  height: 40%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 22px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
.btn-group .button {
    background-color: #2196F3; /* Green */
    border: 1px solid grey;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    cursor: pointer;
    float: right;
}
.btn-group .button:not(:last-child) {
    border-right: none; /* Prevent double borders */
}
.btn-group .button:hover {
    background-color: #0b7dda;
}
#customers {
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}


#customers tr:nth-child(){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #2196F3;
    color: white;
}
#customers td{
text-align: center;
}
.pagination {
    display: block;
   text-align: center;
   margin-top: 10px
}

.pagination a {
    color: black;
    float: none;
    position: relative;
    padding: 8px 16px;
    text-decoration: none;
    transition: background-color .3s;
}

.pagination a.active {
    background-color: #2196F3;
    color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

* {box-sizing: border-box;}

/* Style the navbar */
.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

/* Navbar links */
.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

/* Navbar links on mouse-over */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* Active/current link */
.topnav a.active {
  background-color: #2196F3;
  color: white;
}

/* Style the input container */
.topnav .login-container {
  float: right;
}

/* Style the input field inside the navbar */
.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
  width: 150px; /* adjust as needed (as long as it doesn't break the topnav) */
}

.topnav input[type=password] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
  width: 150px; /* adjust as needed (as long as it doesn't break the topnav) */
}

/* Style the button inside the input container */
.topnav .login-container button {
  float: right;
  padding: 6px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .login-container button:hover {
  background: #ccc;
}

/* Add responsiveness - On small screens, display the navbar vertically instead of horizontally */
@media screen and (max-width: 600px) {
  .topnav .login-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .login-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc; 
  }
}
/*the container must be positioned relative:*/
.custom-select {
  position: relative;
  font-family: Arial;
}
.custom-select select {
  display: none; /*hide original SELECT element:*/
}
.select-selected {
  background-color: DodgerBlue;
}
/*style the arrow inside the select element:*/
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}
/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}
/*style the items (options), including the selected item:*/
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  user-select: none;
}
/*style items (options):*/
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}
/*hide the items when the select box is closed:*/
.select-hide {
  display: none;
}
.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}
</style>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String query=request.getParameter("query");
String data=request.getParameter("data");
HashMap<String,Object>map=new HashMap<String,Object>();
int totalRow=0;
if(query!=null && data!=null){
	 map.put("query", query);
	 map.put("data",data);
	 totalRow=BoardDao.getTotalRow(map);
		/* out.println(totalRow); */
}else{
totalRow=BoardDao.getTotalRow(null);	
/* out.println(totalRow); */
}
int pageScale=5;
int currentPage=1;
int totalPage=totalRow%pageScale==0?(totalRow/pageScale):(totalRow/pageScale)+1;
if(totalRow==0)totalPage=1;
try{
	currentPage=Integer.parseInt(request.getParameter("page"));
}catch(Exception e){
	/* out.println(e.getMessage()); */
}

int start=1+(currentPage-1)*pageScale;
int end=pageScale+(currentPage-1)*pageScale;

int currentBlock=currentPage%pageScale==0?(currentPage/pageScale):(currentPage/pageScale)+1;
int startPage=1+(currentBlock-1)*pageScale;
int endPage=pageScale+(currentBlock-1)*pageScale;
if(totalPage<=endPage){
	endPage=totalPage;
}
 map.put("start",start);
 map.put("end",end);
 List<Board>list=null;
 list=BoardDao.selectBoard(map);
%>
<script type="text/javascript">
function goUrl(url){
	window.open(url,'','left=300,top=200,width=683,height=516');
	window.focus();
}
</script>

<body>
<div class="topnav">
  <a class="active" href="#home">공지사항</a>
  <a href="#about">자유게시판</a>
  <a href="#contact">익명게시판</a>
  <div class="login-container">
  
  <%if(id==null){ %> <!--로그인 이후에는 로그인/회원가입 창 대신 로그인 정보 출력-->
    <form action="loginProcess.jsp" method="post">
      <input type="text" placeholder="아이디" name="username">
      <input type="password" placeholder="비밀번호" name="psw">
      <button type="button" onclick="goUrl('signup.jsp')">회원가입</button>
      <button type="submit">로그인</button>
    </form>
   <%}else{%>
   	<h3><%=id%>님 로그인하셨습니다</h3>
   <%}%>
   
  </div>
</div>
&nbsp;
<table id="customers">
<colgroup>
	<col width="30" />
	<col width="30" />
	<col width="180" />
	<col width="50" />
	<col width="30" />
	<col width="20" />					
</colgroup>
  <tr>
    <th scope="col">번호</th>
    <th scope="col">이미지</th>
    <th scope="col">제목</th>
    <th scope="col">글쓴이</th>
    <th scope="col">조회수</th>
    <th scope="col">등록일</th>
  </tr>
  <% for (int i =0;i<list.size();i++){
		Board board=list.get(i); %>					
  <tr>
    <td><%=board.getRm() %></td>
    <td><img src="/webPro/bbsApp/upload/2.jpg" width="30" height="30"/></td>
    <td style="text-align:left;"><a onclick="goUrl('infoBoard.jsp?job=info&no=<%=board.getNo()%>')"><%=board.getTitle() %></a></td>
    <td><%=board.getWriter() %></td>
    <td><%=board.getHit() %></td>
    <td><%=board.getRegdate() %></td>
  </tr>
  <% } %>
</table>

<div class="pagination">
  <a href="listBoard.jsp?page=1">&laquo;</a>
    
    <%  if (currentBlock > 1) {%>
     <a href="listBoard.jsp?page=<%=startPage-1%>">prev</a>
    <% } else { %>
    <a href="#">prev</a>
    <%}%>
 
    <%for (int i = startPage; i <= endPage; i++) {
      if (i == currentPage) {%>
    <a href="#" class="active"><%=i%></a>
    <% } else { %>
 	<a href="listBoard.jsp?page=<%=i%>"><%=i%></a>
    <%}}%>
  
   <%if(currentPage<totalPage){%>
   <a href="listBoard.jsp?page=<%=currentPage+1%>">next</a>                        
   <%}else{%>
   <a href="#">next</a> 
   <%}%>
   
   <a href="listBoard.jsp?page=<%=totalPage%>">&raquo;</a>
</div>
<div class="btn-group" style="margin-top: 20px">
<button class="button" onclick="goUrl('infoBoard.jsp?job=new')">글쓰기</button>
<button class="button">삭제</button>
</div>

<form class="example" action="action_page.php" style="margin-top: 20px">
  <button type="submit"><i class="fa fa-search"></i></button>
  <input type="text" placeholder="검색어를 입력하세요" name="search">
  <select style="float:right; width:80px; height:45px;" >
    <option value="0">선택하세요</option>
    <option value="1">&nbsp;&nbsp;&nbsp;아이디</option>
    <option value="2">&nbsp;&nbsp;&nbsp;&nbsp;제목</option>
    <option value="3"></option>
  </select>
  
</form>
</body>
</html>