/* Q1 */
data ele;
input age matings @@;
cards;
27	0 28	1 28	1 28	1 28	3 29	0 29	0 29	0
29	2 29	2 29	2 30	1 32	2 33	4 33	3 33	3
33	3 33	2 34	1 34	1 34	2 34	3 36	5 36	6
37	1 37	1 37	6 38	2 39	1 41	3 42	4 43	0
43	2 43	3 43	4 43	9 44	3 45	5 47	7 48	2 52	9
;
proc print; run; quit;

/*scatter plot*/
proc sgplot data = ele; 
scatter X = age Y = matings; 
run; quit;

/*linear model*/
proc reg data=ele;
model matings=age;
plot matings*age;
run; quit;

proc genmod data = ele; 
model matings = age / dist = poisson link=log type3;
output out=out1 pred=p resdev=resid; 
run; quit;

proc gplot data=out1;
plot (matings p) * age / overlay;
run; quit;

proc gplot data=out1;
plot resid * age / overlay;
run; quit;

data ele2;
set ele;
age2=age**2;
proc genmod data = ele2; 
model matings = age age2 / dist = poisson link=log type3;
output out=out2 pred=predicted resdev=resid; 
run; quit;
