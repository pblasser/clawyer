

#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

#define nurt(ch,n)\
 case ch: \
 duras=n; \
 fprintf(stdout,"i 2 0 1 %d\n",n); break
#define prt(ch,nm)\
 case ch: \
 fprintf(stdout,"i %d 0 %d %d\n",(pedal?3:1),duras, nm+p); break

//the ideal tube is in zeven tone equal
//unrealisable in the physical world
//but the virtual.

int main(void){  
 int p;
 int c;   
 int duras;
 int pedal;
 static struct termios oldt, newt;
 p = 0;
 pedal=0;
 duras=1;
 tcgetattr( STDIN_FILENO, &oldt);
 newt = oldt;
 newt.c_lflag &= ~(ICANON | ECHO);          
 tcsetattr( STDIN_FILENO, TCSANOW, &newt);
 while((c=getchar())!= 27) { 
 if(c==32) pedal=!pedal;
 switch(c) { 
  
  nurt('1',1);
  nurt('2',2);
  nurt('3',3);
  nurt('4',4);
  nurt('5',5);
  nurt('6',7);
  nurt('7',9);
  nurt('8',11);
  nurt('9',13);
  nurt('0',14);
    }  



 p=0;  
  switch(c) { 
   prt('q',0);
prt('w',16);
prt('e',20);
prt('r',24);
prt('t',28);
prt('z',29);
prt('u',36);
prt('i',44);
prt('o',48);
prt('p',52);
 }  
p=12;
switch(c) { 
prt('a',0);
prt('s',16);
prt('d',20);
prt('f',24);
prt('g',28);
prt('h',29);
prt('j',36);
prt('k',44);
prt('l',48);
    }
p=20;  
switch(c) { 

prt('y',0);
prt('x',16);
prt('c',20);
prt('v',24);
prt('b',28);
prt('n',29);
prt('m',36);
prt(',',44);
prt('.',48);

  }  

 fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

