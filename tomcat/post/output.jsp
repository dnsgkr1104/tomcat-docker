<%@ page  contentType="text/html;charset=utf-8"
        import="java.sql.DriverManager,
                   java.sql.Connection,
                   java.sql.Statement,
                   java.sql.ResultSet,
                   java.sql.SQLException" %>
<%
  response.setContentType("text/html;charset=utf-8;");
  request.setCharacterEncoding("euc-kr");     //charset, Encoding 설정
  Class.forName("com.mysql.jdbc.Driver");    // load the drive
  String DB_URL =
          "jdbc:mysql://mysql-rds.c3kgc8oamzq7.ap-northeast-2.rds.amazonaws.com:3306/myDB?useUnicode=true&characterEncoding=utf-8";
                 // 주의 : test by changing mydb to name that you make
  String DB_USER = "admin";
  String DB_PASSWORD= "ok651221";
  Connection conn= null;
  Statement stmt = null;
  ResultSet rs   = null;
  try {
      conn = DriverManager.getConnection(DB_URL,admin,ok651221);
      stmt = conn.createStatement();
      String query = "SELECT id, name, pwd, email FROM member";
      rs = stmt.executeQuery(query);
 %>
<form action="delete_do.jsp" method="post">
<table border="1" cellspacing="0">
<tr>
<td>ID</td>
<td>Name</td>
<td>password</td>
<td>email</td>
<th>비고</th>
</tr>
<%
    while(rs.next()) { //rs 를 통해 테이블 객체들의 필드값을 넘겨볼 수 있다.
%><tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString("pwd")%></td>
<td><%=rs.getString("email")%></td>
<td><a href="delete_do.jsp?del=<%=rs.getString(1)%>">삭제</a>
</td>
</tr>
<%
    } // end while
%></table>
</form>
<%
  rs.close();        // ResultSet exit
  stmt.close();     // Statement exit
  conn.close();    // Connection exit
}
catch (SQLException e) {
      out.println("err:"+e.toString());
}
%>