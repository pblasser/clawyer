#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define prt(ch,n,m)\
 case ch: \
 fprintf(stdout,"i 1 0 %d %d %d\n",p,n,m); break; 

#define nurt(ch,nn)\
 case ch: \
 p = (ch-48); n=nn;break; 


int main(void){  
 int p;
 int n;
 int dhan;
 int c;   
 static struct termios oldt, newt;
 p = 1;
 n=8000;
dhan=1;
 tcgetattr( STDIN_FILENO, &oldt);
 newt = oldt;
 newt.c_lflag &= ~(ICANON | ECHO);          
 tcsetattr( STDIN_FILENO, TCSANOW, &newt);
 while((c=getchar())!= 27) {   
 if (c==32){ 
   fprintf(stdout,"i 23 0 %d\n",p); 
 }  switch(c) { 
  
  nurt('1',23);
  nurt('2',31);
  nurt('3',34);
  nurt('4',56);
  nurt('5',67);
  nurt('6',45);
  nurt('7',32);
  nurt('8',21);
  nurt('9',20);
  nurt('0',11);
    }  


switch(c) { 
  
prt('q',123,24);
prt('w',134,21);
prt('e',122,22);
prt('r',76,17);
prt('t',83,16);
prt('z',66,14);
prt('u',89,4);
prt('i',99,3);
prt('o',92,2);
prt('p',82,42);
prt('a',132,1);
prt('s',142,7);
prt('d',230,7);
prt('f',250,7);
prt('g',127,7);
prt('h',130,6);
prt('j',305,2);
prt('k',310,6);
prt('l',310,8);
prt('y',51,8);
prt('x',52,9);
prt('c',53,10);
prt('v',54,11);
prt('b',55,12);
prt('n',56,13);
prt('m',57,15);
prt(',',58,16);
prt('.',61,18);

  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

