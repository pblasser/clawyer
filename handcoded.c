
//begin by making a stack of cards 
//first is magic hash
#include <stdio.h>
#include <unistd.h>
#include <term.h>
#include <termios.h>

//seconde is how to code a note macro
#define prt(ch,n,m)\
 case ch: \
 fprintf(stdout,"i %d 0 %d %d %d %d\n",69,1,n,m,2); break; 


//these are physical, large index cards with sharpy pref
//thirde is a main cue plus the 
int main(void){  
 static struct termios oldt, newt;
 tcgetattr( STDIN_FILENO, &oldt);
 newt = oldt;
 newt.c_lflag &= ~(ICANON | ECHO);          
 tcsetattr( STDIN_FILENO, TCSANOW, &newt);



//next card begin while loop and allow for exit
char c;
 while((c=getchar())!= 27) {   
  switch (c) {
  prt('l',3100,8000); //example call
  }
 }  
  fflush(stdout);
  tcsetattr( STDIN_FILENO, TCSANOW, &oldt);
  return 0;
}

