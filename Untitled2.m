figure;
plot(t,V4, 'r')
hold on
plot(t, var_data4(2:end),'g')
%%
figure;
plot(tsamp, var_data2)
hold on
plot(tsamp, var_data)
%%
%(log(2*pi*var_in_mean(pbxform(phat)))) +
theta = vertcat(b,d);
J= @(phat)(0.5*sum(((modelfun_mu(pbxform(phat)) - yfxform(mudata))./sqrt(var_in_mean(pbxform(phat)))).^2)) + (0.5*sum(log(2*pi*var_in_mean(pbxform(phat)))));
 
%%(0.5*sum((log(2*pi*var_in_var(pbxform(phat)))) + (((modelfun_V(pbxform(phat)) - yfxform(vardata))./sqrt(var_in_var(pbxform(phat)))).^2)));
J_true = J(pfxform(theta))