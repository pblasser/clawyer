
%:
	gcc $@.c
	./a.out | csound -odac -Lstdin $@.orc $@.sco 

sins:
	./a.out | csound -odac -Lstdin sine.orc non.sco 


all:
	./a.out | csound -odac -Lstdin sine.orc slendro.sco 


phile:
	csound -omandarin.wav mandarin.orc mandarin.sco -s -W
