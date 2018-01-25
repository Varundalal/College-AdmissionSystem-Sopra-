<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 

        <%
            System.out.println("here");
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            String userid = session.getAttribute("userid").toString();

            System.out.println("here" + userid);
            String fname = "";

            int i = 0;
String college_id=null;
            String content_type = "";


            String context = config.getServletContext().getRealPath("/");
            String imagePath = context + "UploadedDocuments";
            boolean status = false;
            String stream_id = "",tenth=null,twelveth=null,txtcategory=null;
            String pname = null;
            String pname1 = null;
            String fullfilename = null;
            java.util.Date d = new java.util.Date();
            long timestamp = d.getTime();
            try {
                File projectDir = new File("imagePath");
                if (!projectDir.exists()) {
                    projectDir.mkdirs();

                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    List/*FileItem*/ items = upload.parseRequest(request);
                    Iterator iter = items.iterator();
                    while (iter.hasNext()) {
                        FileItem item = (FileItem) iter.next();
                        if (item.isFormField()) {
                            String name = item.getFieldName();
                            String value = item.getString();
                            if (name.equalsIgnoreCase("college_id")) {
                                college_id = value;
                            }
                            if (name.equalsIgnoreCase("stream_id")) {
                                stream_id = value;
                            }
                            if (name.equalsIgnoreCase("tenth")) {
                                tenth = value;
                            }
                            if (name.equalsIgnoreCase("twelveth")) {
                                twelveth = value;
                            }
                            if (name.equalsIgnoreCase("txtcategory")) {
                                txtcategory = value;
                            }



                            System.out.println("Parameters " + item.getFieldName() + " value " + item.getString());

                        } else {
                            fullfilename = "doc" + "_" + timestamp;
                            System.out.println("fullfilename : " + fullfilename);
                            if (item.getFieldName().equalsIgnoreCase("txtfile")) {
                                content_type = item.getContentType();
                                String filename = item.getName();

                                if (!filename.equalsIgnoreCase("")) {
                                    pname = filename.substring(filename.lastIndexOf("."), filename.length());
                                    fname = fullfilename + pname;
                                    System.out.println("file name:" + fname);
                                    pname1 = imagePath + File.separator + fullfilename + pname;

                                    File file3 = new File(pname1);


                                    try {
                                        item.write(file3);
                                        status = true;
                                    } catch (Exception e1) {
                                        e1.printStackTrace();
                                        status = false;
                                    }
                                }
                            }
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    status = false;
                }
            }
            String msg = null;
            if (status == true) {
                try {


               i=DB.Connect.saveApplication(college_id, stream_id, userid, tenth, twelveth, fullfilename, content_type,txtcategory);

                } catch (Exception e) {
                    e.printStackTrace();
                   
                }

                if (i == 0) {
                    File f = new File(imagePath + fname);
                    if (f.exists()) {

                        if (f.delete()) {
                            System.out.print("file deleted");
                        }
                    }

                    msg = "Failed to Apply";

                    session.setAttribute("msg", msg);
                    response.sendRedirect("apply_on_streams.jsp?cid="+college_id+"&streams="+stream_id+"");

                } else if (i == 1) {

                    msg = "Applied successfully";

                    session.setAttribute("msg", msg);
                   response.sendRedirect("apply_on_streams.jsp?cid="+college_id+"&streams="+stream_id+"");

                } else if (i == 2) {
                    String path=imagePath+"\\" + fname;
                     System.out.print(path);
                    File f = new File(path);
                    if (f.exists()) {
                        System.out.print("file exists");
                        if (f.delete()) {
                            System.out.print("file deleted");
                        }
                    }
                    msg = "You have Already Applied";

                    session.setAttribute("msg", msg);
                   response.sendRedirect("apply_on_streams.jsp?cid="+college_id+"&streams="+stream_id+"");

                } else {
                    msg = "Failed to Apply";

                    session.setAttribute("msg", msg);
                      response.sendRedirect("apply_on_streams.jsp?cid="+college_id+"&streams="+stream_id+"");

                }
            }

%>
  