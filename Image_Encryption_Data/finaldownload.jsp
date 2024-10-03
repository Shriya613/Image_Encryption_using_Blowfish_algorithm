<%@page import="java.io.*,java.net.*,java.sql.*"%>
<%@ page import="databaseconnection.*,cryptography.*"%>
<%! byte[] data;%>
<%!
public static String getMimeType(String fileUrl)
    throws java.io.IOException, MalformedURLException 
  {
    String type = null;
    URL u = new URL(fileUrl);
    URLConnection uc = null;
    uc = u.openConnection();
    type = uc.getContentType();
    return type;
  }

%>

<%!String  thisLine = null;
StringBuffer sb1=null;
String file=null,unm=null,fid=null,fnm=null,pkey=null;
int i=0;
byte encimg[]=null,key[]=null;
byte[] decryptedImage;
%>
 <%
    
		
		    String fid=request.getParameter("fid");
			
			System.out.print("fid="+fid);

Connection con=databasecon.getconnection();

Statement st11=con.createStatement();

ResultSet r1=st11.executeQuery("select enckey,enc_image,filenm from cloud where fid="+fid+" ");
if(r1.next())
    {

key=r1.getBytes(1);

encimg=r1.getBytes(2);

file=r1.getString(3);

 decryptedImage = BlowFish.decrypt(key,encimg);



 String type=getMimeType("file:"+file);

    response.setContentType (type);
    
    response.setHeader ("Content-Disposition", "attachment;     filename=\""+file+"\"");

   
        ServletOutputStream outs = response.getOutputStream();
        
        


       
            try {
                        outs.write(decryptedImage);
                    
                        } catch (IOException ioe) {
                        ioe.printStackTrace(System.out);
                    }
                        outs.flush();
                    outs.close();


    }



			
    
                   
        %>