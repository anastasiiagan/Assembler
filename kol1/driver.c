#include <stdio.h>
using namespace std;

extern "C" double oblicz( double *tab, int n, float x);

int main(){
 double t[] = { 1.0, 2.0, -3.0, 4.0, 5.0, 7.0 };
 printf("%f\n", oblicz( t, 6, 0.0));
 printf("%f\n", oblicz( t, 6, 1.0));
 printf("%f\n", oblicz(t, 6, 3.0));
 printf("%f\n", oblicz(t, 4, 3.0));
 printf("%f\n", oblicz(t, 1, 3.0));
 return 0;
}
/* Spodziewane wyjście:
-840.000000
-1917.000000
-4071.000000
-117.000000
4.000000
*/
