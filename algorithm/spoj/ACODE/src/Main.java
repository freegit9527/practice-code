import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.math.BigInteger;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws FileNotFoundException {
        String str;
        Scanner cin;

//        FileInputStream fin;
//        fin = new FileInputStream("/Users/liu/Hack/algorithm/spoj/ACODE/src/output.txt");
//        cin = new Scanner(fin);

        cin = new Scanner(System.in);
        while (cin.hasNext()) {
            str = cin.nextLine();
//            System.out.println("str = " + str);

            if ('0' == str.charAt(0)) {
                break;
            }

            int num[];

            num = new int[str.length() + 1];
            for (int i = 0; i < str.length(); ++i) {
                num[i + 1] = str.charAt(i) - '0';
            }

//            print test
//            for (int i = 1; i <= str.length(); ++i) {
//                System.out.print(" " + num[i]);
//            }
//            System.out.println();

            long a[];
            long ans;
            boolean mark;

            a = new long[str.length() + 1];
            a[0] = 1;
            a[1] = 1;
            mark = true;

            for (int i = 2; i <= str.length(); ++i) {
                int tmp = num[i - 1] * 10 + num[i];

                if (num[i] == 0) {
                    if (num[i - 1] == 0) {
                        mark = false;
                        ans = 0;
                        break;
                    }
                    a[i] = a[i - 2];
                }
                else {
                    if (num[i - 1] == 0) {
                        a[i] = a[i - 1];
                    }
                    else {
                        if (tmp <= 26) {
                            a[i] = a[i - 1] + a[i - 2];
                        } else {
                            a[i] = a[i - 1];
                        }
                    }
                }
            }

            if (mark)  {
                ans = a[str.length()];
            }
//            print test
            for (int i = 1; i <= str.length(); ++i) {
//                System.out.print(" " + a[i]);
            }
//            System.out.println();

            System.out.println(a[str.length()]);
        }
    }
}
