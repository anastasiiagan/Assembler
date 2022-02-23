#include <cstdio>
#include <iostream>
using namespace std;

// kopiuje n liczb typu int z zrodla do celu 
void kopiuj(unsigned int * cel, unsigned int * zrodlo, unsigned int n);

// zeruje tablice liczb typu int o rozmiarze n
void zeruj(unsigned int * tablica, unsigned int n);


int main(){
  unsigned int zrodlo[] = {10, 12, 13, 14, 15, 16, 17};
  unsigned int cel[] = {100, 120, 130, 140, 150, 160, 170};
  unsigned int tab[] = {10, 12, 13, 14, 15, 16, 17};
  kopiuj(cel, zrodlo, 5);
  zeruj(tab,5);
  
  for (size_t i = 0; i < 7; i++) {
        cout << cel[i] << ' ';
    }
  cout<<endl;
  for (size_t i = 0; i < 7; i++) {
        cout << tab[i] << ' ';
    }
  return 0;
}

/** Spodziewane wyjście

*/
