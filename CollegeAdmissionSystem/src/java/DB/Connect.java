package DB;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import com.sun.accessibility.internal.resources.accessibility_pt_BR;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class Connect {

    public static Connection conn = null;
    public static Statement stat,stat1,stat2,stat2999 = null;
    public static ResultSet rs1;
    static PreparedStatement ps = null;
    public static ResultSet rs = null;
    static String rdate = "";
    static String rtime = "";

    public static Connection openConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/college_admission?user='root'&password=");

            stat = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stat1 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stat2 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            stat2999 = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            System.out.println("Connection done");
            rdate = getDate();
            rtime = getTime();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return conn;
    }

    public static boolean validateLogin(String username, String password) {
        System.out.println(username + ":" + password);
        boolean b = false;
        try {
            if (!(username.isEmpty() || password.isEmpty())) {
                openConnection();
                String sql = "select * from tbluser where (emailid='" + username + "') && (password='" + password + "')";
                System.out.println();
                rs = stat.executeQuery(sql);
                if (rs.next()) {
                    b = true;
                    System.out.println("user validated");
                }
                closeConnection();
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        System.out.println("user validated" + b);

        return b;
    }

    public static void closeConnection() {
        try {
            stat.close();
            stat1.close();
            stat2.close();
            conn.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public static String getField(String tblname, String field, String matching_field, String value, String operator) {
       
        String i = "";
        try {
            rs = stat2999.executeQuery("select " + field + " from " + tblname + " where " + matching_field + "" + operator + "'" + value + "'");
            if (rs.next()) {
                i = rs.getString(1);
            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
      
        return i;
    }
    public static String getValue(String sql) {

        String i = "null";
        try {
            rs = stat.executeQuery(sql);
            if (rs.next()) {
                i = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }

    public static String getUserPassword(String id) {
        openConnection();
        String i = "";
        try {
            rs = stat.executeQuery("select password from tbluser where userid='" + id + "'");
            if (rs.next()) {
                i = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
        return i;
    }

    public static void changePass(String id, String pass) {

        conn = openConnection();
        try {
            String sql = "update tbluser set password='" + pass + "' where userid='" + id + "' ";
            ps = conn.prepareStatement(sql);//to update
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
    }

    public static int updateField(String tblname, String field, String value, String matching_field, String matching_value) {
        int i = 0;
        conn = openConnection();
        try {
            String sql = "update " + tblname + " set " + field + "='" + value + "' where " + matching_field + "='" + matching_value + "' ";
            System.out.print("sql=" + sql);
            ps = conn.prepareStatement(sql);//to update
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
        return i;
    }

    public static int changeImage(String id, InputStream is) {

        conn = openConnection();
        int i = 0;
        try {
            String sql = "update tbluser set image=? where userid='" + id + "' ";
            ps = conn.prepareStatement(sql);//to update
            ps.setBlob(1, is);
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
        return i;
    }

    public static int saveUsers(String fname, String lname, String email,
            String address, String status, String usertype, String password, String mobile,String gender,String txtdob) {
        openConnection();
        int i = 0;
        try {
            String sql = "insert into tbluser (fname,lname,password,mobile,emailid,address,rdate,status,usertype,gender,dob)values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, fname);
            statement.setString(2, lname);
            
            statement.setString(3, password);
          
            statement.setString(4, mobile);
            statement.setString(5, email);
            statement.setString(6, address);
            statement.setString(7, rdate);
            statement.setString(8, status);
            statement.setString(9, usertype);
            statement.setString(10, gender);
            statement.setString(11, txtdob);

            i = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeConnection();
        return i;
    }
    public static int saveStudent(String fname, String lname, String email,
            String address, String status, String usertype, String password, String mobile,String gender,String txtdob) {
       
        int i = 0;
        try {
            String sql = "insert into tbluser (fname,lname,password,mobile,emailid,address,rdate,status,usertype,gender,dob)values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, fname);
            statement.setString(2, lname);

            statement.setString(3, password);

            statement.setString(4, mobile);
            statement.setString(5, email);
            statement.setString(6, address);
            statement.setString(7, rdate);
            statement.setString(8, status);
            statement.setString(9, usertype);
            statement.setString(10, gender);
            statement.setString(11, txtdob);

            i = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return i;
    }
    public static int saveCollege(String college_name, String description, String address,
            String eligibility) {
openConnection();
        int i = 0;
        try {
            String sql = "insert into tblcollege_details (college_name,description,address,eligibility)values(?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, college_name);
            statement.setString(2, description);

            statement.setString(3, address);

            statement.setString(4, eligibility);

            i = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
closeConnection();
        return i;
    }
  
    public static int saveStream(String college_id, String streams, String seats
            ) {
openConnection();
        int i = 0;
        try {
            String sql = "insert into tblstreams (college_id,streams,seats)values(?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, college_id);
            statement.setString(2, streams);
            statement.setString(3, seats);

            i = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
closeConnection();
        return i;
    }
    public static int saveFaq(String userid, String question
            ) {
openConnection();
        int i = 0;
        try {
            String sql = "insert into tblfaq (question,answer,userid,rdate)values(?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, question);
            statement.setString(2, "");
            statement.setString(3, userid);
            statement.setString(4, getDate());

            i = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
closeConnection();
        return i;
    }
    public static int saveApplication(String college_id, String stream_id, String userid,String tenth,String twelveth,String filename,String content_type,String category
            ) {
openConnection();
        int i = 0;
        try {
            String sql = "insert into admission_form (college_id,stream_id,userid,tenth,twelveth,filename,content_type,status,rdate,category)values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, college_id);
            statement.setString(2, stream_id);
            statement.setString(3, userid);
            statement.setString(4, tenth);
            statement.setString(5, twelveth);
            statement.setString(6, filename);
            statement.setString(7, content_type);
            statement.setString(8, "Pending");
            statement.setString(9, getDate());
            statement.setString(10, category);

            i = statement.executeUpdate();
        } catch (Exception e) {
            System.out.print("msg"+e.getMessage());
                    if(e.getMessage().contains("Duplicate entry")){
                    i=2;
                    }
        }
closeConnection();
        return i;
    }

   
   

   
    public static String getDateTime() {
        DateFormat dateFormat = new SimpleDateFormat(
                "yyyy-MM-dd hh:mm:ss");

        Calendar cal = Calendar.getInstance();

        return dateFormat.format(cal.getTime());// "11/03/14 12:33:43";
    }

    public static String getDate() {
        DateFormat dateFormat = new SimpleDateFormat(
                "yyyy/MM/dd");

        Calendar cal = Calendar.getInstance();

        return dateFormat.format(cal.getTime());// "11/03/14 12:33:43";
    }

    public static String getTime() {
        DateFormat dateFormat1 = new SimpleDateFormat(
                "HH:mm:ss");

        Calendar cal = Calendar.getInstance();

        return dateFormat1.format(cal.getTime());// "11/03/14 12:33:43";
    }
}
