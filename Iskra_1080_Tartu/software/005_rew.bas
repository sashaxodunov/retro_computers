2 CLS
12 OUT 144,6:OUT 146,0:OUT 145,3:OUT 147,5
22 G1=2:G9=2:G$(1)="X":G$(2)="0":G(1)=0:G2(2)=50:L$="          ":K$(1)=" крестики ":K$(2)="  нолики  "
32 CLS:LOCATE 15,12:PRINT"ЗНАЕТЕ ЛИ ВЫ ПРАВИЛА ИГРЫ y/n ?";:W=USR(51187):IF W=78 OR W=110 THEN GOTO 942
40 CLS:LINE (80,24)-(80,184),1:LINE (80,184)-(273,184),1:LINE (273,184)-(273,24),1:LINE (273,24)-(80,24),1:PAINT (81,25),2
42 FOR I=81 TO 275 STEP  24:LINE (I,24)-(I,184),3:NEXT I:FOR I=24 TO 184 STEP 20:LINE (81,I)-(272,I),3:NEXT I
52 DATA 80,24,80,184,80,23,273,23,274,23,274,185,274,185,80,185
62 DATA 248,164,248,145,249,145,226,145:LOCATE 15,1:PRINT"1   2   3   4   5   6   7   8  ":FOR V=1 TO 8:PRINT:PRINT TAB(10);V:NEXT V 
72 DATA 106,45,128,45,106,45,106,64,106,63,128,63,128,63,128,45,106,145,106,164
82 DATA 106,163,128,163,128,163,128,145,128,145,106,145,226,45,226,64,226,63
92 DATA 249,63,248,63,248,45,248,45,226,45,226,145,226,164,226,163,249,163    
95 PAINT (107,49),0:PAINT (243,49),0:PAINT (107,155),0:PAINT (243,155),0
112 Q=1:V=1
122 FOR I=1 TO 9:FOR J=1 TO 9:P(I,J)=0:NEXT J:NEXT I
132 IF Z=1 THEN GOTO 152
142 C(1)=T*6600:C(2)=C(1):GOTO 162
152 C(1)=W(1):C(2)=W(2):S3=B(1):S4=B(2):T(1)=S1(1):T(2)=S1(2) 
162 G=3-G9:G9=G 
172 LOCATE 27,9:PRINT"X";:LOCATE 31,9:PRINT"0";:LOCATE 27,11:PRINT"0";:LOCATE 31,11:PRINT"X"; 
182 GOSUB 932
192 P(5,5)=1:P(6,6)=1:P(5,6)=2:P(6,5)=2:I1=4:J1=4:I2=7:J2=7:S(1)=2:S(2)=2:H=60 
202 LOCATE 21,20:PRINT"Осталось ";H;"ходов"
212 LOCATE 3,10:PRINT S(1);:LOCATE 53,10:PRINT S(2)
222 GOSUB 772:S=1:GOSUB 732:IF S=2 THEN GOTO 442
232 LOCATE 0,0:IF H=0 THEN GOTO 252
242 IF S(1)=0 OR  S(2)=0 THEN GOTO 352
252 LOCATE 17,21:INVERSE:PRINT"клинч!!!";"ходов больше нет !";:NORMAL
262 S5=ABS(S(1)-S(2)):IF S5=0 THEN GOTO 342
272 IF S(1)>S(2)THEN GOTO 292
282 S4=S4+S5:A=2:GOTO 302
292 S3=S3+S5:A=1
302 LOCATE 15,20:PRINT"ИГРОК ";G$(A);" ПОБЕДИЛ СО СЧЕТОМ ";S5;"!!"
312 T(A)=T(A)+1:GOSUB 932
322 LOCATE 23,22:INVERSE:INPUT "Продолжим y/n ";F$:NORMAL:IF F$="y"THEN GOTO 42
332 STOP
342 LOCATE 20,21:PRINT"Равный счет !!!":T(1)=T(1)-0.5:T(2)=T(2)+.5:A=1:GOTO 312
352 LOCATE 20,20:PRINT"Чистая победа !!! Выигрыш удваивается !!!":A=1:IF S(2)=0 THEN GOTO 372
362 A=2 
372 S3=S3+2*S(1):S4=S4+2*S(2):GOTO 312
382 LOCATE 15,21:PRINT"Игрок  ";G$(G);"просрочил время !!!"
392 IF G=2 THEN GOTO 422
412 S4=S4+S(G):GOTO 432
422 S3=S3+S(G1) 
432 A=G1:S5=S(G1):GOTO 302
442 REM
452 LOCATE G2(G),14:PRINT"игрок ";G$(G);CHR$(ZWUK)  
462 LOCATE G2(G),15:PRINT"строка";:GOSUB 1072:J=W:LOCATE G2(G),16:PRINT"столбец";:GOSUB 1072:I=W:LOCATE G2(G),14:PRINT L$:LOCATE G2(G), 15:PRINT L$:LOCATE G2(G),16:PRINT L$:LOCATE 20,21:PRINT"                                  "  
472 I=I+1:J=J+1:IF P(I,J)=0 THEN GOTO 492
482 LOCATE 21,21:INVERSE:PRINT" КЛЕТКА ЗАНЯТА !!! ";CHR$(ZWUK):Q=Q-1:NORMAL:GOTO 452
492 S=1:GOSUB 782:IF S=2 THEN GOTO 512
502 LOCATE 23,21:INVERSE:PRINT" ход ошибочный ";CHR$(ZWUK):Q=Q-1: NORMAL:GOTO 452
512 IF I1&lt;1 OR I1=2 THEN GOTO 532
522 I1=I1-1 
532 IF I2>1 OR J1=9 THEN GOTO 552
542 I2=I2+1
552 IF J1&lt;J OR J1=2 THEN GOTO 572
562 J1=J1-1
572 IF J2>J OR J2=9 THEN GOTO 592
582 J2=J2+1
592 P(I,J)=G:S(G)=S(G)+1:FOR M=1 TO 3
602 LOCATE 11+4*(I-1),1+2*(J-1):IF G$(G)="0" THEN GOTO 622
612 PRINT G$(G):GOTO 632
622 PRINT G$(G)
632 FOR C1=0 TO  100:NEXT C1
642 LOCATE 11+4*(I-1),1+2*(J-1):FOR M1=0 TO 100:NEXT M1:NEXT M
652 H=H-1:IF H=1 OR  H=21 OR H=31 OR H=41 OR H=51 OR H=61 THEN GOTO 692
662 IF H&lt;1 OR H>21 AND H&lt;25 OR H>31 AND H&lt;35 OR H>41 AND H&lt;45 OR H>51 AND H&lt;55 THEN GOTO 682
672 GOTO 702
682 LOCATE 20,20:PRINT"осталось ";H;"хода       ":GOTO 712
692 LOCATE 20,20:PRINT"остался  ";H;"ход        ":GOTO 712
702 LOCATE 20,20:PRINT"осталось ";H;"ходов      ":GOTO 712
712 REM
722 A=2:GOSUB 782:GOTO 212
732 FOR I=I1 TO  I2:FOR J=J1 TO  J2 :IF P(I,J)=0 THEN GOTO 752
742 NEXT J,I:RETURN
752 A=1:GOSUB 782:IF S=1 THEN GOTO 742
762 RETURN
772 G1=G:G=3-G:G2=2^5:G3=2*G1^5:RETURN
782 FOR K=-1  TO 1:FOR L=-1 TO 1 
792 IF K=0 AND L=0 THEN GOTO 812
802 IF P(I+K,J+L)=G1 THEN GOTO 822
812 NEXT L,K:RETURN
822 K2=K+I:L2=L+J
832 K2=K2+K:L2=L2+L:IF P(K2,L2)=0 THEN GOTO 812
842 IF P(K2,L2)=G1 THEN GOTO 832
852 S=2:IF A=2 THEN GOTO 872
862 RETURN
872 K3=I:L3=J
882 LOCATE 11+4*(K3-1),1+2*(L3-1):IF G$(G)="0" THEN GOTO 902
892 PRINT CHR$(42);CHR$(ZWUK):FOR TU=0 TO 10:NEXT TU:LOCATE 11+4*(K3-1),1+2*(L3-1):PRINT G$(G):K3=K3+K:GOTO 912
902 PRINT CHR$(42);CHR$(ZWUK):FOR TU=0 TO  10 :NEXT TU:LOCATE 11+4*(K3-1),1+2*(L3-1):PRINT G$(G):K3=K3+K
912 L3=L3+L:IF K3=K2 AND L3=L2 THEN GOTO 812
922 P(K3,L3)=G:S(G)=S(G)+1:S(G1)=S(G1)-1:GOTO 882
932 R=0:Z1=S3:Z=1:GOSUB 1062:R=49:Z=2:Z1=S4:GOSUB 1062:RETURN  
942 REM
952 CLS:LOCATE 20,2:PRINT"*** Правила игры ***":PRINT:PRINT
962 PRINT"     Игра идет на квадратном поле 8х8."
972 PRINT"     Делая ход, вы указываете координаты пустой клетки."
982 PRINT"     Клетка выбирается по правилам:":PRINT"     в строке , в столбце и диагонали,"
992 PRINT"     проходящей через клетку хода, должна быть ":PRINT"     хотя бы еще одна ваша клетка,"
1002 PRINT"     а между ней и клеткой хода все поля":PRINT"     должны быть заняты соперником."
1012 PRINT"     Если нет ни одной клетки, удовлетворяющей ":PRINT"     условиям хода, то ход пропускается."
1022 PRINT"     Тур заканчивается, когда оба игрока уже не имеют ходов."
1032 PRINT"     Выигрыш равен разности чисел клеток, занятых":PRINT"     соперником в конце тура."
1042 PRINT"     Используются цифровые клавиши (1-8) и клавиша 9 ":PRINT"    для включения и выключения звукового сопровождения "   
1052 PRINT"     Для начала игры нажмите любую клавишу           ":W=USR(51187):GOTO 40
1062 LOCATE R,2:INVERSE:PRINT K$(Z):NORMAL
1063 LINE (2,40)-(57,40),1:LINE (57,40)-(57,70),1:LINE (57,70)-(2,70),1:LINE (2,70)-(2,40),1:PAINT (3,41),2
1065 LINE (297,39)-(352,39),1:LINE (352,39)-(352,70),1:LINE (352,70)-(297,70),1:LINE (297,70)-(297,39),1:PAINT (298,40),2
1066 LINE (2,89)-(57,89),1:LINE (57,89)-(57,112),1:LINE (57,112)-(2,112),1:LINE (2,112)-(2,89),1:PAINT (3,90),2
1067 LINE (297,89)-(355,89),1:LINE (355,89)-(355,112),1:LINE (355,112)-(297,112),1:LINE (297,112)-(297,89),1:PAINT (298,90),2
1068 LOCATE R+1,4:PRINT"  счет":LOCATE R+1,5:PRINT"  общий":LOCATE R+4,6:PRINT Z1:LOCATE R+1,9:PRINT"по турам" :RETURN
1072 W=USR(51187):W=W-48:IF 9 THEN ZWUK=7-ZWUK 
1082 IF W&lt;1 OR W>8 THEN GOTO 1072
1092 PRINT W:RETURN
1102 END