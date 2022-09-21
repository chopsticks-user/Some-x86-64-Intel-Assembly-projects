#include <iostream>

int fib(int n)
{
    if( n == 0)
        return 0;
    if (n == 1 || n == 2)
        return 1;
    int a = 2, b = 1, c = 1;
    for(int i = 3; i <= n; i++)
    {
       b = a;
       a += c;
       c = b;
    }
    return b;
}

int main()
{
    int n = fib(6);
    std::cout << n << '\n';
    return 0;
}