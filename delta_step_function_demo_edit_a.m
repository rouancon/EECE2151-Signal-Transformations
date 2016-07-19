function [stepsig,time_index] = delta_step_function_demo_edit_a(siglength,first_index,on_index);

%% delta_step_demo:  Creates  delta and step sequences with specified start times and lengths
%%                      at specified on_index start time
%% 
%% function [deltasig,stepsig,time_index] = delta_step_function_demo_edit_a(siglength,first_index,on_index);
%%
%% Warning: Assumes that the desired index sequence includes 0, or in other words
%%    that first_index < 0 AND first_index + siglength - 1 > 0. Otherwise
%%    results may not be as expected.
%%
%% Input arguments: 
%% 
%%  siglength: length of the signals to be created in samples, must be an integer
%%  first_index: time index of the first sample in the sequences, must be an integer
%%  on_index: time index at which sample begins (shift amount), must be an integer
%% 
%% Output arguments:
%% 
%%  stepsig: step sequence created
%%  time_index: vector of time indices so that 
%%  	deltasig = 1 for time_index value = 1, 0 otherwise
%%	stepsig = 1 for time_index value >= 0, 0 otherwise; depending on shift
%% 
%%
%% DH Brooks
%% v 1.1 Oct 13

% adjust first_index for the shift (value of k, or on_index)

first_index = first_index - on_index;

% find last time value in the time index sequence

last_time = first_index + siglength - 1;

% create the time index vector

time_index = [first_index : last_time];

% find which element of time_index has the value 0

zero_index = find(time_index == 0);

% initialize the step sequence as all zeros and then set step[n] = 1 for n>-0

stepsig = zeros(1,siglength);
stepsig(zero_index:end) = 1;

return
