<%@ include file="uheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*"%>
<%@ page import="java.sql.*"%>
<%! int rno=0;
String s=null;StringBuffer filedata=null;%>

<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte data[]=null;
%>
<% unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");

	
Connection con=databasecon.getconnection();
Statement st11=con.createStatement();
Statement st1=con.createStatement();

ResultSet r1=st11.executeQuery("select *from cloud where fid="+fid+" ");
if(r1.next())
	{
%>
<div class="page-header">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><center>Image File Downloading</center></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<section id="contact" class="contact">
        <div class="container">
            <br>
			
		
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="decryption.jsp" id="contactForm" >
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">

							 <div class="form-group">
							 <label>File Id</label>
                                    <input type="text" class="form-control"   required name="fid"  value=<%=r1.getString(1)%> >
									         
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
								<label>File Name</label>
                                    <input type="text" class="form-control"  required name="fname" value="<%=r1.getString(2)%>" >
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
									<label>EncryptedImage</label>
								<textarea  placeholder=" " class="form-control"name="file"  required		type="text" cols="60"
										rows="5" required=""><%=new String(r1.getBytes(3))%></textarea>
                                    
                                    <p class="help-block text-danger"></p>
                                </div>
									
								
							
								<div class="form-group">
                                     <button type="submit" class="btn btn-primary">DecryptImage</button>

                                </div>
								
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        	<%}%>
    </section>
	
		<br>
	<%@ include file="footer.jsp"%>	