<%@ page import="java.sql.*" %> 
<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/okul","root","root"); 
	if(request.getParameter("btn_guncelle")!=null)
	{
		int id; 
		String isim,departman;
		id=Integer.parseInt(request.getParameter("txt_id")); 
                isim=request.getParameter("txt_isim"); 
		departman=request.getParameter("txt_departman");
		PreparedStatement pstmt=null; 
		pstmt=con.prepareStatement("update kisiler set isim=?, departman=? where id=?");
                pstmt.setString(1,isim);
		pstmt.setString(2,departman);
		pstmt.setInt(3,id);
		pstmt.executeUpdate(); 
		con.close(); 
		out.println("Guncelleme Tamamlanmistir...");
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
	<form method="post" name="myform"  onsubmit=""> 
		<center>
			<h1>Kayit Guncelleme Ekrani</h1> 
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/okul","root","root"); 
                        if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit")); 
				String isim,departman; 
				PreparedStatement pstmt=null;  
				pstmt=con.prepareStatement("select * from kisiler where id=?");  
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery();  
				while(rs.next()) 
				{
					id=rs.getInt(1);
					isim=rs.getString(2);
					departman=rs.getString(3);
			%>
			<tr>
				<td>Isim</td>
				<td><input type="text" name="txt_isim" value="<%=isim%>"></td>
			</tr> 
			<tr>
				<td>Departman</td>
				<td><input type="text" name="txt_departman" value="<%=departman%>"></td>
			</tr>	 
			<tr>
				<td><input type="submit" name="btn_guncelle" value="Guncelle"></td>	
			</tr> 
				<input type="hidden" name="txt_id" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>   </center>  <center> <h1><a href="index.jsp">Ana Sayfa</a></h1> </center> 
	</form> 
	</div>  
</body> 
</html>