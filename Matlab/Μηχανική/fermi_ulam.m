
clear all

global N alpha

alpha=1/4;
N=32;

x=[1:N]';
k=[1:N]';

S=zeros(N);
for ia=1:N
    S(:,ia)=sin(pi*ia*x/(N+1));
    B(ia,:)=2/(N+1)*sin(pi*ia*k'/(N+1));
end
%IS=S^(-1)
   IS=inv(S);

   D2=zeros(N);

   D2=-2*diag(ones(N,1))+diag(ones(N-1,1),1)+diag(ones(N-1,1),-1);

   [ua,sa]=eig(D2);
   sa=diag(sa);
   [sd,ind]=sort(-real(sa));
   sa=sa(ind);ua=ua(:,ind);
   om2=-sa;
   [om2,4*(sin(pi*k/(2*(N+1)))).^2];

   Tp=2*pi/sqrt(om2(1))


   figure(12)
   plot(x,S(:,1),'r',x,S(:,2),'b','linewidth',2)
   xlabel('$x$','Interpreter','latex')
   set(gca,'Fontsize',24)

   a=5;

   %psi=1/(a*sqrt(2*pi))*exp(-(x-N/2).^2/a^2);
   %psi0=1/(a*sqrt(2*pi))*exp(-(x-N/2).^2/a^2);

   psi=0.9*S(:,1);psi0=psi;
   psim=max(psi);
   
   u=[psi;0*psi];
   psidot=0*psi;


   dt=sqrt(1/8);

   Nt=floor(300*Tp/dt);
   tt=zeros(Nt,1);
   ak=IS*psi;dotak=IS*psidot;
   E(:,1)=1/2*(dotak.*dotak+om2.*(ak.*ak));


   for it=2:Nt+6
       t=(it-1)*dt;
       tt(it)=t;
       k1=dt*FPUdot(u,t);
       k2=dt*FPUdot(u+k1/2,t+dt/2);
       k3=dt*FPUdot(u+k2/2,t+dt/2);
       k4=dt*FPUdot(u+k3,t+dt);
       u=u+1/6*(k1+2*k2+2*k3+k4);
       psi=u(1:N);psidot=u(N+1:2*N);
       ak=IS*psi;dotak=IS*psidot;
       
       E(:,it)=1/2*(dotak.*dotak+om2.*(ak.*ak));

   if rem(it,5500)==0
   figure(12)
   plot([0;x;N+1],[0;psi0;0],'k',[0;x;N+1],[0;psi;0],'b',x,psi,'.r','linewidth',2)
   xlabel('$x$','Interpreter','latex')
   ylabel('$\psi$','Interpreter','latex')
   title(['$t=$',num2str(t)],'Interpreter','latex')
   set(gca,'Fontsize',16)
   axis([0 N+1 -psim psim])
   drawnow
   %pause(1)
   
   figure(120)
   plot(tt(1:it)/Tp,E(1,1:it),'k','linewidth',2);hold on
   plot(tt(1:it)/Tp,E(3,1:it),'m','linewidth',2);hold on
   plot(tt(1:it)/Tp,E(5,1:it),'r','linewidth',2);hold on
   plot(tt(1:it)/Tp,E(7,1:it),'g','linewidth',2);hold on
   plot(tt(1:it)/Tp,E(9,1:it),'b','linewidth',2);hold off;
   xlabel('$t$','Interpreter','latex')
   ylabel('$E$','Interpreter','latex')
   set(gca,'Fontsize',16)
   %axis([0 N+1 -psim psim])
   drawnow



   end

   end
figure(120);hold off





















