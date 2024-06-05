
#define STRUMPA(t) #
i 1 $t 10 1 110 120
i 2 $t 10 1 110 110
i 2 $t 10 2 800 600
i 2 $t 10 1 700 750
i 2 $t 10 1 720 720
i 2 $t 10 1 790 750
i 1 $t 10 4 60 66 #

#define TRUMPA(t) #
i 1 $t 1 2 110 120
i 1 + 3 2 110 110
i 1 + 4 1 800 600
i 1 + 4 1 600 800
i 1 + 1 3 700 750
i 1 + 4 3 720 720
i 1 + 1 3 750 750
i 1 + 3 3 790 790
i 1 + 6 1 400 300
i 1 + 8 3 60 66  #

#define TRUMPB(t) #
i 2 $t 8 3 60 66
i 2 + 6 1 400 300
i 2 + 3 3 790 790
i 2 + 1 3 750 750
i 2 + 4 3 720 720
i 2 + 1 3 700 750
i 2 + 4 1 600 800
i 2 + 4 1 800 600
i 2 + 3 2 110 110
i 2 + 1 2 110 120
#



#define TRUMPC(t) #
i 2 $t 1 3 60 66
i 2 + 3 1 400 300
i 2 + 1 3 790 790
i 2 + 1 3 750 750
i 2 + 1 3 720 720
i 2 + 1 3 700 750
i 2 + 1 1 600 800
i 2 + 1 1 800 600
i 2 + 3 2 110 110
i 2 + 1 2 110 120
#


#define UMP(t) #
i 2 $t 1 2 60 66
i 2 + 3 2 110 110
i 2 + 1 2 110 120
i 2 + 1 2 66 60
i 2 + 3 2 110 110
i 2 + 1 2 120 110
#

#define UMPI(t#i) #
i $i $t 1 2 60 66
i $i + 3 2 110 110
i $i + 1 2 110 120
i $i + 1 2 66 60
i $i + 3 2 110 110
i $i + 1 2 120 110
#



#define JUMP(t) #
i 1 $t 4 3 720 720
i 1 + 1 3 750 750
i 1 + 3 3 790 790

#
#define JRUMP(t) #
i 2 $t 1 1 600 800
i 2 + 1 1 800 600
#
#define JRUMPI(t#i) #
i $i $t 1 1 600 800
i $i + 1 1 800 600
i $i + 3 1 600 610
i $i + 1 1 800 800
#

t 0 250
$TRUMPA(0)
$TRUMPB(4)
$STRUMPA(20)
s 120
t 0 120
$TRUMPA(0)
$TRUMPB(4)
;$STRUMPA(20)
s 30
t 0 300
$TRUMPC(30)
$TRUMPC(38)
$TRUMPC(46)
s 300
t 0 30
$TRUMPC(0)
$UMP(10)
$UMP(18)
$UMP(26)
s 30
t 0 250
$TRUMPA(0)
$TRUMPB(4)
s 60
t 0 120
$JUMP(0)
$JUMP(4)
s 30
t 0 120
$JUMP(0)
$JUMP(4)
s 30
t 0 120
$UMP(0)
$UMP(4)
s 180
t 0 12
$JUMP(0)
$JUMP(4)
$UMP(0)
$UMP(4)
s 24
t 0 120
;$TRUMPA(0)
$JUMP(0)
;$TRUMPB(5)

$UMPI(4#1)
$UMPI(8#3)

;$STRUMPA(20)
s 24
t 0 120
$JRUMP(0)
$JUMP(0)
$JRUMP(5)
$UMP(4)
s 24
t 0 300
$JRUMP(0)
$UMPI(4#1)
$UMPI(6#2)
$UMPI(8#3)
s 50
t 0 300
$JRUMP(0)
$JRUMPI(4#1)
$JRUMPI(6#2)
$JRUMPI(8#3)
s 50
t 0 300
$JRUMP(0)
$JRUMPI(4#1)
$UMPI(6#2)
$JRUMPI(8#3)
s 50
t 0 300
$JRUMP(0)
$JRUMPI(4#1)
$JRUMPI(6#2)
$UMPI(8#3)
$STRUMPA(20)
$TRUMPA(30)
s 200
t 0 400
$STRUMPA(0)
s 20
t 0 30
$JRUMP(0)
$JRUMPI(4#1)
$UMPI(6#2)
$JRUMPI(8#3)
$STRUMPA(10)