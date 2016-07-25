import java.util.Scanner;
import java.util.Vector;

public class Main {
    static boolean[] allIsComposite;

    public static void main(String[] args) {
        Scanner cin = new Scanner(System.in);
        int t;
        t = cin.nextInt();


//        get primes below sqrt upperBound
        int primeUpper = (int) Math.sqrt((int) 1e9);

        allIsComposite = new boolean[primeUpper + 1];

        for (int i = 4; i <= primeUpper; i += 2) allIsComposite[i] = true;

        for (int i = 3; i * i <= primeUpper; i += 2) {
            if (!allIsComposite[i]) {
                for (int j = i * i; j <= primeUpper; j += i) allIsComposite[j] = true;
            }
        }

        while (t-- != 0) {
            int m = cin.nextInt();
            int n = cin.nextInt();
            runSegmentEratosthenesSieve(m, n);
            if (t != 0) System.out.println();
        }
    }

    public static void runSegmentEratosthenesSieve(int lowerBound, int upperBound) {
        Vector<Integer> primes = new Vector<>();

        int myPrimeUpper = (int) Math.sqrt(upperBound);
        int aboveMaxPrime = (int) Math.sqrt(upperBound);
        int len = upperBound - lowerBound + 1;
        boolean[] isComposite;

        isComposite = new boolean[len];

        for (int i = 2; i <= myPrimeUpper; i++) {
            if (!allIsComposite[i]) {
                for (int ii = lowerBound / i * i; ii <= upperBound; ii += i) {
                    if (ii >= lowerBound && i != ii) {
                        isComposite[ii - lowerBound] = true;
                    }
                }
            }
        }

        for (int i = lowerBound; i <= upperBound; ++i) {
            if (!isComposite[i - lowerBound] && i != 1) {
                primes.add(i);
            }
        }

        for (int i = 0; i < primes.size(); ++i) {
            System.out.print(primes.get(i));
            if (i != primes.size()) {
                System.out.println();
            }
        }
    }
}
