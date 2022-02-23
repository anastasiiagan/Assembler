#include <iostream>

extern "C" int iloczyn (int n, ...);

int main()
{
	/*int tab[] = {10, 12, 13, 14, 15, 16, 17};
	int n = 5;*/
	std::cout << iloczyn(4, 1, 2, 3, 4);
  return 0;
}
/* 
24 
 */
