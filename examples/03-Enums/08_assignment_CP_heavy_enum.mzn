include "alldifferent.mzn";

int: n;

enum WORKER = W(1..n);
enum TASK = T(1..n);

array[WORKER, TASK] of int: cost;

array[TASK] of int: dur;             % task duration
int: H;                              % "heavy" threshold

% assign[w] = the task that worker w performs
array[WORKER] of var TASK: assign;

constraint dur[assign[W(1)]] < H \/ dur[assign[W(2)]] < H;

% alternatively, write as if-then-else:
%constraint if dur[assign[1]] > H then dur[assign[2]] <= H endif;

constraint alldifferent(assign);

solve minimize sum(w in WORKER)( cost[w, assign[w]] );
