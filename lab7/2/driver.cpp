#include <iostream>

extern "C" double wartosc (double a, double b, double x, int n);

int main()
{
	/*int tab[] = {10, 12, 13, 14, 15, 16, 17};
	int n = 5;*/
	std::cout << wartosc(4, 3, 2, 2);
  return 0;
}
/* 
 która zwraca wartosc = (a*x+b)^n
121. 
 */
