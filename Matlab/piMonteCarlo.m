N=input('Number of points :');
r=input('Radius of the circle :');
n=0;
for i=1:N
x=-r+2*r*rand ();
y=-r+2*r*rand ();
if ((x^2+y^2) <=r^2)
n=n+1;
end
end
pi_sim =4*n/N
