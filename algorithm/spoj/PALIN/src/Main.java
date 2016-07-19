import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws FileNotFoundException {
        Scanner cin;

//        FileInputStream fin;
//        fin = new FileInputStream("/Users/liu/Hack/algorithm/spoj/PALIN/src/input.txt");
//        cin = new Scanner(fin);

        cin = new Scanner(System.in);

        int t;
        t = cin.nextInt();
        cin.nextLine();

        while (t-- != 0) {
            String str;

            str = cin.nextLine();

//            System.out.println("str = " + str);
            int len = str.length();

            char[] cstr;

            cstr = new char[len + 10];
            for (int ii = 0; ii < len; ++ii) {
                cstr[ii + 1] = str.charAt(ii);
            }

//            equal     0
//            bigger    1
//            smaller   -1
            int compare = 0;
            int mid, left, right;
            boolean evenp;

//            even
//            1 2 3 4

//            odd
//            1 2 3 4 5

            if (len % 2 == 0) {
//                even
                mid = len / 2;
                left = mid;
                right = mid + 1;
                evenp = true;
            } else {
                mid = len / 2 + 1;
                left = mid - 1;
                right = mid + 1;
                evenp = false;
            }

            int i = left, j = right;

            while (i >= 1 && j <= len) {

                if (cstr[i] < cstr[j]) {
                    compare = -1;
                    break;
                } else if (cstr[i] > cstr[j]) {
                    compare = 1;
                    break;
                } else {
                    compare = 0;
                    i--;
                    j++;
                }
            }

            if (compare == 1) {
//                System.out.println("bigger");
                for (i = left, j = right; i >= 1 && j <= len; --i, ++j) {
                    cstr[j] = cstr[i];
                }
            }
            else {
//                System.out.println("smaller"); or equal
                if (cstr[mid] != '9') {
                    cstr[mid]++;
                    for (i = left, j = right; i >= 1 && j <= len; --i, ++j) {
                        cstr[j] = cstr[i];
                    }
                }
                else {
                    i = left;
                    while (i >= 1 && cstr[i] == '9') {
                        --i;
                    }
                    if (i >= 1) {
                        cstr[i]++;
                        ++i;
                        while (i <= mid) {
                            cstr[i] = '0';
                            ++i;
                        }
                        for (i = left, j = right; i >= 1 && j <= len; --i, ++j) {
                            cstr[j] = cstr[i];
                        }
                    }
                    else {
                        int numZeros = len - 1;
                        cstr[1] = '1';
                        for (i = 2; i <= len; ++i) {
                            cstr[i] = '0';
                        }
                        ++len;
                        cstr[len] = '1';
                    }
                }

            }

            for (i = 1; i <= len; ++i) {
                System.out.print(cstr[i]);
            }
            System.out.println();
        }
    }
}
