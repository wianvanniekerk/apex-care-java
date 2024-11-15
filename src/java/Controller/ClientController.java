package Controller;

import Model.Base;
import Model.Client;
import Services.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
@WebServlet("/Client")
public class ClientController extends HttpServlet {
    
    ConnectionProvider connectionProvider;
    public static StringBuilder err = new StringBuilder();
    public static StringBuilder success = new StringBuilder();
     
    public ClientController() {
        this.connectionProvider = new ConnectionProvider();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        boolean isKeyClient = req.getParameter("isKeyClient") != null ? Boolean.TRUE : Boolean.FALSE;
        String clientIndex = req.getParameter("clientIndexPost");
        
        int index = Integer.parseInt(clientIndex)+1;

        Object[] newDetails = {name, email, phone, password, address, isKeyClient, index};
        
        if (name.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty() || address.isEmpty())
        {
            err.append("All fields must be filled in.");
        } else
        {
            success.append("Client details updated successfully.");
        }
        
        if (err.length() <= 0)
        {
            editClient(newDetails);
        }
        
        resp.sendRedirect("clients.jsp");
    }
    
    
    
    public ArrayList<ArrayList<Base>> getAllClients()
    {
        ArrayList<ArrayList<Base>> clients = new ArrayList<>();
        String[] columns = {"Name", "Email", "Phone", "Password", "Address", "IsKeyClient"};
        
        try {
            clients = connectionProvider.executeQuery("SELECT * FROM Client ORDER BY ClientID ASC", columns);
        } catch (Exception e)
        {
            e.printStackTrace();
        } finally {
            connectionProvider.closeConnection();
        }
        
        return clients;
    }
    
    public void editClient(Object[] newDetails)    
    {
        String[] columns = {"Name", "Email", "Phone", "Password", "Address", "IsKeyClient", "ClientID"};
        
        try {
            connectionProvider.executeQuery("UPDATE Client SET Name = ?, Email = ?, Phone = ?, Password = ?, Address = ?, IsKeyClient = ? WHERE ClientID = ?", columns, newDetails);
        } catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("clients.jsp");
    }
}