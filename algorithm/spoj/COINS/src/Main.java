import java.io.FileNotFoundException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.Scanner;

public class Main {

    static HashMap<Integer, BigInteger> hm = new HashMap<Integer, BigInteger>();

    public static void main(String[] args) throws FileNotFoundException {
        int n;
        Scanner cin;

        cin = new Scanner(System.in);

        while (cin.hasNext()) {
            hm.clear();
            hm.put(0, BigInteger.valueOf(0));
            hm.put(1, BigInteger.valueOf(1));

            n = cin.nextInt();

            System.out.println(maxCoin(n));
        }
    }

    public static BigInteger maxCoin(Integer n) {
        if (hm.containsKey(n)) {
            return hm.get(n);
        }

        BigInteger sum = maxCoin(n / 3).add(maxCoin(n / 4)).add(maxCoin(n / 2));

        if (sum.compareTo(BigInteger.valueOf(n)) == 1) {
            hm.put(n, sum);
            return sum;
        } else {
            hm.put(n, BigInteger.valueOf(n));
            return BigInteger.valueOf(n);
        }
    }
}
