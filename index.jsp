<%@page import="java.sql.*" %> 
<%
try
{	
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/okul","root","root"); 
	if(request.getParameter("delete")!=null)
	{
		int id=Integer.parseInt(request.getParameter("delete")); 
		PreparedStatement pstmt=null;  
		pstmt=con.prepareStatement("delete from kisiler where id=? "); 
		pstmt.setInt(1,id);
		pstmt.executeUpdate();  
		con.close(); 
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html> 
	<head> 
		<title>JSP:Insert, Update, Delete using MySQL</title>  
	</head>	 
<body>
		<div class="main"> 
			<center>
				<h1><a href="Add.jsp">Kayit Ekle</a></h1> 
		<table> 
			<tr>
				<th>ID</th>
				<th>Isim</th> <th>Departman</th> <th>Guncelle</th> <th>Sil</th>
			</tr>
		<% 
		try
		{	
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/okul","root","root"); 
			PreparedStatement pstmt=null;  
			pstmt=con.prepareStatement("select * from kisiler"); 
			ResultSet rs=pstmt.executeQuery(); 
			while(rs.next())
			{	
		%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td> 
					<td><a href="Update.jsp?edit=<%=rs.getInt(1)%> ">Degistir</a></td>
					<td><a href="?delete=<%=rs.getInt(1)%> ">Sil</a></td> 
				</tr>
		<%
			} 
		}
		catch(Exception e)
		{
			out.println(e);
		} 
		%>  
		</table> 
                        </center>
		</div> 
</body> 
</html> 