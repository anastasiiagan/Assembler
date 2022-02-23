#include <iostream>

extern "C" double wartosc(double a, double b, double  c, double d, double x);

int main()
{
  std::cout << (wartosc(2, 3, 4, 5,  1.)) << "\n";
  std::cout << (wartosc(2, 3, 4, 5, -1.)) << "\n";
  return 0;
}
/* Wyjście:
 * 14
 * 2
 */
