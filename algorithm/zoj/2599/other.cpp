/*
 * =====================================================================================
 *
 *       Filename:  main1.cpp
 *
 *    Description:  source code from http://blog.csdn.net/morgan_xww/article/details/6787988
 *
 *         Author:  http://blog.csdn.net/morgan_xww/article/details/6787988
 *
 * =====================================================================================
 */
 /** 
    在论文《数位计数问题解法研究——高逸涵》中找到的， 
    论文中没有代码实现，自己写代码用了很久，又Debug了很久，纠结死了... 
    题目的第二问，不能用二分， 
    我之前一直用二分 wrong answer了， 
    因为1~n不是按照题目规则有序的，所以不能二分。 
    纠结死我了。。。。。 
**/  

#include <iostream>  
#include <cstdio>  
#include <cstring>  
  
using namespace std;  
  
typedef long long LL;  
  
LL  dp[20][200];  // dp[L][sum]表示数字位为L 数字和为sum 的数字的个数，(前导零也算)  
  
// 数字和为 sum 的 L 位数字的个数（以0为前缀的也算数）  
LL getSum1(int L, int sum)  
{  
    if ( sum > 9*L || L < 0 || sum < 0 )  
        return 0;  
    if ( dp[L][sum] )  
        return dp[L][sum];  
    if ( L == 0 && sum == 0 )  
        return 1;  
    for (int i = 0; i <= 9; i++)  
    {  
        if ( sum-i < 0 ) break;  
        dp[L][sum] += getSum1(L-1, sum-i);  
    }  
    return dp[L][sum];  
}  
  
// 返回 1~n 中数字和为 sum 的数的个数  
LL getSum2(LL n, int sum)  
{  
    int digit[20], L = 0;  
  
    while ( n )  
    {  
        digit[L++] = n%10;  
        n /= 10;  
    }  
  
    LL  res = 0LL;  
    for (int i = L-1; i >= 0; i--)  
    {  
        for (int j = 0; j < digit[i]; j++)  
            res += getSum1(i, sum--);  
    }  
    res += getSum1(0, sum);  
    return res;  
}  
  
// 返回 1~n 中数字和为 sum 前缀为 prefix 的数的个数  
LL getSum3(LL n, LL prefix, int sum)  
{  
    char sn[21] = {0}, sp[21] = {0};  
    int  ln, lp;  
  
    sprintf(sn, "%lld", n);  
    sprintf(sp, "%lld", prefix);  
    ln = strlen(sn);  
    lp = strlen(sp);  
  
    for (int i = 0; i < lp; i++)  
        sum -= sp[i] - '0';  
  
    int i;  
    for (i = 0; i < lp; i++)  
    {  
        if ( sn[i] != sp[i] )  
            break;  
    }  
    if ( i < lp )  
    {  
        LL  res = 0LL;  
        if ( sn[i] < sp[i] )  ln--;  
        for (i = ln-lp; i >= 0; i--)  
            res += getSum1(i, sum);  
        return res;  
    }  
  
    LL  t = 0LL, res = 0LL;  
    for (i = lp; i < ln; i++)  
        t = 10*t + sn[i] - '0';  
    res = getSum2(t, sum);  
    for (i = ln-lp-1; i >= 0; i--)  
        res += getSum1(i, sum);  
    return res;  
}  
  
// 返回 1~n 中数字和为 sum 且字典序小于k的数的个数  
LL getSum4(LL n, LL k, int sum)  
{  
    int digit[20], L = 0;  
  
    while ( k )  
    {  
        digit[L++] = k % 10;  
        k /= 10;  
    }  
  
    LL  prefix = 1LL, res = 0LL;  
    int t = 1;  
    for (int i = L-1; i >= 0; i--)  
    {  
        for (int j = t; j < digit[i]; j++)  
        {  
            res += getSum3(n, prefix++, sum);  
        }  
        prefix = 10*prefix;  
        t = 0;  
    }  
  
    // 如果 k=3000; 小于k的数有3,30,300;而上面的计算不包括这些  
    // 所以下面特殊车里这种数据  
    for (int i = 0; i < L; i++)  
    {  
        if (digit[i] == 0) res++;  
        else break;  
    }  
    return res;  
}  
  
// 返回 k 在 1~n 中的位置  
LL getSum5(LL n, LL k)  
{  
    int sum = 0;  
    LL  _k = k;  
  
    while ( _k )  
    {  
        sum += _k % 10;  
        _k /= 10;  
    }  
  
    LL  res = 0LL;  
    for (int i = 1; i < sum; i++) // 数字和小于sum的数的个数  
        res += getSum2(n, i);  
    res += getSum4(n, k, sum);   // 数字和为sum且字典序小于k的数的个数  
    return res + 1;  
}  
  
int main()  
{  
#ifndef  ONLINE_JUDGE
  freopen("input.txt", "r", stdin);
  freopen("output2.txt","w",stdout);
#endif     /* -----  ONLINE_JUDGE  ----- */
    LL  n, k;  
    while ( cin >> n >> k && n )  
    {  
      cout
        <<getSum5(n,k)
        <<endl;
//        cout << getSum5(n, k) << " ";  
  
        int sum = 1, preSum;  
        LL  t, pre;  
        while ( (t = getSum2(n, sum)) < k )  
        {  
            sum++;  
            k -= t;  
        }  
        pre = 1;  
        preSum = 1;  

        while ( true )  
        {  
            while ( (t = getSum3(n, pre, sum)) < k )  
            {  
                pre++;  
                preSum++;  
                k -= t;  
            }  
            if ( preSum == sum ) break;  
            else pre *= 10;  
        }  
        while ( --k ) pre *= 10;  
//        cout << pre << endl;  
    }  
    return 0;  
}  
