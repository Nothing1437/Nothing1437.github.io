<%@ page language="java" import="java.util.Date,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	     <title>News</title>
	     
	</head>
	<body>
	    <%
	       request.setCharacterEncoding("UTF-8");
	       String title=request.getParameter("title");
	       String newstxt=request.getParameter("newstxt");
	       String pubDate=new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new  Date());
	       String pubUser=(String)session.getAttribute("userName");
	       out.println(newstxt);
	    %>
	    
	</body>
</html>  