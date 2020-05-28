%% This is the application resource file (.app file) for the 'base'
%% application.
{application, test_ok_service,
[{description, "test_ok_service  " },
{vsn, "1.0.0" },
{modules, 
	  [test_ok_service_app,test_ok_service_sup,test_ok_service,test_ok]},
{registered,[test_ok_service]},
{applications, [kernel,stdlib]},
{mod, {test_ok_service_app,[]}},
{start_phases, []}
]}.
