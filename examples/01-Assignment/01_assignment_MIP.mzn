int: n;
set of int: WORKER = 1..n;
set of int: TASK   = 1..n;
array[WORKER, TASK] of int: cost;

% ignore for now:
array[TASK] of int: dur;
int: H;

% x[w,t] = 1  iff  worker w is assigned task t
array[WORKER, TASK] of var 0..1: x;

constraint forall(w in WORKER)( sum(t in TASK)(x[w,t]) = 1 );  % one task per worker
constraint forall(t in TASK)( sum(w in WORKER)(x[w,t]) = 1 );  % one worker per task

solve minimize sum(w in WORKER, t in TASK)( cost[w,t] * x[w,t] );
