//#include <iostream>
#include <stdio.h>
extern "C" int iloczyn(int n, int * tab);

int main(){
  int tab[] = {1, 2, 3, 4, 5, 6, 7, 8, -9, 10};
  printf("%d\n", iloczyn(1, tab) );
  printf("%d\n", iloczyn(2, tab) );
  printf("%d\n", iloczyn(4, tab) );
  printf("%d\n", iloczyn(5, tab) );
  printf("%d\n", iloczyn(7, tab) );
  printf("%d\n", iloczyn(10, tab) );
  return 0;	
}
/*
1
2
24
120
5040
-3628800
*/
