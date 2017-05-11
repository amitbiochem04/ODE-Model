function F=cost(k)

data1=[0.1 1 2 3 4 5 6 7 8 10 12 24 48];
	  
data2=[3.710850787 
9.838755552 
6.926178303 
3.002167839 
5.304734841 
9.419238552 
0.403079263 
2.184241053 
011.359823295 
11.208385545 
0.100043796 
0.214691004 
-0.00221013];% pERK

%data3=[0.1, 0.5 1 3 5 8 24 48];
%data4=[0.139641867 0.078210527 0.046907391 0.04671645 0.046262227 0.044421201 0.035776173 0.017303024]; %pAKT

data5=[0 1 2 3 4 5 6 7 8 10 12 24 48];
   
data6=[ 0 0.8 3.22 5.67 5.65 5.31 4.83 4.64 4.66 4.27 3.94 3.79 4.15];% mrnaDUSP6

data7=[2 4 6 8 10 12 24 48];
   
data8=[-0.15920227 0.158085114 0.305665902 0.780491888 0.365455901 0.567850031 0.110412225 0.487074831];%dusp6 protein 
	
%%%%erk 
  
model=@amit;

y0=[1 0 0 0];


tmax=50;

options=odeset('MaxStep',tmax*0.1);

[t,y]=ode45(model,[0.1 1 2 3 4 5 6 7 8 10 12 24 48],y0,options,k);

Y1=(y(:,2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
model=@amit;

y0=[1 0 0 0];


tmax=50;

options=odeset('MaxStep',tmax*0.1);

[t,y]=ode45(model,[2 4 6 8 10 12 24 48],y0,options,k);

Y2=(y(:,3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
model=@amit;

y0=[1 0 0 0];


tmax=50;

options=odeset('MaxStep',tmax*0.1);

[t,y]=ode45(model,[0 1 2 3 4 5 6 7 8 10 12 24 48],y0,options,k);

Y3=(y(:,4));%mrnaDUSP6




x1=Y1-data2;%erk
x2=Y2'-data8; %dusp6
x3=Y3'-data6; %mrnadusp6

F=[x1;x2';x3'];


     subplot(2,1,1);
      plot(data1,data2,'red',data1,Y1,'black')
      title('pERK')
  
      subplot(2,1,2);
      plot(data7,data8,'red',data3,Y2,'black')
      title('DUSP6')
      
      subplot(2,3,2);
      plot(data5,data6,'red',data5,Y3,'black')
      title('mRNADUSP6')
      
      
      return