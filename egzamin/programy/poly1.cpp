#include <iostream>                       //( 1)
using namespace std;                      //( 2)
class Poly{                               //( 3)
  int a = 2;                              //( 4)
  public:                                 //( 5)
  virtual int f(int x) {return 0;}        //( 6)
  virtual int g(int x, int y) {return 0;} //( 7)
  virtual int h(int y)  {return 0;}       //( 8)
};                                        //( 9)
extern "C" void change(void * );          //(10)
                                          //(11)
int main(){                               //(12)
  Poly * p = new Poly();                  //(13)
  change(p);                              //(14)
  cout << p->f(8) << endl;                //(15)7
  cout << p->g(5,4) << endl;              //(16)7,3
  cout << p->h(5) << endl;                //(17)4
  delete p;                               //(18) 
}                                         //(19)
