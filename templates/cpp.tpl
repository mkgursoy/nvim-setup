#include <bits/stdc++.h>
using namespace std;

#define int long long
#define all(x) x.begin(), x.end()
#define ar array

const int MOD = 1e9 + 7, INF = 1e17;

int sum(int x,int y,int mod = MOD)
{
    return (x + y + mod) % mod;
}

int mul(int x,int y,int mod = MOD)
{
    return x * 1LL * y % mod;
}

int binpow(int x,int y,int mod = MOD)
{
    int res = 1;

    while (y)
    {
        if (y & 1) res = mul(res, x, mod), y--;
        else x = mul(x, x, mod), y >>= 1;
    }

    return res;
}

int inv(int x,int mod = MOD)
{
    return binpow(x, mod - 2, mod);
}

void solve()
{
    
}

int32_t main()
{
    ios_base::sync_with_stdio(false);
    cin.tie(NULL), cout.tie(NULL);
    
    int tt = 1;
    cin >> tt;

    while(tt--) solve();

    #ifdef LOCAL

    cerr << "[TIME] " << fixed << setprecision(2) << 1000 * clock() / CLOCKS_PER_SEC << " ms\n";

    #endif
}
