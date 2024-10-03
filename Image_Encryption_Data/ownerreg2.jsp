<%@ page  import="java.sql.*" import="databaseconnection.*" %>
<%@ page import="java.sql.*"%>



<%! String name, gen,addr, city, street, zip, tele, email, uid, pwd,ph,un;
	int i=0;
%>
<%

name=request.getParameter("name");
uid=request.getParameter("uid");
pwd=request.getParameter("pwd");
email=request.getParameter("email");
ph=request.getParameter("mno");


System.out.println(pwd);
%>



<%
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();

Statement st2=con.createStatement();

ResultSet rst=st2.executeQuery("select *from owner where uid='"+uid+"' ");

if(rst.next()){
	
response.sendRedirect("ownerreg.jsp?msg=duplicate");
}
else{
int q= st.executeUpdate("insert into owner values('"+name+"','"+uid+"','"+pwd+"','"+email+"','"+ph+"')");

if(q>0)
{
response.sendRedirect("owner.jsp?id=succ" );

}
}

}
catch(Exception e)
{
e.printStackTrace();
	}
%>

