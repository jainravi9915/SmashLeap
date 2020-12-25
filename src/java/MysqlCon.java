
import java.sql.*;

public class MysqlCon {

    public static void main(String args[]) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mydb", "root", "root");
            //here sonoo is database name, root is username and password
            System.out.println("HELLO Connected ");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from emp ");
            while (rs.next()) {
                System.out.println(rs.getString(1));
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
