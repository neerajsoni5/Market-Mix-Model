# Market-Mix-Model
Excel and R Implication
Market Mix Model- A concept which is widely used specially across Retail Domain.

I would try to explain it in Simple Way hope it helps.
MMM is basically a type of regression where we are analyzing how different market strategies in terms of (Product , price ,Place) affects your Sales. Basically it’s a sort of Multivariant Regression Problem.
But there are few important Part which enhace its performance.They are
1.	Ad effect
2.	Optimization
3.	Interaction Effect

AdEffect:- MMM takes care of advertising. Suppose as a marketer I have aired an commercial to increase my sales. Continuously for 5 months I have invest in advertising and on the six months on wards I stopped.
Months	AdsGRP	Sales
1     	2535	127250
2	      4674	234200
3	      3833	192150
4	      2857	143350
5	      3986	199800
6	 	          185854
7	 	          143748
8	 	          173233
9	 	          130024
10	 	        241917
11	 	        273445
12	 	        298900

But the sales aftermath also consider previous add impact.

Adstock rate- Define the decaying rate (based on marketing decision).
It provide the effect of Adspend on sales from period 6 onwards. Can be calculated as below
At = Xt + adstock rate * At-1

Filter function  in R  with recursive methods used to identify.

Now if we are using this Adeffect variable in our regression than the Results would be highly varying , or I would say if we include adspend with Decay rate than the results would be improved.

Optimizer:- 
You can also implement Linear Programming Optimization in MMM. We can identify our Adstock rate with the help of it or we can identify Optimal Mareting Spend

Interaction- In regression, aninteraction effect exists when the effect of an independent variable on a dependent variable changes, depending on the value(s) of one or more other independent variables.
For Ex-  lm(y~ a+b+c)

With interaction – 
Lm(y~a+b+c+b*c) where we are assessing the impact of b and c together
