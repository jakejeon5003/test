<%@page import="sist.com.dao.BoardDao"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="sist.com.bean.Board"%>
<%@page import="org.apache.commons.fileupload.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<%
		request.setCharacterEncoding("UTF-8");
		String job=request.getParameter("job");
		String title=request.getParameter("title");
		String writer=request.getParameter("writer");
		String contents=request.getParameter("contents");
		String password=request.getParameter("password");
		String fileName="";
		Board board=new Board();
		int no=0;
		if(job.equals("new")){
			board.setNo(BoardDao.getSequence());
		}else{
		no=Integer.parseInt(request.getParameter("no"));	
		}
		
	%>

	<%	
		/* try{
			String filePath="/Users/jakejeon/jspStart/webPro/WebContent/bbsApp/upload/";
			if(FileUpload.isMultipartContent(request)){
				DiskFileUpload diskFileUpload = new DiskFileUpload();
				diskFileUpload.setRepositoryPath(filePath);
				diskFileUpload.setSizeMax(1024*1024*5);
				List<FileItem>list=diskFileUpload.parseRequest(request);
				for(int i=0;i<list.size();i++){
					FileItem fileItem = list.get(i);
					//out.println(fileItem.getFieldName()+" "+i+" "+fileItem.isFormField());
					String name=fileItem.getFieldName();
					if(job.equals("reply")){
						if(name.equals("ref")){
						board.setRef(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
						if(name.equals("step")){
						board.setStep(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
						if(name.equals("lev")){
						board.setLev(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
						if(name.equals("pnum")){
						board.setpNum(Integer.parseInt(fileItem.getString("EUC-KR")));
						}
					}
					if(name.equals("title")){
						board.setTitle(fileItem.getString("UTF-8"));
					}
					if(name.equals("writer")){
						board.setWriter(fileItem.getString("UTF-8"));
					}
					if(name.equals("password")){
						board.setPassword(fileItem.getString("UTF-8"));
					}
					if(name.equals("contents")){
						board.setContents(fileItem.getString("UTF-8"));
					}
					if(!fileItem.isFormField()){
						board.setFileName(fileItem.getName());
						File file= new File(filePath+board.getFileName());
						fileItem.write(file);
					}
				}
			}
		}catch(Exception e){
			out.print(e.getMessage());
			e.printStackTrace();
		} */
	/* 	board.setJob(job); */
		if(job.equals("new")){
			System.out.println(board);
			board.setTitle(title);
			board.setWriter(writer);
			board.setPassword(password);
			board.setContents(contents);
			board.setRef(board.getNo());
			board.setpNum(board.getNo());
			BoardDao.insertBoard(board);
			response.sendRedirect("listBoard.jsp");
			return;
		}/* else if(job.equals("reply")){
			BoardDao.updateReply(board);
			board.setStep(board.getStep()+1);
			board.setLev(board.getLev()+1); 
			BoardDao.updateStep(board);
			BoardDao.insertBoard(board);
			response.sendRedirect("listBoard.jsp");
			return;
		}else if(job.equals("modify")){
		  board.setNo(no);
		  BoardDao.updateBoard(board);
		  System.out.println(board);
		  response.sendRedirect("listBoard.jsp");
		  return;
		} */
		
		
	%>
<body>
</body>
</html>