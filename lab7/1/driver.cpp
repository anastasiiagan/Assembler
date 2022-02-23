#include <iostream>

extern "C" int suma (int n, int * tab);

int main()
{
	int tab[] = {10, 12, 13, 14, 15, 16, 17};
	int n = 5;
	std::cout << suma(n, tab);
  return 0;
}
/* 
 64
 */
