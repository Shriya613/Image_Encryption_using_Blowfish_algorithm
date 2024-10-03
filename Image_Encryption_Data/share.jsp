<%@ include file="oheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<div class="page-header">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><center>Image Encryption</center></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<%
 Connection con1=databasecon.getconnection();
 
	 String fid=request.getParameter("fid");
	 

  String[] values=request.getParameterValues("ruid");
         
        for(int i=0;i<values.length;i++)
       {
          
 PreparedStatement p=con1.prepareStatement("insert into access_list values('"+fid+"','"+values[i]+"')");
p.executeUpdate();
        
       }
	 

response.sendRedirect("upload.jsp?msg=shared" );



%>