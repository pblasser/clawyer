#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define yrt(ch,nm)\
 case ch: \
 fprintf(stdout,"i 3 0 1 8000 %f\n",nm); break
#define art(ch,nm)\
 case ch: \
 fprintf(stdout,"i 2 0 1 8000 %f\n",nm); break
#define qrt(ch,nm)\
 case ch: \
 fprintf(stdout,"i 4 0 1 8000 %f\n",nm); break
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
   yrt('z',1.0);
   yrt('x',27.0/22.0);
   yrt('c',4.0/3.0);
   yrt('v',3.0/2.0);
   yrt('b',7.0/5.0);
   yrt('n',5.0/3.0);
   yrt('m',49.0/27.0);
   yrt(',',170);
   yrt('.',180);
   yrt('<',190);

   art('a',1.0);
   art('s',27.0/22.0);
   art('d',4.0/3.0);
   art('f',3.0/2.0);
   art('g',7.0/5.0);
   art('h',5.0/3.0);
   art('j',49.0/27.0);
   art('k',1800);
   art('l',1900);
   art(';',2000);


   qrt('q',1.0);
   qrt('w',27.0/22.0);
   qrt('e',4.0/3.0);
   qrt('r',3.0/2.0);
   qrt('t',7.0/5.0);
   qrt('y',5.0/3.0);
   qrt('u',49.0/27.0);


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

