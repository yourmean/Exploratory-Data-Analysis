/* regression analysis 2  assignment#1*/

/* Q2 */
data ex2;
input x1 x2 y;
cards;
1	1	0.126
2	1	0.219
1	2	0.076
2	2	0.126
0.1	0	0.186
3	0	0.606
0.2	0	0.268
3	0	0.614
0.3	0	0.318
3	0.8	0.298
3	0	0.509
0.2	0	0.247
3	0.8	0.319
;

proc nlin data = ex2 method = newton plots = (fit diagnostics) ; 
model y = b1*b3*x1 / (1 + b1*x1 + b2*x2);
parms b1=2.9 b2=12.2 b3=0.69;
output out =ex2_out p = pred r=resid;
run; quit;

proc sgplot data = ex2_out;
scatter x=x1 y=resid;
proc sgplot data = ex2_out;
scatter x=pred y=resid;
run; quit;
