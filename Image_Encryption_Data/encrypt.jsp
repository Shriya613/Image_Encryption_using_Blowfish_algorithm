<%@ include file="oheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,cryptography.*"%>
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
<%! int rno=0;
String s=null,unm;StringBuffer filedata=null;

byte[] data;
%>
<%

 unm=(String)session.getAttribute("unm");
	 String fid=request.getParameter("fid");
	 String fnm=request.getParameter("fname");
	 String symkey=request.getParameter("key");
	 session.setAttribute("symkey",symkey);


	 

 Connection con1=databasecon.getconnection();
 Statement st=con1.createStatement();
 ResultSet r=st.executeQuery("select  *from temp ");
if(r.next())
	{

 byte[] encryptedImage = BlowFish.encrypt(symkey.getBytes(), r.getBytes(2));



 PreparedStatement p=con1.prepareStatement("insert into cloud(fid,filenm,enc_image,enckey,owner) values(?,?,?,?,'"+unm+"')");
p.setInt(1,Integer.parseInt(fid));
p.setString(2,fnm);
p.setBytes(3,encryptedImage);
p.setString(4,symkey);

p.executeUpdate();
	
}

 %>

<% 
	
Connection con=databasecon.getconnection();
Statement st11=con.createStatement();
Statement st1=con.createStatement();

ResultSet r1=st11.executeQuery("select enc_image from cloud where fid="+fid+" ");
if(r1.next())
	{
data=r1.getBytes(1);
	}
%>

<br>
	<section id="contact" class="contact">
        <div class="container">
            <br>
			 <h2>File Sharing</h2>
			 <br>
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="share.jsp" id="contactForm" >
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">

							 <div class="form-group">
							 <label>File Id</label>
                                    <input type="text" class="form-control"   required name="fid"  value=<%=fid%> >
									         
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
								<label>File Name</label>
                                    <input type="text" class="form-control"  required name="fname" value="<%=fnm%>" >
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
									<label>Encrypted ImageData</label>
								<textarea  placeholder=" " class="form-control"name="file"  required		type="text" cols="60"
										rows="5" required=""><%=new String(data)%></textarea>
                                    
                                    <p class="help-block text-danger"></p>
                                </div>


                                 <div class="form-group">
                                <label>Select User</label>
                                   
  <%

Statement st2 = con.createStatement();

String sss1 = "select *from users";%>


<select name="ruid" class="form-control" required multiple>
    <option value="">Select  User Id</option>
    <%ResultSet rs2=st2.executeQuery(sss1);
    while(rs2.next())
    {%> 
    <option value=<%=rs2.getString("uid")%>><%=rs2.getString("uid")%></option>
    <%}%>

</select>


                                    <p class="help-block text-danger"></p>
                                </div>
									
								
							
								<div class="form-group">
                                     <button type="submit" class="btn btn-primary">Upload  </button>

                                </div>
								
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </section>
		
		<br>
	<%@ include file="footer.jsp"%>	