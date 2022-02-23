#include <stdio.h>

extern "C" void sortuj(int * x,int * y,int * z);

int main(){
	int x=5, y=3, z=7;
	sortuj( &x, &y, &z);
	printf(" %d %d %d \n", x, y, z);
	return 0;	
}
/*
5 4 3*/
