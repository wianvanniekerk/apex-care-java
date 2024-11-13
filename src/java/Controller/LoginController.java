package Controller;

import Model.Base;
import Model.User;
import Services.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
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
public class LoginController extends HttpServlet{
    ConnectionProvider connectionProvider;
    
    private static HttpSession session;
    public static StringBuilder err = new StringBuilder();
        
    public LoginController() {
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
        ArrayList<ArrayList<Base>> user = new ArrayList<>();
        String login = "[" + email + ", " + password + "]";
        System.out.println(login);
        try {
            user = connectionProvider.executeQuery("SELECT * FROM SysUser", "Email", "Password");
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally {
            connectionProvider.closeConnection();
        }
        
        for (int i = 0; i < user.size(); i++) {
            ArrayList<Base> userCredentials = user.get(i);
            System.out.println(userCredentials.toString());

            if (userCredentials.toString().equals(login)) {
                return true;
            }
        }             
        return false;
    }
    
    public static void logout(HttpSession currentSession)
    {
        if (currentSession != null) {
            currentSession.setAttribute("loggedIn", false);
            currentSession.invalidate();
        }    
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.jsp");
    }       
}
