/* regression analysis 2  assignment#1*/

/*Q1*/
data ex1;
input x1 x2 y;
cards;
120	600	0.9
60	600	0.949
60	612	0.886
120	612	0.785
120	612	0.791
60	612	0.89
60	620	0.787
30	620	0.877
15	620	0.938
60	620	0.782
45.1	620	0.827
90	620	0.696
150	620	0.582
60	620	0.795
60	620	0.8
60	620	0.79
30	620	0.883
90	620	0.712
150	620	0.576
60	620	0.802
60	620	0.802
60	620	0.804
60	620	0.794
60	620	0.804
60	620	0.799
30	631	0.764
45.1	631	0.688
40	631	0.717
30	631	0.802
45	631	0.695
15	639	0.808
30	639	0.655
90	639	0.309
25	639	0.689
60.1	639	0.437
60	639	0.425
30	639	0.638
30	639	0.659
;

proc nlin data=ex1 method=newton;
model y = exp(-b1*x1*exp(-b2*(1/x2-1/620)));
parms b1=0.01155 b2=5000 ; 
output out =ex1_out p=pred r=resid;
run; quit;

proc nlin data=ex1 method=gauss;
model y = exp(-b1*x1*exp(-b2*(1/x2-1/620)));
parms b1=0.01155 b2=5000 ; 
output out =ex1_out p=pred r=resid;
run; quit;

proc sgplot data = ex1_out;
scatter x=x1 y=resid;
proc sgplot data = ex1_out;
scatter x=x2 y=resid;
proc sgplot data = ex1_out;
scatter x=pred y=resid;
run; quit;
