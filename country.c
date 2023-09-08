#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define drt(ch,n)\
 case ch: \
 fprintf(stdout,"i 10 0 1 %f 0\n",n); break; \
 case ch-32: \
 fprintf(stdout,"i 10 0 1 %f 1\n",n); break
 
 
#define art(ch,n)\
 case ch: \
 fprintf(stdout,"i 11 0 4 %f \n",n); break
 
#define prt(ch,nm)\
 case ch: \
 fprintf(stdout,"i 2 0 0.3 %d\n",nm); break


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
prt('1',300);
prt('2',301);
prt('3',310);
prt('4',311);
prt('5',360);
prt('6',371);
prt('7',380);
prt('8',391);


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

