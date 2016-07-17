import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class Main {
    static int[] fen;

    public static void main(String[] args) throws FileNotFoundException {
        int t;
        Scanner cin;

//        FileInputStream fin;
//        fin = new FileInputStream("/Users/liu/Hack/algorithm/spoj/INVCNT/src/input.txt");

//        cin = new Scanner(fin);
        cin = new Scanner(System.in);

        t = cin.nextInt();

        while (t-- != 0) {
            int n;
            Point[] a;

            n = cin.nextInt();
            a = new Point[n];

            for (int i = 0; i < n; ++i) {
                a[i] = new Point();
                a[i].value = cin.nextInt();
                a[i].pos = i + 1;
            }

            Arrays.sort(a);

//            compress y to 1..n
            for (int i = 0; i < n; ++i) {
                a[i].compressValue = i + 1;
            }

            Arrays.sort(a, Point.PosComparator);

//            fenwick tree
            fen = new int[n + 1];
            for (int i = 1; i < n + 1; ++i) {
                fen[i] = 0;
            }

            long ans = 0;
            for (int i = 0; i < n; ++i) {
                ans += (i - sumFenwick(a[i].compressValue));
                updateFenwick(a[i].compressValue, n);
            }
            System.out.println(ans);
        }
    }

    public static int lowbit(int n) {
        return n & (-n);
    }

    public static int sumFenwick(int n) {
        int sum = 0;

        while (n > 0) {
            sum += fen[n];
            n -= lowbit(n);
        }

        return sum;
    }

    public static void updateFenwick(int index, int n) {
        while (index <= n) {
            fen[index]++;
            index += lowbit(index);
        }
    }

    static class Point implements Comparable  {
        int value;
        int pos;
        int compressValue;

        public static Comparator<Point> PosComparator = new Comparator<Point>() {
            public int compare(Point o1, Point o2) {
                return o1.pos - o2.pos;
            }
        };

        @Override
        public int compareTo(Object o) {
            return this.value - ((Point) o).value;
        }
    }
}

