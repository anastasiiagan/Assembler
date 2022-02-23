#include <stdio.h>
#include <math.h>

//Na wyjściu: grad[i] = scale * sqrt( (data[i+1] - data[i-1])^2 + (data[i+N] - data[i-N])^2)
// dla i=0,1,...,N-2
extern "C" void gradientSSE(float *grad, float * data, int N, float scale);
//{
	//for (int i = 0; i < N - 2; i++) {
		//grad[i] = scale * sqrt((data[i+1] - data[i-1]) * (data[i+1] - data[i-1]) + (data[i+N] - data[i-N]) * (data[i+N] - data[i-N]));
	//}
//}
int main(void) {
  const int N=400, HL=1078;
  char header[HL];
  float data[N][N];
  float grad[N][N];
  int i,j;
  FILE *strm = fopen("circle3.bmp","rb");
  fread(header, 1, HL, strm); // wczytuje header
  for(i=0; i<N; i++)
    for(j=0; j<N; j++)
      data[i][j]=(float)fgetc(strm);  // czyta piksele i konwertuje na float
  fclose(strm);

  for(i=1; i<N-1; i++) // Dla wszystkich pikseli "wewnętrznych"
    gradientSSE(grad[i]+1, data[i]+1, N, 7);    // wyznaczamy gradient

  for(i=0; i<N; i++){ // Tworzymy białą ramkę obrazka
     grad[0][i]=255; grad[N-1][i]=255; grad[i][0]=255; grad[i][N-1]=255;
  }

  strm=fopen("dum.bmp","wb");
  fwrite(header, 1, HL, strm);
  for(i=0; i<N; i++)
    for(j=0; j<N; j++)
      fputc((unsigned char)grad[i][j],strm);
  fclose(strm);
}
