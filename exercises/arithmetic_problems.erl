-module(arithmetic_problems).
-compile(export_all).

%2.1
is_prime(2) -> true;
is_prime(3)-> true;	
is_prime(N) ->
    is_prime(N, 2).

is_prime(N,D) ->
     Temp = round(math:sqrt(N)) +1,
    case {D > Temp, N rem D} of 
	{true, 0} -> false;
	{true, _} -> true;
	{false, 0} -> false;
	_Else -> is_prime(N,D+1)
    end.

%2.2    
prime_factors(N) ->        
       prime_factors(N, 2).

prime_factors(1,_) -> [];
prime_factors(N, D) ->
    R = N rem D,
    if
	R =:= 0 -> [D] ++ prime_factors(N div D, D);
	true -> prime_factors(N, D + 1)
    end.

%NOT DONE
prime_factors_mult(N) ->
    prime_factors_multi(N, 2).

prime_factors_multi(1,_) -> ok;
prime_factors_multi(N, D) ->
    R = N rem D,
    prime_factors_multi(N,D,R).
prime_factors_multi(N,D,0) ->
    [D] ++ prime_factors_multi(N div D, D);
prime_factors_multi(N, D, _) ->
    prime_factors_multi(N,D+1).

%2.4
prime_list(U, U) -> [];
prime_list(L, U)-> 
    case is_prime(L) of
	true -> [L] ++ prime_list(L+1, U);
	_Else -> prime_list(L+1, U)
    end.

prime_list_tail(L, U) -> prime_list_tail(L,U,[]).
    
prime_list_tail(U, U, List) -> List;
prime_list_tail(L,  U, List) ->
    case is_prime(L) of
	true -> prime_list_tail(L+1, U, [L] ++ List);
	_Else -> prime_list_tail(L+1, U , List)   end.
	    

%2.5
goldbach(N) ->
    L = prime_list_tail(1, N),
    goldbach(N, L).


goldbach(_, []) -> [];
goldbach(N, [H|T]) ->
    S = goldbach(N, H , T),
    case S  of
	{A, B} -> {A, B};
	not_found   -> goldbach(N, T) end.

goldbach(_, _, []) -> not_found; 
    
goldbach(N, X , [H|T]) ->
    S = X  + H,
    case S of
	N -> {X, H};
	_Else -> goldbach(N, X, T) end.


goldbach_listi(Lower, U) ->
    L = [X || X <- lists:seq(Lower,U), X rem 2 =:= 0],
    goldbachlist(L).   
    

goldbach_list([], L) -> 
    io:format("L -> ~p~n", [L]),
    L;
goldbach_list(_ , Acc) -> Acc.
goldbachlist([]) -> [];
goldbachlist([H|T]) ->  
    io:format("Evens: ~p~n", [T]),
    io:format("goldbach ~p~n", [goldbach(H)]),
    goldbach_list(T , [goldbach(H)] ++ goldbachlist(T)).

    
    
		     
		    
    


			
	    
	    

	    
	    
		    
	    
