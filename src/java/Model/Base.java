package Model;

/**
 *
 * @author Wian van Niekererk
 */
public class Base { 
    protected String value;
    
    public Base() {}
    
    public Base(String test) 
    {
        this.value = test;
    }
    
    @Override
    public String toString() {
        return value != null ? value : "";
    }
}
