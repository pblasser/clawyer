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
  
prt('q',230,24);
prt('w',340,41);
prt('e',220,42);
prt('r',560,57);
prt('t',330,56);
prt('z',660,61);
prt('u',890,23);
prt('i',990,21);
prt('o',920,2);
prt('p',20,92);
    }  

  dhan=3;
switch(c) { 
prt('a',3200,300);
prt('s',4200,800);
prt('d',2300,450);
prt('f',5500,100);
prt('g',1270,100);
prt('h',1300,6);
prt('j',3050,200);
prt('k',3100,600);
prt('l',3100,8000);
    }  


 dhan=1; 
switch(c) { 

prt('y',2100,220);
prt('x',4200,410);
prt('c',3000,330);
prt('v',9100,800);
prt('b',1200,110);
prt('n',1070,100);
prt('m',7600,700);
prt(',',6400,60);
prt('.',3100,800);

  }  
 // fflush( csound_pointer );
  fflush(stdout);
 }             
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
    return 0;
}

