<%@ include file="oheader.jsp"%>
<%@ page import="java.io.*"%>
<%@ page import="databaseconnection.*,CT.*"%>
<%@ page import="java.sql.*"%>

<div class="page-header">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><center>Upload Image File</center></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%!String  thisLine = null;
StringBuffer sb1=null;
String filename=null,unm=null,fid=null,fnm=null;
int i=0;
%>
 <% 
	
session.setAttribute("data",sb1);

try{
	 unm=(String)session.getAttribute("unm");
Connection con=databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();
ResultSet r=st.executeQuery("select max(fid) from cloud");
if(r.next())
	{

 i=r.getInt(1);
 System.out.println("i="+i);
if(i>=0)
	{
i++;
	}
}


ResultSet r1=st1.executeQuery("select  *from temp ");
if(r1.next())
	{


%>

<br>
<section id="contact" class="contact">
        <div class="container">
            <br>
			 <h2>File Sharing</h2>
			 <br>
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="getSymkey.jsp" id="contactForm" >
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">

							 <div class="form-group">
							 <label>File Id</label>
                                    <input type="text" class="form-control"   required name="fid"  value=<%=i%> >
									         
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
								<label>File Name</label>
                                    <input type="text" class="form-control"  required name="fname" value="<%=r1.getString(1)%>" >
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
									<label>Image Data</label>
								<textarea  placeholder=" " class="form-control"name="file"  required		type="text" cols="60"
										rows="5" required=""><%=new String(r1.getBytes(2))%></textarea>
                                    
                                    <p class="help-block text-danger"></p>
                                </div>
    
							<div>
								<label>SymmetricKey</label>
                                    <input type="text" class="form-control"   name="key" >
                                    <p class="help-block text-danger"></p>
                                </div>
								<div class="form-group">
                                     <button type="submit" class="btn btn-primary">GetKey  </button>

                                </div>
								
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </section>


              <%
			  
	}
			  
			  }catch(Exception e11)
{
e11.printStackTrace();
}
%>        
                      
						

		
		
	<%@ include file="footer.jsp"%>
	