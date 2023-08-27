#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define yrt(ch,nm)\
 case ch: \
 fprintf(stdout,"i 1 0 1 8000 %d\n",nm); break
#define art(ch,nm)\
 case ch: \
 fprintf(stdout,"i 2 0 1 8000 %d\n",nm); break
#define qrt(ch,nm)\
 case ch: \
 fprintf(stdout,"i 3 0 1 8000 %d\n",nm); break
#define drt(ch,nm)\
 case ch: \
 fprintf(stdout,"i %d 0 1 8000 \n",nm); break
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
   yrt('z',100);
   yrt('x',110);
   yrt('c',130);
   yrt('v',120);
   yrt('b',140);
   yrt('n',150);
   yrt('m',160);
   yrt(',',170);
   yrt('.',180);
   yrt('<',190);

   art('a',1300);
   art('s',1400);
   art('d',1500);
   art('f',2600);
   art('g',5200);
   art('h',5300);
   art('j',1700);
   art('k',1800);
   art('l',1900);
   art(';',2000);

   qrt('q',1300);
   qrt('w',1400);
   qrt('e',1500);
   qrt('r',2600);
   qrt('t',5200);
   qrt('y',5300);
   qrt('u',1700);
   qrt('i',1800);
   qrt('o',1900);
   qrt('p',2000);

   drt('4',4);
   drt('5',5);
   drt('6',6);



  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

