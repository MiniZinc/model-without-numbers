include "alldifferent.mzn";

int: n;
set of int: WORKER = 1..n;
set of int: TASK   = 1..n;
array[WORKER, TASK] of int: cost;

array[TASK] of int: dur;             % task duration
int: H;                              % "heavy" threshold

% assign[w] = the task that worker w performs
array[WORKER] of var TASK: assign;

constraint dur[assign[1]] < H \/ dur[assign[2]] < H;

% alternatively, write as if-then-else:
%constraint if dur[assign[1]] > H then dur[assign[2]] <= H endif;

constraint alldifferent(assign);

solve minimize sum(w in WORKER)( cost[w, assign[w]] );
