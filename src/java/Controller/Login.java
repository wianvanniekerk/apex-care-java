package Controller;

import Services.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Arrays;
/**
 *
 * @author Wian van Niekerk
 */
@WebServlet("/Login")
public class Login extends HttpServlet{
    ConnectionProvider connectionProvider;
    
    private static HttpSession session;
    public static StringBuilder err = new StringBuilder();
        
    public Login() {
        this.connectionProvider = new ConnectionProvider();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        
        try {                        
            if (email.isEmpty() || password.isEmpty())
            {
                err.append("Email and Password must both be filled in");
            } else if (!getUser(email, password))
            {
                err.append("Email or password incorrect");
            } 
            
            if (err.length() > 0)
            {
                resp.sendRedirect("login.jsp");                
            } else {
                session = req.getSession();
                session.setAttribute("loggedIn", true);
                
                resp.sendRedirect("index.jsp");                
            }
            
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }
    
    public boolean getUser(String email, String password)
    {
        List<String> user = new LinkedList<>();
        
        String login = email + password;
        
        try {
            user = connectionProvider.executeQuery("SELECT * FROM SysUser", "Email", "Password");
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally {
            connectionProvider.closeConnection();
        }
        
        StringBuilder cred = new StringBuilder();
        for (Iterator iterator = user.iterator(); iterator.hasNext();) {
            cred.append(iterator.next());            
        }
        
        if (cred.toString().equals(login)) {
            return true;
        }
                
        return false;
    }
    
    public static void logout()
    {
        session = null;
    }
}
