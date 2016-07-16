import java.util.Scanner;
import java.util.Vector;

public class Main {
    static Vector<Integer> primes = new Vector<>();
    static int m, n;

    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);

        int t;
        t = 1;
//        t = cin.nextInt();

        while (t-- != 0) {
            n = (int) 1e9;
            m = n - (int) 1e5;
//            m = cin.nextInt();
//            n = cin.nextInt();
            runSegmentEratosthenesSieve(n);
            if (t != 0) System.out.println();
        }
    }

    public static void runSegmentEratosthenesSieve(int upperBound) {
        int segmentLength = (int) Math.sqrt(upperBound);
        boolean[] isComposite;
        isComposite = new boolean[segmentLength + 1];

        for (int i = 2; i * i <= segmentLength; ++i) {
            if (!isComposite[i]) {
                primes.add(i);
                for (int j = i * i; j <= segmentLength; j += i) {
                    isComposite[j] = true;
                }
            }
        }

        for (int j = (int) Math.sqrt(segmentLength) + 1; j <= segmentLength; ++j) {
            if (!isComposite[j]) {
                primes.add(j);
            }
        }

        boolean[] isCompositeInSegment = new boolean[n - m + 1];

        for (int i = m; i <= n; ++i) {
            
        }
//        for (Integer elem : primes) {
//            for (int i = m; i <= n; ++i) {
//                if ((i > elem && i % elem == 0) || i == 1) {
//                    isCompositeInSegment[i - m] = true;
//                }
//            }
//        }

        for (int i = m; i <= n; ++i) {
            if (i != 1 && !isCompositeInSegment[i - m]) {
                System.out.println(i);
            }
        }
    }
}
