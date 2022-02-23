#include <stdio.h>
extern "C" float sumuj( float x, int n, int * a, float (*fun)(int, float) );

float iloczyn(int a, float x){
  return a * x * x;
}

float iloraz(int a, float x){
  printf(" # %f / %d \n", x, a); 
  if(a != 0)
     return x/a;
  else 
     return x*x;
}

int main(){
	int a[] = {1, 2, 3, 4, -5, 6, 7};
	printf("%f\n", sumuj(2.0,  7, a, iloczyn));
	printf("%f\n", sumuj(2.0,  1, a, iloczyn));
	printf("%f\n", sumuj(2.0,  2, a, iloczyn));
	printf("%f\n", sumuj(4.0,  7, a, iloraz)); 
    return 0;
}
/* Spodziewane wyjście:
72.000000
4.000000
12.000000
 # 4.000000 / 1
 # 4.000000 / 2
 # 4.000000 / 3
 # 4.000000 / 4
 # 4.000000 / -5
 # 4.000000 / 6
 # 4.000000 / 7
8.771429
*/
