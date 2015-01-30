import com.horstmann.corejava.Employee;
import static java.lang.System.*;
/**
 * Created by aries on 1/30/15.
 */
public class PackageTest {
    public static void main(String[] args)
    {
        Employee harry = new Employee("snow sun", 50000, 1992, 11, 21);
        harry.raiseSalary(20);

        out.println("name = " + harry.getName() + ", salary = " + harry.getSalary());
    }
}
