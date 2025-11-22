#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define prt(ch,n,m)\
 case ch: \
 fprintf(stdout,"i %d 0 %d %d %d %d\n",dhan,p,n,m,p); break; 

#define nurt(ch,n)\
 case ch: \
 p = ch-48; break; 


int main(void){  
 int p;
 int dhan;
 int c;   
 static struct termios oldt, newt;
 p = 1;
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

dhan=2;
switch(c) { 
  
prt('q',23,24);
prt('w',34,41);
prt('e',22,42);
prt('r',56,57);
prt('t',33,56);
prt('z',66,61);
prt('u',89,23);
prt('i',99,21);
prt('o',92,2);
prt('p',2,92);
    }  

  dhan=3;
switch(c) { 
prt('a',32,300);
prt('s',42,800);
prt('d',230,450);
prt('f',550,100);
prt('g',127,100);
prt('h',1300,6);
prt('j',305,200);
prt('k',310,600);
prt('l',310,8000);
    }  


 dhan=1; 
switch(c) { 

prt('y',210,22);
prt('x',420,41);
prt('c',300,33);
prt('v',910,89);
prt('b',120,11);
prt('n',107,10);
prt('m',76,7);
prt(',',64,6);
prt('.',3100,8);

  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

