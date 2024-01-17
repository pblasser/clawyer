i am a lawyer for csound. 
My parents would call me a sea-lawyer but I always envisioned it this way. 
Some pieces kinda play themselves with macros in the sco, 
and some pieces allow you to play them with the ascii keyboard, 
thus many are laptop band-ready.  
You need these commands in your shell: 
make, gcc, and csound of course. 
A piece is triggered by tapping make,
and the name of the piece.
so for example, make kyma will then
compile kyma.c, run the resulting 
program piped into csound with
the respective kyma.orc and sco.
the c program takes raw keystrokes
and generates i-notes for csound,
which plays, live, out your dac.