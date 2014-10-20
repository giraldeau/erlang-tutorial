%% @author francis
%% @doc @todo Add description to hello.


-module(hello).

%% ====================================================================
%% API functions
%% ====================================================================
-export([hello/0, double/1, fac/1,
		 convert/1, len/1, temp_show/1,
		 list_max/1, convert_length/1,
		 month_length/2]).

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


convert_length(Length) ->
	case Length of 
		{centimeter, X} -> 
			{inch, X / 2.54};
		{inch, Y} -> 
			{centimeter, Y * 2.54}
	end.

month_length(Year, Month) ->
	Leap = if
		Year rem 400 == 0 ->
			leap;
		Year rem 100 == 0 ->
			not_leap;
		Year rem 4 == 0 ->
			leap;
		true ->
			not_leap
	end,
	case Month of
		sep -> 30;
		apr -> 30;
		jun -> 30;
		nov -> 30;
		feb when Leap == leap -> 29;
		feb -> 28;
		jan -> 31;
		mar -> 31;
		may -> 31;
		jul -> 31;
		aug -> 31;
		oct -> 31;
		dec -> 31
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================


