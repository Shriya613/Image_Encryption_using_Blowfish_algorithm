<%String title="Data Owner Page";%>
<%@ include file="header.jsp"%>


   <%
                                                       String msg=request.getParameter("msg");
                                                       if(msg!=null )
                                                       {
                                                               out.println("<script>alert('User ID already available..!')</script>");

                                                       }

                                                       
%>

<div class="page-header">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1><center>Data Owner</center></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>


											    <section id="contact" class="contact">
        <div class="container">
            <br>
			 <h2>Registration</h2>
			 <br>
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="ownerreg2.jsp" id="contactForm" >
                        <div class="row">
                            <div class="col-md-6 wow fadeInLeft" data-wow-duration="2s" data-wow-delay="600ms">

							 <div class="form-group">
                                    <input type="text" class="form-control"  placeholder="Name" required name="name">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control"  placeholder="User ID " required name="uid">
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" name="pwd" placeholder="Password " required >
                                    <p class="help-block text-danger"></p>
                                </div>
                              <div class="form-group">
                                    <input type="email" class="form-control" name="email" placeholder="Email" required >
                                    <p class="help-block text-danger"></p>
                                </div>
								<div class="form-group">
                                    <input type='text' pattern="[0-9]{10,10}" class="form-control" name="mno" placeholder="Mobile No." required >
                                    <p class="help-block text-danger"></p>
                                </div>
								<div class="form-group">
                                     <button type="submit" class="btn btn-primary">SignUp  </button>

                                </div>
								
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
    </section>



<%@ include file="footer.jsp"%>