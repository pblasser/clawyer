#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define drt(ch,nm)\
 case ch: \
 fprintf(stdout,"i %d.1 0 -5 8000 %d\n",p,nm); break
#define prt(ch,nm)\
 case ch: \
 p = nm; break


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
   prt('1',1);
   prt('2',2);
   prt('3',3);
   prt('4',4);
   prt('5',5);
   drt('z',0);
   drt('w',1);
   drt('s',2);
   drt('x',3);
   drt('e',4);
   drt('d',5);
   drt('c',6);
   drt('v',6+1);
   drt('t',8);
   drt('g',8+1);
   drt('b',10);
   drt('y',11);
   drt('h',12);
   drt('n',13);
   drt('u',14);
   drt('j',15);
   drt('m',16);
   drt(',',16+1);
  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

