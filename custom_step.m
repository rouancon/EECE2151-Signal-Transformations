function [stepsig,time_index] = custom_step(start_time,sample_length,pulse_time,pulse_length);

%% custom_step:  creates a positive-going unit height restangular pulse singal
%% 
%%
%% Warning: Assumes that the desired index sequence includes 0, or in other words
%%    that first_index < 0 AND first_index + siglength - 1 > 0. Otherwise
%%    results may not be as expected.
%%
%% Input arguments: 
%% 
%%  start_time: start time index for the entire signal, must be an integer
%%  sample_length: length of entire segnal in samples, must be an integer
%%  pulse_time: start time of the pulse, must be an integer
%%  pulse_length: length of the pulse, must be an integer
%% 
%% Output arguments:
%% 
%%  stepsig: step sequence created
%%  time_index: vector of time indices so that 
%%  	deltasig = 1 for time_index value = 1, 0 otherwise
%%	stepsig = 1 for time_index value >= 0, 0 otherwise; depending on shift
%% 
%%
%% C Rouan
%% v 1.0 Oct 13

[stepsig1,time_index] = delta_step_function_demo_edit_a(sample_length,start_time);
[stepsig2,time_index] = delta_step_function_demo_edit_a(pulse_length,pulse_time);

stepsig = stepsig1-stepsig2;

return
