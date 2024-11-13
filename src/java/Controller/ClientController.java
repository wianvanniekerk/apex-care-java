package Controller;

import Model.Base;
import Model.Client;
import Services.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Wian van Niekerk
 */
public class ClientController extends HttpServlet {
    
    ConnectionProvider connectionProvider;
     
    public ClientController() {
        this.connectionProvider = new ConnectionProvider();
    }
    
    public ArrayList<ArrayList<Base>> getAllClients()
    {
        ArrayList<ArrayList<Base>> clients = new ArrayList<>();
        String[] columns = {"Name", "Email"};
        
        try {
            clients = connectionProvider.executeQuery("SELECT * FROM Client", columns);
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally {
            connectionProvider.closeConnection();
        }
        
        return clients;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("clients.jsp");
    }
}