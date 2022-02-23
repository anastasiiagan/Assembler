#include <stdio.h>
#include <stdlib.h>

extern "C" void oblicz(int n, float x, float * a, float *w);

void wypisz(int n, float * w){
	for(int i=0; i<n; i++)
		printf("%f ", w[i]);
	printf("\n");
}
int main(){
	const int n = 8;
	float a[n] = {1, 2, 3, -4, 5, 6, 7, 8};
	float w[n];
	oblicz(n, 1.0, a, w);
	wypisz(n, w);
	oblicz(n, 2.0, a, w);
	wypisz(n, w);
	oblicz(n, -2.0, a, w);
	wypisz(n, w);
	return 0;
	
}
/* Spodziewane wyjście:
3.000000 4.000000 5.000000 -2.000000 7.000000 8.000000 9.000000 10.000000 
7.000000 9.000000 11.000000 -3.000000 15.000000 17.000000 19.000000 21.000000 
3.000000 1.000000 -1.000000 13.000000 -5.000000 -7.000000 -9.000000 -11.000000 
*/
