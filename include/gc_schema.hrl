-record(tab_agent, {
    aid,
    identity,
    password,
    cash = 0,
    credit = 0,
    root = false,
    disable = false,
    parent = root,
    level 
  }).

%% agent 1 <-> * player
-record(tab_agent_player, { 
    pid,
    aid
  }).

-record(tab_agent_daily, {
    id,       %% {id, {y, m, d}}
    balance,  %% amt
    turnover, %% amt
    update_time
  }).
