/*multivariate statistics assignment #8*/

/*Q2*/
data diabetes;
input y1	y2	x1	x2	x3;
cards;
0.81	80	356	124	55
0.95	97	289	117	76
0.94	105	319	143	105
1.04	90	356	199	108
1	90	323	240	143
0.76	86	381	157	165
0.91	100	350	221	119
1.1	85	301	186	105
0.99	97	379	142	98
0.78	97	296	131	94
0.9	91	353	221	53
0.73	87	306	178	66
0.96	78	290	136	142
0.84	90	371	200	93
0.74	86	312	208	68
0.98	80	393	202	102
1.1	90	364	152	76
0.85	99	359	185	37
0.83	85	296	116	60
0.93	90	345	123	50
0.95	90	378	136	47
0.74	88	304	134	50
0.95	95	347	184	91
0.97	90	327	192	124
0.72	92	386	279	74
1.11	74	365	228	235
1.2	98	365	145	158
1.13	100	352	172	140
1	86	325	179	145
0.78	98	321	222	99
1	70	360	134	90
1	99	336	143	105
0.71	75	352	169	32
0.76	90	353	263	165
0.89	85	373	174	78
0.88	99	376	134	80
1.17	100	367	182	54
0.85	78	335	241	175
0.97	106	396	128	80
1	98	277	222	186
1	102	378	165	117
0.89	90	360	282	160
0.98	94	291	94	71
0.78	80	269	121	29
0.74	93	318	73	42
0.91	86	328	106	56
;
proc print data=diabetes; run; quit;

proc cancorr data=diabetes out=d_out
vprefix=u vname='conditions'
wprefix=v wname='products';
var x1 x2 x3;
with y1 y2;
run; quit;

proc print data=d_out;
var u1 v1;
run; quit;

proc sgplot data=d_out;
scatter x=u1 y=v1;
run; quit;
