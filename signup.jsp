<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {box-sizing: border-box}

/* Full-width input fields */
  input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
  padding: 14px 20px;
  background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
  padding: 16px;
 	width: 40%;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .signupbtn {
    width: 100%;
  }
}
</style>
</head>
<body>
<form action="action_page.php" style="border:1px solid #ccc width:50%" >
  <div class="container">
    <h1>회원가입</h1>
    <p>아이디/비밀번호를 생성하세요</p>
    <hr>

    <label for="email"><b>아이디</b></label>
    <input type="text" placeholder="" name="email" required>

    <label for="psw"><b>비밀번호</b></label>
    <input type="password" placeholder="" name="psw" required>

    <label for="psw-repeat"><b>재입력</b></label>
    <input type="password" placeholder="" name="psw-repeat" required>

    <label>
      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
    </label>

    <!-- <p>약관동의 <a href="#" style="color:dodgerblue">이용약관</a>.</p> -->

    <div class="clearfix">
      <button type="button" class="cancelbtn">취소</button>
      <button type="submit" class="signupbtn">회원가입</button>
    </div>
  </div>
</form>
</body>
</html>