%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(test_ok_service_tests). 
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").
-include("common_macros.hrl").
%% --------------------------------------------------------------------

%% External exports
-export([start/0]).



%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()->
    spawn(fun()->eunit:test({timeout,2*60,test_ok_service}) end).


cases_test()->
    ?debugMsg("Test system setup"),
    setup(),
    ?debugMsg("add calls"),    
    add_service(),
    ?debugMsg("Start stop_test_system:start"),
    cleanup(),
    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
setup()->
    ?assertEqual(ok,application:start(test_ok_service)),
    Node=node(),
    ?assertEqual({pong,Node,test_ok_service},test_ok_service:ping()),    
    ?assertEqual(ok,application:stop(test_ok_service)),  
    ok.


cleanup()->
    init:stop().

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
add_service()->
    ?assertEqual(42,adder:add(20,22)),
    ok.
