int: n;
set of int: WORKER = 1..n;
set of int: TASK   = 1..n;
array[WORKER, TASK] of int: cost;

array[TASK] of int: dur;             % task duration
int: H;                              % "heavy" threshold
int: M = max(t in TASK)(dur[t]);

% x[w,t] = 1  iff  worker w is assigned task t
array[WORKER, TASK] of var 0..1: x;

constraint forall(w in WORKER)( sum(t in TASK)(x[w,t]) = 1 );  % one task per worker
constraint forall(t in TASK)( sum(w in WORKER)(x[w,t]) = 1 );  % one worker per task

array[WORKER] of var 0..1: heavy;    % heavy[w] = 1  if worker w's task exceeds H
constraint forall(w in WORKER)(
  sum(t in TASK)(dur[t] * x[t,w]) <= H + M * heavy[w]  % duration > H  => heavy[w] = 1
);
constraint heavy[1] + heavy[2] <= 1;     % the shared pair: at most one heavy

solve minimize sum(w in WORKER, t in TASK)( cost[w,t] * x[w,t] );
