-module(tut17).

-export([start_ping/1, start_pong/0, ping/2, pong/0]).

ping(0, Pong_Node) ->
	{pong_id, Pong_Node} ! finished,
	io:format("ping finished~n", []);

ping(N, Pong_Node) ->
	{pong_id, Pong_Node} ! {ping, self()},
	receive
		pong ->
			io:format("ping received pong~n")
	end,
	ping(N - 1, Pong_Node).

pong() ->
	receive
		finished ->
			io:format("pong finished~n", []);
		{ping, Ping_PID} ->
			io:format("pong received ping~n", []),
			Ping_PID ! pong,
			pong()
	end.

start_pong() ->
	register(pong_id, spawn(tut17, pong, [])).

start_ping(Pong_Node) ->
	spawn(tut16, ping, [10, Pong_Node]).		