<%@ page import="java.sql.*" %>   
<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/okul","root","root"); 
 	if(request.getParameter("btn_kaydet")!=null)  
	{
		String isim,departman; 
		isim = request.getParameter("txt_isim");  
		departman = request.getParameter("txt_departman");   
		PreparedStatement pstmt=null; 
		pstmt=con.prepareStatement("insert into kisiler (isim,departman) values(?,?)");  
		pstmt.setString(1,isim); 
		pstmt.setString(2,departman);	
		pstmt.executeUpdate();  
		con.close();  
		out.println("Kayit basariyla tamamlandi.");
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
			<center> <h1>Kayit Ekle Ekrani</h1> 
			<table>	  
				<tr>
					<td>Isim</td>
					<td><input type="text" name="txt_isim"></td>
				</tr> 
				<tr>
					<td>Departman</td>
					<td><input type="text" name="txt_departman"></td>
				</tr>	 
				<tr>
					<td><input type="submit" name="btn_kaydet" value="Kaydet"></td>	
				</tr> 
			</table> 
				<center>
					<h1><a href="index.jsp">Ana Sayfa</a></h1>
				</center> 
                        </center> 
		</form>  </div>  
</body> 
</html> 