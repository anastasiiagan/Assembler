#include <iostream>
// Funkcje z zadania 2
// kopiuje n liczb typu int z zrodla do celu 
void kopiuj(unsigned int * cel, unsigned int * zrodlo, unsigned int n);
// zeruje tablice liczb typu int o rozmiarze n
void zeruj(unsigned int * tablica, unsigned int n);

class BigInt{  
  unsigned int rozmiar;   
  unsigned int * dane;      
public:  
  explicit BigInt(unsigned int rozmiar) 
  : rozmiar(rozmiar), dane( new unsigned[rozmiar] ){
    zeruj(dane, rozmiar);  
  }  
  BigInt(const BigInt & x)   
  :  rozmiar(x.rozmiar),       dane(new unsigned[x.rozmiar]){     
    kopiuj(dane, x.dane, x.rozmiar);  
  }    
  BigInt & operator=(const BigInt & x) {    
    if(rozmiar != x.rozmiar){      
      unsigned * tmp = new unsigned[x.rozmiar];      
      delete[] dane;       
      rozmiar = x.rozmiar;      
      dane = tmp;    
    }    
    kopiuj(dane, x.dane, x.rozmiar);    
    return *this;  
  }  
  ~BigInt(){		    
    delete[] dane;  
  }
  // do zaimplementowania w zadaniu 3  
  int dodaj(unsigned int n);  
  int pomnoz(unsigned int n);  
  int podzielZReszta(unsigned int n);    
  BigInt & operator=(const char * liczba);  
  friend std::ostream & operator << (std::ostream & str, const BigInt & x);
  
  // do zaimplementowania w zadaniu 4  
  friend BigInt operator+ (const BigInt & a, const BigInt & b);  
  friend BigInt operator- (const BigInt & a, const BigInt & b);
}; 



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
