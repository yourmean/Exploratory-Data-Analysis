/*Q1*/

data data1;
input year month sales adver;
cards;
1990	1	320	5
1990	2	423	1
1990	3	414	3
1990	4	506	3
1990	5	419	3
1990	6	544	2
1990	7	392	7
1990	8	449	4
1990	9	502	4
1990	10	520	9
1990	11	689	11
1990	12	1377	14
1991	1	375	3
1991	2	318	2
1991	3	378	4
1991	4	497	2
1991	5	433	2
1991	6	426	2
1991	7	421	8
1991	8	448	3
1991	9	519	4
1991	10	638	8
1991	11	714	13
1991	12	1501	15
1992	1	356	3
1992	2	338	1
1992	3	428	4
1992	4	490	8
1992	5	434	2
1992	6	487	4
1992	7	381	7
1992	8	472	4
1992	9	699	6
1992	10	310	2
1992	11	795	18
1992	12	1605	16
1993	1	292	5
1993	2	295	1
1993	3	408	10
1993	4	480	5
1993	5	460	5
1993	6	576	2
1993	7	436	6
1993	8	436	4
1993	9	437	5
1993	10	556	3
1993	11	747	13
1993	12	1531	11
1994	1	406	6
1994	2	314	2
1994	3	503	8
1994	4	438	5
1994	5	453	4
1994	6	417	3
1994	7	352	4
1994	8	439	4
1994	9	533	6
1994	10	618	9
1994	11	706	11
1994	12	1647	5
1995	1	350	4
1995	2	361	0
1995	3	502	7
1995	4	417	4
1995	5	565	5
1995	6	432	2
1995	7	353	3
1995	8	495	4
1995	9	528	6
1995	10	612	4
1995	11	715	20
1995	12	1487	5
1996	1	447	3
1996	2	364	4
1996	3	437	7
1996	4	478	2
1996	5	504	2
1996	6	438	9
1996	7	429	1
1996	8	439	2
1996	9	544	5
1996	10	671	6
1996	11	848	17
1996	12	1504	13
1997	1	374	3
1997	2	394	1
1997	3	508	11
1997	4	470	3
1997	5	444	12
1997	6	366	4
1997	7	406	2
1997	8	509	4
1997	9	551	6
1997	10	654	13
;

proc reg data=data1;
model sales = adver / dw dwprob;
run; quit;

proc autoreg data=data1;
model sales=adver / nlag =1 method=ml dwprob;
run; quit;

proc autoreg data=data1;
model sales=adver/ nlag=2 method=ml dwprob;
run; quit;

/*����ġ�� ����*/
data data1;
set data1;
time=_N_; 
run; quit;

proc autoreg data=data1;
model sales = adver / nlag=1 method=ml dwprob;
output out=data1_out1 p=yhat pm=trendhat r=resid;
run; quit;

/*sales vs adver*/
proc sgplot data=data1_out1;
scatter x=adver y=sales / markerfillattrs=(color=blue);
scatter x=adver y=yhat / markerfillattrs=(color=blue) markerattrs=(symbol=circlefilled size=8);
series x=adver y=trendhat / lineattrs=(pattern=1 color=red);
run; quit;

/* Prediction of Sales */
proc sgplot data=data1_out1;
series x=time y=sales/lineattrs=(pattern=1 color=red);
series x=time y=yhat/lineattrs=(pattern=1 color=blue);
series x=time y=trendhat/lineattrs=(pattern=1 color=green);
run; quit;
