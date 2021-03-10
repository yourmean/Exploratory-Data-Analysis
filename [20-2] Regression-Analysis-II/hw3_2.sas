/* Q2 */
data data2;
input year sales exp pop;
cards;
1	3083	75	825000
2	3149	78	830445
3	3218	80	838750
4	3239	82	842940
5	3295	84	846315
6	3374	88	852240
7	3475	93	860760
8	3569	97	865925
9	3597	99	871640
10	3725	104	877745
11	3794	109	886520
12	3959	115	894500
13	4043	120	900400
14	4194	127	904005
15	4318	135	908525
16	4493	144	912160
17	4683	153	917630
18	4850	161	922220
19	5005	170	925910
20	5236	182	929610
;

proc reg data=data2;
model sales = exp pop / dw dwprob;
run; quit;

proc autoreg data=data2;
model sales = exp pop / nlag =1 method=ml dwprob;
run; quit;

proc autoreg data=data2;
model sales = exp pop / nlag=2 method=ml dwprob;
run; quit;

/* Q2 ����ġ�� ���� */
data data2;
set data2;
time=_N_;
run; quit;

proc autoreg data=data2;
model sales=exp pop /nlag=1 method=ml dwprob;
output out=data2_out1 p=yhat pm=trendhat;
run; quit;

/* sales vs. expenditures */
proc sgplot data=data2_out1;
scatter x=exp y=sales /markerfillattrs=(color=blue);
scatter x=exp y=yhat /markerfillattrs=(color=blue) markerattrs=(symbol=circlefilled size=8);
series x=exp y=trendhat /lineattrs=(pattern=1 color=red);
run; quit;

/* sales vs population */
proc sgplot data=data2_out1;
scatter x=pop y=sales /markerfillattrs=(color=blue);
scatter x=pop y=yhat /markerfillattrs=(color=blue) markerattrs=(symbol=circlefilled size=8);
series x=pop y=trendhat /lineattrs=(pattern=1 color=red);
run; quit;

/* prediction of sales */
proc sgplot data=data2_out1;
series x=time y=sales/lineattrs=(pattern=1 color=red);
series x=time y=yhat/lineattrs=(pattern=1 color=blue);
series x=time y=trendhat/lineattrs=(pattern=1 color=green);
run; quit;
