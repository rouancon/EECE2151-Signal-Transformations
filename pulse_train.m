function [stepsig,time_index] = pulse_train(start_time,end_time,pulse_height,period,cycle);

%% custom_step:  returns an arbitrary finite-length pulse train along with the associated time vector
%% 
%%
%% Warning: Assumes that the desired index sequence includes 0, or in other words
%%    that first_index < 0 AND first_index + siglength - 1 > 0. Otherwise
%%    results may not be as expected.
%%
%% Input arguments: 
%% 
%%  start_time: start time index for the pulse train, must be an integer
%%  end_time: end time of pulse train, must be an integer
%%  pulse_height: pulse height, must be an integer
%%  period: repition period, must be an integer
%%  cycle: duty cycle, must be an integer
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

% time_index = start_time:end_time;
% stepsig = pulse_height*pulstran(time_index,cycle,'tripuls',period,-1)

% create the time index vector

time_index = [start_time : end_time];

% initialize the step sequence as all zeros and then set step[n] = height for n>-0

stepsig = zeros(1,(end_time-start_time+1));

begin = start_time+1;

for i = 1:cycle
    stepsig(begin:(begin+period)) = pulse_height;
    begin = begin + 2*period;
end

return
