first = var_in_mean(theta)
second = modelfun_mu(theta)
third = yfxform(mudata)
fourth = sqrt(var_in_mean(theta))
%%
%(V4_fxn_ODE(p,N0, V0, t)-(((N-3)./(N-1)).*(V_fxn(p, t, N0, V0).^2)));

 V4 =V4_fxn_ODE(p, N0, V0, t);
%V4samp = interp1(tsamp,tODE,V4);
% Next need to write 
figure;
plot(t, V4,'g*')
hold on
plot(tsamp, var4_data, 'b*')
xlabel('time (hours)')
ylabel('Variance')
title('Simulated fourth moment')
legend('fourth moment SSA fxn', 'fourth moment simulated data')
legend boxoff
%%
figure;
plot(t, V4_fxn_ODE(p,N0, V0, t),'b')
hold on
plot(t,(V_fxn(p, t, N0, V0)).^2, 'r')
plot(t, var4_data(2:end),'b*')
plot(t,vardata.^2, 'r*')
legend('V4 fxn', 'v2^2 fxn', 'V4data', 'v2^2data')
title('functions vs. data')

figure;
plot(t, V4_fxn_ODE(p,N0, V0, t)-(V_fxn(p, t, N0, V0).^2), 'g')

%%
J= @(phat)((0.5*sum((log(2*pi*var_in_mean(pbxform(phat)))) + (((modelfun_mu(pbxform(phat)) - yfxform(mudata))./sqrt(var_in_mean(pbxform(phat)))).^2)))+...
(0.5*sum((log(2*pi*var_in_var(pbxform(phat)))) + (((modelfun_V(pbxform(phat)) - yfxform(vardata))./sqrt(var_in_var(pbxform(phat)))).^2))));

objfun_J = @(phat)J(phat);

negLLguess= objfun_J(pfxform(theta))
negLLtrue= objfun_J(pfxform(p))

phatbest_J = fminsearch(objfun_J, pfxform(p))
params_best_J= pbxform(phatbest_J')