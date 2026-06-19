int: k;    % number of products to choose
int: limit;  % available weight limit
int: n;       % number of products

include "all_different.mzn";

enum PRODUCT = P(1..n); 
array[PRODUCT] of int: wght;
array[PRODUCT] of int: profit;
array[1..k] of var PRODUCT: chosen;
constraint all_different(chosen);
constraint sum(i in 1..k)(wght[chosen[i]]) <= limit; 
solve maximize sum(i in 1..k)(profit[i]); 
