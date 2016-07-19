%% delta_step_demo
%% 
%% Demo script to illustrate how to form and plot discrete delta and step sequences
%%
%% Note that this is a script (no input or output parameters, works
%% directly on the Matlab workspace from which it was invoked).
%% 
%% Note also that it creates a specific set of sequences. To make it
%% general, for example, after creating the sequences as vectors of al
%% zeros, one could use logical operations on the index sequence like
%%
%% delta(find(n==0)) = 1;
%%
%% or
%%
%% ustep(find(n>=1)) = 1;
%%
%% DH Brooks
%% v 1.0 Sep 09 2014
%% v 1.1 Sep 10
%% v 1.2 Sep 14: added some comments to header and below, added xlabel to
%% plots,  and broke up verification at end (and improved variable name)
%% v 1.3: Sep 9 2015: a few typo fixes, minor comment changes, 1 more change to var name
%% SW McKnight
%% v 1.4: Oct 1 2015: added steps to plot the difference of the step functions added "if" statement

%% Start by creating new figure window
figure(1)

%% create an index vector for n going from -50 to 50
time_index = [-50:50];

%% create and plot a discrete delta sequence for that index sequence, i.e. delta[time_index]
delta = zeros(1,101);
delta(51) = 1;
stem(time_index,delta)
title('delta[n]')
xlabel('Time (samples)')
pause

%% create and plot a unit step sequence for the same samples of time_index
figure(2)
ustep = zeros(1,101);
ustep(51:101) = 1;
stem(time_index,ustep)
title('u[n]')
xlabel('Time (samples)')
pause

%% create and plot u[n-1] from u[n]
figure(3)
u_n_minus_1 = [0 ustep(1:end-1)];
stem(time_index-1,u_n_minus_1)  % note the use of arithmetic in the first input variable  to stem
axis tight             % makes the graph "hug" the region where there are values
title('u[n-1]')
xlabel('Time (samples)')
pause

%% use the sequences above to show that u[n] - u[n-1] = delta[n], at least for this example
figure(4)
f_n=ustep-u_n_minus_1;
stem(time_index, f_n)
axis tight             
title('u[n]-u[n-1]')
xlabel('Time (samples)')
pause

% create a signal = difference between delta and u[n]-u[n-1]
verify_delta_equal_difference_of_steps_signal  = delta - (ustep - u_n_minus_1);

% now find the largest magnitude value in that difference signal so we can see if it is indeed 0
verify_delta_equal_difference_of_steps = max (abs (verify_delta_equal_difference_of_steps_signal ) );

% now report the result
    if(verify_delta_equal_difference_of_steps == 0)
    disp(['max (| delta[n] - (u[n] - u[n-1]) |) = ' num2str(verify_delta_equal_difference_of_steps)])
    end
