package Services;
import Model.Base;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author Wian van Niekerk
 */
public class ConnectionProvider {
    private static final String USERNAME = ConfigLoader.getProperty("db.username");
    private static final String PASSWORD = ConfigLoader.getProperty("db.password");
    private static final String CON_URL = ConfigLoader.getProperty("db.url");
    private static final String DRIVER = ConfigLoader.getProperty("db.driver");
    
    Connection con;
    
    public void connect() throws ClassNotFoundException, SQLException
    {
        if (con == null || con.isClosed())
        {
            try {
                Class.forName(DRIVER);
                
                this.con = DriverManager.getConnection(CON_URL, USERNAME, PASSWORD);
                
                if (this.con != null) {
                    System.out.println("Connected to the database");
                }
            } catch (SQLException ex) {
                System.out.println("Could not connect to the database: " + ex.getMessage());
                throw ex;
            }
        }
    }
    
    public void closeConnection() {
        if (con != null) {
            try {
                con.close();
                System.out.println("Database connection closed");
            } catch (SQLException e) {
                System.out.println("Error closing connection: " + e.getMessage());
            }
        }
    }
    
    public ArrayList<ArrayList<Base>> executeQuery(String query, String[] colNames, Object... params)
    {
        ArrayList<ArrayList<Base>> res = new ArrayList<>();

        try {
            connect();

            PreparedStatement pstmt = con.prepareStatement(query);

            for (int i = 0; i < params.length; i++) {
                if (params[i] instanceof String) {
                    pstmt.setString(i + 1, (String) params[i]);
                } else if (params[i] instanceof Integer) {
                    pstmt.setInt(i + 1, (Integer) params[i]);
                } else if (params[i] instanceof Boolean) {
                    pstmt.setBoolean(i + 1, (Boolean) params[i]);
                }
            }

            if (query.trim().toUpperCase().startsWith("SELECT")) {
                try (ResultSet result = pstmt.executeQuery()) {
                    while (result.next()) {
                        ArrayList<Base> rowData = new ArrayList<>();
                        for (String col : colNames) {
                            String value = result.getString(col);
                            rowData.add(new Base(value));
                        }                    
                        res.add(rowData);
                    }
                }
            } else {
                pstmt.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }
}
