m=1;
g=1;
R=1;
r=0:0.0001:10;
theta_0=pi/3;
Veff=m*g*R*cos(theta_0)*(r.^(-2)*(R^2/2)+r*R^(-1));
y=Veff/(m*g*R*cos(theta_0));
r1=r/R;
plot(r1,y,'b')
xlim([0, 4])
ylim([0, 5])
xlabel('$r/R$','Interpreter','latex'), ylabel('$V_{\textrm{eff}}/mgR\cos\theta_0$','Interpreter','latex')