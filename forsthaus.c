#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define yrt(ch,d,f,s,e)\
 case ch: \
 fprintf(stdout,"i 1 0 %d %d %d %d\n",d,f,s,e); break
#define art(ch,d,f,s,e)\
 case ch: \
 fprintf(stdout,"i 2 0 %d %d %d %d\n",d,f,s,e); break
#define qrt(ch,d,f,s,e)\
 case ch: \
 fprintf(stdout,"i 3 0 %d %d %d %d\n",d,f,s,e); break


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
   yrt('z',1,2,1100,1200);
   yrt('x',3,2,110,110);
   yrt('c',4,1,800,600);
   yrt('v',4,1,600,800);
   yrt('b',1,3,700,750);
   yrt('n',4,3,720,720);
   yrt('m',1,3,750,750);
   yrt(',',3,3,790,790);
   yrt('.',6,1,400,300);
   yrt('/',8,3,60,66);   

   art('a',1,2,110,120);
   art('s',3,2,110,110);
   art('d',4,1,800,600);
   art('f',4,1,600,800);
   art('g',1,3,700,750);
   art('h',4,3,720,720);
   art('j',1,3,750,750);
   art('k',3,3,790,790);
   art('l',6,1,400,300);
   art(';',8,3,60,66); 

   qrt('q',1,2,1100,1200);
   qrt('w',3,2,110,110);
   qrt('e',4,1,800,600);
   qrt('r',4,1,600,800);
   qrt('t',1,3,700,750);
   qrt('y',4,3,720,720);
   qrt('u',1,3,750,750);
   qrt('i',3,3,790,790);
   qrt('o',6,1,400,300);
   qrt('p',8,3,60,66); 




  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

