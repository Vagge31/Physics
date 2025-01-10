%solving logistic with Euler
r=1;
delta=0.01;
T=10;
N=ceil(T/delta);%floor
X=linspace(0,2,50);

for i=1:length(X)

x0=X(i);
x=zeros(N,1);t=x;

x(1)=x0;
t(1)=0;
for n=2:N
    t(n)=(n-1)*delta;
    x(n)=x(n-1)+delta*xdot(x(n-1),t(n-1),r);
end

xan=r./(1+((r-x0)/x0)*exp(-r*t));

figure(10)
plot(t,x,'b','linewidth',2,'markersize',16)
%plot(t,x,'b',t,xan,'r','linewidth',2,'markersize',16)
hold on
plot(t,r*exp(0*t),'--r','MarkerSize', 19)
xlabel('$t$ ','FontSize',14,'Interpreter','latex');
ylabel('$x(t)$ ','FontSize',14,'Interpreter','latex');
set(gca,'Fontsize',12)
grid on


%hold off
% figure(11)
% semilogy(t,abs(x-xan),'r','linewidth',2,'markersize',16)
% xlabel('$t$ ','FontSize',24,'Interpreter','latex');
% ylabel('$|x(t)-x_{an}(t)|$ ','FontSize',24,'Interpreter','latex');
% hold off

end
figure(10);hold off



