#include <iostream>

extern "C" void prostopadloscian(float a, float b, float c, float * objetosc, float * pole);

int main()
{
	float objetosc;
	float pole;
	prostopadloscian(10,12,3,&objetosc,&pole);
  std::cout << objetosc << "\n";
  std::cout << pole << "\n";
  return 0;
}
/* Wyjście:
 * 360
 * 2(12+30+36)=2(42+36)=2(78)
 */
