#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define prt(ch,n)\
 case ch: \
 fprintf(stdout,"i 1 0 %d %d\n",p,n); break; \
 case ch-32: \
 fprintf(stdout,"i 1 0 %d %d\n",p,n); break
 
#define drt(ch,n)\
 case ch: \
 fprintf(stdout,"i 2 0 %d %d\n",p,n); break; \
 case ch-32: \
 fprintf(stdout,"i 2 0 %d %d\n",p,n); break

#define nurt(ch)\
 case ch: \
 p = ch-48; break
 


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
  
  nurt('1');
  nurt('2');
  nurt('3');
  nurt('4');
  nurt('5');
  nurt('6');
  nurt('7');
  nurt('8');
  
prt('q',200);
prt('w',220);
prt('e',230);
prt('r',250);
prt('t',270);
prt('z',300);
prt('u',305);
prt('i',310);

drt('a',200);
drt('s',220);
drt('d',230);
drt('f',250);
drt('g',270);
drt('h',300);
drt('j',305);
drt('k',310);


 case '9': 
 fprintf(stdout,"i2 0 0.3 1\n"); 
  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

