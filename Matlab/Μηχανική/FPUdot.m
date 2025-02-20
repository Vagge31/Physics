

function df=FPUdot(u,~)

global N  alpha
%u = [psi;dot psi]
df1=zeros(N,1);
psi=u(1:N);psidot=u(N+1:2*N);

df1(1:N)=psidot;

df2=zeros(N,1);

df2(1)=psi(2)-2*psi(1) + alpha*((psi(2)-psi(1))^2-(psi(1))^2);
df2(N)=psi(N-1)-2*psi(N) + alpha*((psi(N))^2-(psi(N)-psi(N-1))^2);

for ia=2:N-1
    df2(ia)=psi(ia+1)+psi(ia-1)-2*psi(ia) + alpha*((psi(ia+1)-psi(ia))^2-(psi(ia)-psi(ia-1))^2);
end
% 


    df=[df1;df2];



