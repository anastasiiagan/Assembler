#include <stdio.h>

#define N 100

// na wyjściu out[i] = wiersz[i+1] - wiersz[i]

extern "C" void diff(char *out,char *wiersz, int n);

int main(void)

{

    char Tablica[N+1], DIFF[N];

    int i;

    Tablica[0]=1;

    for(i=1;i<=N;i++)

        Tablica[i]=Tablica[i-1]+i;

    diff(DIFF, Tablica, N);

    for(i=0;i<N;i++)

        printf("%d ",DIFF[i]);

    printf("\n");

    

}

// OUT: 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 -128 17 18 19 20 
