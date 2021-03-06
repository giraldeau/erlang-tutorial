-module(tut16).

-export([start/0, ping/1, pong/0]).

ping(0) ->
	pong_id ! finished,
	io:format("ping finished~n", []);

ping(N) ->
	pong_id ! {ping, self()},
	receive
		pong ->
			io:format("ping received pong~n")
	end,
	ping(N - 1).

pong() ->
	receive
		finished ->
			io:format("pong finished~n", []);
		{ping, Ping_PID} ->
			io:format("pong received ping~n", []),
			Ping_PID ! pong,
			pong()
	end.

start() ->
	register(pong_id, spawn(tut16, pong, [])),
	spawn(tut16, ping, [13]).
		