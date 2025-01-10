a1=fopen('particle.dat','w'); %Data will be stored in this file
t=0:50000;
N=10000;  % Total number of particles
x=N;
n1=N;   % Asssumed that all particles are on left side of the box at t=0
for i=1:50000
    if rand()<(n1/N)
        n1=n1-1;
    else
        n1=n1+1;
    end
    fprintf(a1,'%d\t%d\n',t(i),n1);
    x=[x;n1];
end
y=(N/2)*(1+exp(-2*t/N)); %Analytic solution
plot(t,x,'b',t,N-x,'g',t,y,'r',t,N-y,'k')
legend('Monte-Carlo(left)','Monte-Carlo(right)','Analytic(left)','Analytic(right)','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
ylabel('$n$(Number of paricles)','Interpreter','latex')
fclose(a1);