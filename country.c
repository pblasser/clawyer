#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define drt(ch,n)\
 case ch: \
 fprintf(stdout,"i 10 0 0.5 %f 0\n",n); break; \
 case ch-32: \
 fprintf(stdout,"i 10 0 0.5 %f 1\n",n); break
 
 
#define art(ch,n)\
 case ch: \
 fprintf(stdout,"i 11 0 4 %f \n",n); break
 
#define prt(ch,nm)\
 case ch: \
 fprintf(stdout,"i %d 0 0.3 0\n",nm); break; \
 case ch-32: \
 fprintf(stdout,"i %d 0 0.3 1\n",nm); break


int main(void){  
 int p;
 int c;   
 static struct termios oldt, newt;
 p = 1;
 tcgetattr( STDIN_FILENO, &oldt);
 newt = oldt;
 newt.c_lflag &= ~(ICANON | ECHO);          
 tcsetattr( STDIN_FILENO, TCSANOW, &newt);
 while((c=getchar())!= 27) {   
  switch(c) { 
prt('q',1);
prt('w',2);
prt('e',3);
prt('r',4);
prt('t',5);

   art('a',3.0/4.0);
      art('s',5.0/6.0);
   art('d',1.0);
   art('f',9.0/8.0);
   art('g',4.0/3.0);
   art('h',16.0/11.0);
   art('j',7.0/5.0);
   art('k',3.0/2.0);
   art('l',7.0/4.0);
   art(';',2.0);
   
   
   drt('<',3.0/4.0);
      drt('z',5.0/6.0);
   drt('x',1.0);
   drt('c',9.0/8.0);
   drt('v',4.0/3.0);
   drt('b',16.0/11.0);
   drt('n',7.0/5.0);
   drt('m',3.0/2.0);
   drt(',',7.0/4.0);
   drt('.',2.0);
 case '9': 
 fprintf(stdout,"i2 0 0.3 1\n"); 
  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

