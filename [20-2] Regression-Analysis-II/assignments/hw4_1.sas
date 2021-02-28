/* Q1 */
data q1;
input gender bkpk other washno washyes @@;
cards;
0 0 0 27 26 0 0 1 5 5
0 1 0 13 8 0 1 1 3 2
1 0 0 4 28 1 0 1 0 5
1 1 0 7 7 1 1 1 4 6
;
data q1;
set q1;
total = washno+washyes;
run; quit;

/* 로지스틱 - full model */
proc logistic data=q1;
model washyes/total = gender bkpk other;
output out=q1_out p=p lower=lower upper=upper;
run; quit;
proc print data=q1_out; 
run; quit;

/* other 변수 제외 후 적합 */
proc logistic data=ex1;
model washyes/tot = gender bkpk/lackfit;
output out=q1_out2  p=p reschi=pearson resdev=deviance;
run; quit;
proc print data=q1_out2;  run; quit;
