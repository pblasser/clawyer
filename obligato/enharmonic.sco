

t 0 120
#define CROTS(t)#
{ 16 b
i 1 [$t+$b/4] 1
}
#
#define KOUD(t)#
{ 4 b
i 3 [$t+$b+0.5] 1
}
#
#define PERC(t)#
$CROTS($t)
$KOUD($t)
i 2 $t 1 200
i 2 [$t+2] 1 330
i 2 [$t+2.75] 1 297
i 5 [$t+3.5] 1 
#

{ 8 c
$PERC([$c*4])
}

#define ARCHYTAS(t)#
i 6 [$t+4] 2 [55*28/27] [55*28/27] 
i 6 [$t+7.5] 1 [55*16/15] [55*4/3]
i 6 [$t+9.5] 0.75 [55*4/3] [55*4/3]
i 6 [$t+10.25] 0.75 [55*4/3] [55*4/3]
i 6 [$t+11] 2 [55*3/2] [55*14/9]
i 6 [$t+11] 2 [55*7/9] [55*7/9]
i 6 [$t+13] 0.5 [55*7/9] [55*28/27]
i 6 [$t+13.5] 0.5 [55*28/27] [55*28/27]
i 6 [$t+14] 4 [55*28/27] [55] 
#
$ARCHYTAS(0)
$ARCHYTAS(16)

i 7 12.3 4 [55*4] 23
i 7 2.3 1 [55*4*14/9] 3
i 7 7.3 0.5 [55*8*16/15] 4
i 7 12.3 4 [55*8] 13
i 7 17.3 1 [55*4*14/9] 53

i 7 32.3 4 [55*4] 23
i 7 30.3 1 [55*4*14/9] 3
i 7 27.3 0.5 [55*8*16/15] 4
i 7 22.3 4 [55*8] 13
i 7 27.3 1 [55*4*14/9] 53

{ 16 d
i 8 [2^($d/8)] 3 $d
}

{ 27 d
i 8 [17+2^($d/8)] 3 $d
}
