-module(gc_schema).
-export([rebuild/0]).

-include("gc_schema.hrl").

-define(DISC, {disc_copies, [node()]}).
-define(TABLE_DEF(Name, Type, Copies, Fields), {Name, [Copies, {type, Type}, {attributes, Fields}]}).

rebuild() ->
  Tables = [
    ?TABLE_DEF(tab_agent, set, ?DISC, record_info(fields, tab_agent)),
    ?TABLE_DEF(tab_agent_player, set, ?DISC, record_info(fields, tab_agent_player)),
    ?TABLE_DEF(tab_agent_daily, set, ?DISC, record_info(fields, tab_agent_daily))
  ],

  create_tables(Tables).

create_tables([]) -> ok;
create_tables([{Name, TabDef}|T]) ->
  {atomic, ok} = mnesia:create_table(Name, TabDef),
  create_tables(T).

create_indices(_, []) -> ok;
create_indices(Name, Index) when is_atom(Index) ->
  create_indices(Name, [Index]);
create_indices(Name, [Index|T]) ->
  {atomic, ok} = mnesia:add_table_index(Name, Index),
  create_indices(Name, T).
