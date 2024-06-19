/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Mhyls
 */
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class AppConfig {
    private static final String CONFIG_FILE = "config.properties";
    private static Properties configProperties = new Properties();

    static {
        loadConfig();
    }

    private static void loadConfig() {
        try (InputStream inputStream = AppConfig.class.getClassLoader().getResourceAsStream(CONFIG_FILE)) {
            if (inputStream != null) {
                configProperties.load(inputStream);
            } else {
                throw new IOException("Config file '" + CONFIG_FILE + "' not found in the classpath.");
            }
        } catch (IOException e) {
            e.printStackTrace();
            // Handle error loading config file as needed
        }
    }

    public static String getProperty(String key) {
        return configProperties.getProperty(key);
    }

}
