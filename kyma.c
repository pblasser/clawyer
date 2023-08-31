#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define drt(ch,n,m)\
 case ch: \
 fprintf(stdout,"i 1 0 4 %d %d\n",n,m); break
#define prt(ch,nm)\
 case ch: \
 fprintf(stdout,"i 2 0 4 %d\n",nm); break


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
   drt('z',40,100);
   drt('w',4010,4200);
   drt('s',4020,4220);
   drt('x',3000,3010);
   drt('e',4000,4001);
   drt('d',3000,3900);
   drt('c',6000,6001);
   drt('v',6010,6100);
   drt('t',8000,8100);
   drt('g',8001,8000);
   drt('b',4100,4000);
   drt('y',1100,4000);
   drt('h',1200,1220);
   drt('n',1330,3000);
   drt('u',1400,4500);
   drt('j',1500,1600);
   drt('m',1600,1700);
   drt(',',16,17);
 case '9': 
 fprintf(stdout,"i3 0 10\n"); 
  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

