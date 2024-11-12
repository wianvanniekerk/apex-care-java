package Model;

/**
 *
 * @author Wian van Niekerk
 */
public class Client {
    private String name;
    private String email;
    private String phone;
    private String password;
    private String address;
    private boolean isKeyClient;
    
    public Client(){}
    
    public Client(String name, String email, String phone, String password, String address, boolean isKeyClient)
    {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.address = address;
        this.isKeyClient = isKeyClient;
    }
    
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public String getPassword() { return password; }
    public String getAddress() { return address; }
    public boolean isKeyClient() { return isKeyClient; }
    
    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setPhone(String phone) { this.phone = phone; }
    public void setPassword(String password) { this.password = password; }
    public void setAddress(String address) { this.address = address; }
    public void setIsKeyClient(boolean isKeyClient) { this.isKeyClient = isKeyClient; }
}
