function x=estimate()
k0=[1.2736 0.1000 0.1000 0.1106 8.7757 0.3736 3.2675];
options=optimset('LevenbergMarquardt','on','LargeScale','on','TolX',10^(-12),'MaxFunEvals',10^12,'MaxIter',10^4,'Display','on','TolFun',10^(-12));
[x,resnorm,residual,exitflag,output]=lsqnonlin(@cost,k0,[0.01 0.01 0.01 0.01 0.01 0.01 0.01],[20 20 20 20 20 20 20],options)
%Jacobian = full(Jacobian); 
%varp = resnorm*inv(Jacobian'*Jacobian)/length(50);
    				%stdp = sqrt(diag(varp));
					%AIC=log(residual /50)+2*23;
					
return
