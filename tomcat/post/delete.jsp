<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
 request.setCharacterEncoding("utf-8");
 String id = request.getParameter("del");
 try{
  Class.forName("com.mysql.cj.jdbc.Driver");
  String url = "jdbc:mysql://mysql-rds.c3kgc8oamzq7.ap-northeast-2.rds.amazonaws.com:3306/myDB?useUnicode=true&characterEncoding=utf-8";
  Connection con = DriverManager.getConnection(url,"admin","ok651221");
  Statement stat = con.createStatement();
  String query = "DELETE FROM member where id='" + request.getParameter("del")+"'";
  //쿼리문 전송
  stat.executeUpdate(query); //return 1.
  stat.close();
  con.close();
  response.sendRedirect("output.jsp") ;
 }
  catch(Exception e){
  out.println( e );
 }
 %>