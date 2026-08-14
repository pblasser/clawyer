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
prt('1',100);
prt('2',101);
prt('3',110);
prt('4',111);
prt('5',60);
prt('6',71);
prt('7',80);
prt('8',91);
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
      drt('f',800,900);
   drt('h',1200,1220);
   drt('n',1330,3000);
   drt('u',1400,4500);
   drt('j',1500,1600);
   drt('m',1600,1700);
      drt('q',11330,13000);
   drt('r',11400,14500);
   drt('a',11500,11600);
   drt('l',11600,11700);
      drt('i',900,910);
   drt('o',1000,1010);
   drt('p',10600,1170);
   drt('.',16,17);
 case '9': 
 fprintf(stdout,"i3 0 10\n"); 
 break;
  case '0': 
 fprintf(stdout,"i4 0 10\n"); 
 break;
   case '-': 
 fprintf(stdout,"i5 0 10\n"); 
 break;  
  case ' ': 
 fprintf(stdout,"i7 0 10\n"); 
 break;
 
    case '#': 
 fprintf(stdout,"i6 0 10\n"); 
 break;
 
  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

