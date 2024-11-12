package Services;

import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author Wian van Niekerk
 */
public class ConfigLoader {
    private static Properties properties;
    
    static {
        try {
            properties = new Properties();
            InputStream input = ConfigLoader.class.getClassLoader()
                .getResourceAsStream("./Resources/config.properties");
            if (input == null) {
                throw new RuntimeException("Cannot find config.properties");
            }
            properties.load(input);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
}
