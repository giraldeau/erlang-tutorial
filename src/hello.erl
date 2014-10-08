%% @author francis
%% @doc @todo Add description to hello.


-module(hello).

%% ====================================================================
%% API functions
%% ====================================================================
-export([hello/0, double/1, fac/1,
		 convert/1, len/1, temp_show/1,
		 list_max/1]).

hello() -> io:format("Hello World!~n", []).

double(X) -> 2 * X.

fac(1) -> 1;
fac(N) -> N * fac(N - 1).

convert({centimeter, X}) ->
	{inch, X / 2.54};
convert({inch, Y}) ->
	{centimeter, Y * 2.54}.

len([]) ->
	0;
len([First | Rest]) ->
	1 + len(Rest).

temp_show([]) ->
	ok;
temp_show([First | Rest]) ->
	print_temp(convert_celsius(First)),
	temp_show(Rest).

convert_celsius({Name, {c, Temp}}) ->
	{Name, {c, Temp}};
convert_celsius({Name, {f, Temp}}) ->
	{Name, {c, (Temp - 32) * 5 / 9}}.

print_temp({Name, {c, Temp}}) ->
	io:format("-15w ~w c~n", [Name, Temp]).

list_max([Head | Rest]) ->
	list_max(Rest, Head).

list_max([], Res) ->
	Res;
list_max([Head | Rest], Temp) when Head > Temp ->
	list_max(Rest, Head);
list_max([Head | Rest], Temp) ->
	list_max(Rest, Temp).


%% ====================================================================
%% Internal functions
%% ====================================================================


