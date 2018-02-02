package code.ygl;
import com.github.lalyos.jfiglet.FigletFont;
import java.io.*;
/**
 * Hello Travis!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        String name = "Travis";
        if (args.length > 0) {
            name = args[0];
        }
        try {
            String greeting = FigletFont.convertOneLine("Hello "+name+"!");
            System.out.println( greeting );
        }
        catch(IOException e) {
            System.out.println(e);
        }
    }
}
