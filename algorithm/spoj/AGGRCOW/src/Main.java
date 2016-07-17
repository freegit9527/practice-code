import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Scanner;

import static java.util.Arrays.sort;

public class Main {

    static int[] x;
    static int t, N, C;

    public static void main(String[] args) throws FileNotFoundException {
        Scanner cin;

//        FileInputStream fin;
//        fin = new FileInputStream("/Users/liu/Hack/algorithm/spoj/AGGRCOW/src/input.txt");
//        cin = new Scanner(fin);

        cin = new Scanner(System.in);
        t = cin.nextInt();

        while (t-- != 0) {
            N = cin.nextInt();
            C = cin.nextInt();
            x = new int[N];

            for (int i = 0; i < N; ++i) {
                x[i] = cin.nextInt();
            }
            sort(x);

            int ansLow, ansUp, curAns, mid;

            ansLow = 1;
            ansUp = x[N-1] - x[0];
            curAns = 1;

            while (ansLow <= ansUp) {
//                mid = ansLow + (ansUp - ansLow) / 2;
                mid = (ansUp + ansLow) / 2;
                if (isValid(mid)) {
                    if (curAns < mid) {
                        curAns = mid;
                    }
                    ansLow = mid + 1;
                } else {
                    ansUp = mid - 1;
                }
            }
            System.out.println(curAns);
        }
    }

    public static boolean isValid(int distance) {
        int cnt = 1, i = 1;
        int cur = x[0];

        while (cnt < C && i < N) {
            if (x[i] - cur < distance) {
                ++i;
            } else {
                cur = x[i];
                ++cnt;
                ++i;
            }
        }

        if (cnt == C) {
            return true;
        }
        return false;
    }
}
