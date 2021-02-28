/* Q2 */
data q2;
input Week	Samp6	Pos6	Proc6	Reduct6	Samp5	Pos5	Proc5	Reduct5	Prod;
cards;
1	57	1	1	58.381	51	0	1	58	396.767
2	55	0	1	58	51	0	1	58	394.729
3	52	0	1	58	56	2	1	57.8025	398.143
4	57	1	1	58	55	1	1	57.7664	388
5	55	2	1	58	51	1	1	57.9057	392.329
6	65	3	1	57.8865	59	2	1	57.6273	398.171
7	57	1	1	57.1304	54	1	1	57.1286	395.643
8	55	1	1	57	59	2	1	57.363	394.871
9	60	1	1	57	50	0	1	57.2203	386.371
10	54	3	1	57.8879	56	0	1	57.0819	395.386
11	55	1	1	57.7857	60	2	1	57.7091	392.786
12	62	1	1	57.572	56	3	1	57.2397	383.086
13	50	1	1	57	50	2	1	57.1805	366.9
14	55	0	1	57	55	0	1	57.0749	384.157
15	62	1	1	56.9416	55	1	1	57.3986	392.371
16	61	2	1	56.629	49	0	1	57	389.657
17	56	2	1	57.7587	55	0	1	57.5532	386.371
18	56	1	1	56.9901	62	2	1	58	393.029
19	58	1	1	56.5204	63	2	1	57.044	396.686
20	58	3	1	57.2875	48	0	1	57	391.2
21	57	1	1	57.5397	59	1	1	57.1817	387.217
22	58	2	1	57.9437	66	3	1	57.9328	391.343
23	55	0	1	57.6205	56	1	1	57.2621	389.486
24	42	1	1	57.0313	34	1	1	57.2671	377.86
25	49	1	1	57.0962	46	0	1	55.2997	411.767
26	58	1	1	57.2647	54	1	1	57.0894	408.757
27	60	1	1	57.886	58	0	1	55.6831	404.029
28	75	6	1	56.0348	83	5	1	56	397.643
29	61	3	1	55.9564	63	3	1	56.1179	406.686
30	63	3	1	57.0203	69	4	1	57.2488	385.7
31	57	1	1	57.0186	57	3	1	54.67	392.886
32	63	3	1	54.646	73	2	1	57.09	369.971
33	69	5	1	55.4447	61	2	1	56	370.357
34	121	6	1	54.1579	87	5	1	55.3558	383.357
35	72	4	1	53.4398	55	1	1	55.1995	381.843
36	70	4	1	54.1363	69	5	1	54.9039	378.571
37	70	2	1	53.9795	76	5	1	53.2166	380.214
38	71	5	1	53.8262	79	4	1	54.6508	368.729
39	57	2	1	53.2414	57	3	1	53.1061	361.571
40	67	5	1	53.4392	64	3	1	52.4849	388.9
41	58	1	1	53	67	3	1	52.1213	404.171
42	62	2	1	53.4306	56	2	1	52.7922	402.7
43	87	5	2	52	77	6	1	52.6179	410.714
44	113	7	2	52.0538	90	6	1	52.2571	409.043
45	61	6	2	51.3803	82	6	1	52.8258	382.333
46	122	7	2	51.6279	73	6	1	52	385.214
47	100	7	2	51	86	5	1	52	382.971
48	118	7	2	51.1126	71	4	1	51.0594	398.014
49	67	6	2	51.0099	55	1	1	51	389.514
50	85	5	2	51	69	3	1	51.7356	405.543
51	56	4	2	51	46	4	1	52	387.56
;

data q2;
set q2;
n5 = Pos5/ Samp5;
n6 = Pos6/ Samp6;
run; quit;
proc print data=q2; run; quit;

/* �ð迭�� */
proc sgplot data=q2;
series X=Week Y=n5;
run; quit;
proc sgplot data=q2;
series X=Week Y=Proc5;
run; quit;
proc sgplot data=q2;
series X=Week Y=Reduct5;
run; quit;

proc sgplot data=q2;
series X=Week Y=n6;
run; quit;
proc sgplot data=q2;
series X=Week Y=Proc6;
run; quit;
proc sgplot data=q2;
series X=Week Y=Reduct6;
run; quit;

proc sgplot data=q2;
series X=Week Y=Prod;
run; quit;

/*street5 ������ƽ - full model */
proc logistic data=q2;
model Pos5/ Samp5 = Reduct5 Proc5 Prod;
run; quit;

/* Proc5, Prod ���� ���� */
proc logistic data=q2;
model Pos5/Samp5 = Reduct5/lackfit aggregate
scale=none;
output out=q2_out p=p reschi=pearson resdev=deviance;
run; quit;

/*street6 ������ƽ - full model */
proc logistic data=q2;
model Pos6/Samp6 = Reduct6 Proc6 Prod;
run; quit;
proc logistic data=q2;
model Pos6/Samp6 = Reduct6/lackfit aggregate
scale=none;
output out=q2_out2 p=p reschi=pearson resdev=deviance;
run; quit;

/*��*/
proc print data=q2_out; run; quit;
proc print data=q2_out2; run; quit;

proc sgplot data=q2_out;
series X=week Y=pearson;
series X=week Y=deviance;
run; quit;

proc sgplot data=q2_out2;
series X=week Y=pearson;
series X=week Y=deviance;
run; quit;
