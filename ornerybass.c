#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define prt(ch,n,m)\
 case ch: \
 fprintf(stdout,"i %d 0 %d %d %d\n",dhan,p,n,m); break; 

#define nurt(ch,n)\
 case ch: \
 p = ch-48; \
 fprintf(stdout,"i %d 0 %d %d\n",dhan,p,n); break; 


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
 dhan=1; 
 switch(c) { 
  
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
  
prt('q',53,64);
prt('w',64,61);
prt('e',62,62);
prt('r',76,77);
prt('t',73,76);
prt('z',76,71);
prt('u',89,81);
prt('i',81,81);
prt('o',82,82);
prt('p',88,87);
    }  

  dhan=3;
switch(c) { 
prt('a',52,54);
prt('s',42,80);
prt('d',70,76);
prt('f',50,53);
prt('g',67,66);
prt('h',30,34);
prt('j',35,40);
prt('k',31,60);
prt('l',42,80);
    }  

  dhan=4;
switch(c) { 

prt('y',51,50);
prt('x',59,69);
prt('c',30,33);
prt('v',11,19);
prt('b',67,89);
prt('n',89,99);
prt('m',76,79);
prt(',',64,63);
prt('.',70,20);

  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}
 
