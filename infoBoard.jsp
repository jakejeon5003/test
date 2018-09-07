<%@page import="sist.com.dao.BoardDao"%>
<%@page import="sist.com.bean.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href='https://fonts.googleapis.com/css?family=RobotoDraft' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,i {font-family:SpoqaHanSans;}
.w3-bar-block .w3-bar-item {padding:16px}

* {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 110%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit],input[type=button] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=submit]:hover {
    background-color: #45a049;
}
input[type=button]:hover {
    background-color: #45a049;
}

.container {
	width: 100%;
    border-radius: 0px;
    background-color: #2196F3;
    padding: 20px;
}

.col-25 {
    float: left;
    width: 15%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
</style>
<% 
String job=request.getParameter("job");
String title="";
String writer="";
String contents="";

if(job.equals("info")){
int no=Integer.parseInt(request.getParameter("no"));
Board board=(Board)BoardDao.selectInfoBoard(no);
title=board.getTitle();
writer=board.getWriter();
contents=board.getContents();
}
%>

</head>
<body>

<div class="container w3-padding w3-blue">
       <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-right w3-xxlarge"><a href="javascript:self.close()"><i class="fa fa-remove"></i></a></span>
   
    <%if(job.equals("new")){ %>
     <i class="fa fa-pencil-square-o" style="font-size:36px">&nbsp;게시글 작성</i>
   <%}else if(job.equals("info")){%>
	   <i class="fa fa-window-maximize" style="font-size:36px">&nbsp;게시글 조회</i>
   <%}%>
    
    </div>
<div class="container">
  <form action="boardInsert.jsp" method="post">
    <div class="row">
      <div class="col-25">
        <label for="fname" style="color: white">글쓴이</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="writer" placeholder="작성자 이름을 입력하세요." value="<%=writer%>">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname" style="color: white">비밀번호</label>
      </div>
      <div class="col-75">
        <input type="text" id="lname" name="password" placeholder="비밀번호를 입력하세요." value="">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="country" style="color: white" >제목</label>
      </div>
     <div class="col-75">
        <input type="text" id="lname" name="title" placeholder="제목을 입력하세요." value="<%=title%>">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="subject" style="color: white" >내용</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="contents" placeholder="내용을 입력하세요." style="height:200px"><%=contents%></textarea>
      </div>
    </div>
    <div class="row" style="margin-top: 10px">
      <input type="submit" value="작성하기">
      <%if(job.equals("info")){ %>
      <input type="button" value="삭제하기">
      <input type="button" value="수정하기">
      <%}%>
    </div>
    <input type="hidden" id="job" name="job" value="<%=job%>" />
  </form>
</div>

</body>
</html>
