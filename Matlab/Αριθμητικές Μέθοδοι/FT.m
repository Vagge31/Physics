% Υπολογισμός του Μετασχηματισμού Fourier μιας συνάρτησης f(x)
clear

Lx = 20;          
Nx = 2^(20);        
x = linspace(-Lx, Lx, Nx); 
dx = Lx / Nx;
x_0=0;
sigma_0=linspace(0.5,10,5);

for i=1:length(sigma_0)
    sigma=sigma_0(i);
psi =(1/(pi^(1/4)*sigma^(1/2)))*exp(-(x-x_0).^2/(2*sigma^2));

F = fft(psi); 
F = fftshift(F);
F = F * dx;

kx = 2*pi/Lx * (-Nx/2:Nx/2-1); 

psiabs = (abs(F)).^2; 

figure(3)

hold on;

plot(x, (abs(psi)).^2,'r','linewidth', 2);
xlabel('$x$','Interpreter','Latex');
ylabel('$|\psi(x)|^2$','Interpreter','Latex');
xlim([-10 10])
set(gca,'Fontsize',14)
grid on;



figure(4)
hold on;
plot(kx, psiabs,'b','linewidth', 2);
xlabel('$k$','Interpreter','Latex');
ylabel('$|\hat{\psi}(k)|^2$','Interpreter','Latex');
xlim([-10 10])
set(gca,'Fontsize',14)
grid on;
end
figure(3);
hold off;
figure(4);
hold off;

