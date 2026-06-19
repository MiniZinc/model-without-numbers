include "alldifferent.mzn";

int: n;
set of int: WORKER = 1..n;
set of int: TASK   = 1..n;
array[WORKER, TASK] of int: cost;

% ignore for now:
array[TASK] of int: dur;
int: H;

% assign[w] = the task that worker w performs
array[WORKER] of var TASK: assign;

constraint alldifferent(assign);

solve minimize sum(w in WORKER)( cost[w, assign[w]] );
