function dydt = amit(t,y,params) % Solve the kinetics example
dydt=zeros(size(y));
% parameters -reaction rate constant k1=0.1; k2=0.56; k3=1; k4=6;
% parameter rate constant k5=0.3; k6=0.6; k7=0.45; k8=0.9; k9=1;k10=0.69;k11=0.89;kd1=0.76;kd2=0.56;
%k1=0.309612038315457;
%k2=11.0210796878263;
%k3=0.758439956454315;
%k4=0.07839782952251  ;
%k5=0.988;
%kd2=0.0584442759638285;
%kd1= 0.0923602319622291;
params(1)=k1;
params(2)=k2;
params(3)=k3;
params(4)=k4;
params(5)=k5;
params(6)=kd1;
params(7)=kd2;
NGF=50;
ERK =y(1);                                            
pERK =y(2);                                            
DUSP6 = y(3);                                         
mRNADUSP6=y(4);
% evalute the rhs expression 
dydt(1) = -k1*ERK*NGF + k2*pERK*DUSP6;
dydt(2) = k1*ERK*NGF-k2*pERK*DUSP6;
dydt(3) = k3*mRNADUSP6-kd1*DUSP6;
dydt(4) = k4+k5*pERK-kd2*mRNADUSP6;

%[t,y] = ode45('amit',[0 50],[10 0 0 0]);
%plot(t,y);
%legend('ERK','pERK','DUSP6','mRNADUSP6');
%y(:,2) %to find the data of sepcific variabale 
%plot(t,y(:,2)) single plot of one variable.
%subplot
%plot(t,y(:,2))
%subplot(2,2,2)
%plot(t,y(:,3))
%% subplot issue 
%subplot(2,2,1);plot(t,y(:,1));legend('ERK');subplot(2,2,2);plot(t,y(:,2));legend('pERK');
%subplot(2,2,3);plot(t,y(:,3));
%legend('DUSP6');subplot(2,2,4);plot(t,y(:,4));legend('mRNADUSP6');subplot(2,2,1);plot(t,y(:,1));legend('ERK'); 
%subplot(2,2,2); plot(t,y(:,2));legend('pERK'); subplot(2,2,3);plot(t,y(:,3));legend('DUSP6');subplot(2,2,4); plot(t,y(:,4));
