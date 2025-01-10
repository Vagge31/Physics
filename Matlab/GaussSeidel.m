A = [10 8 9 3; 3 11 4 7; 4 4 11 8; 7 1 1 10];
b = [217; 162; 99; -53];
X0 = [0; 0; 0; 0];

% Επανάληψη Gauss-Seidel
X = X0;
for k = 1:2
    for i = 1:length(X)
        X(i) = (b(i) - sum(A(i, 1:i-1) * X(1:i-1)) - sum(A(i, i+1:end) * X0(i+1:end))) / A(i, i);
    end
    X0 = X;
end

% Εκτύπωση του αποτελέσματος
disp('Η λύση μετά από δύο επαναλήψεις της μεθόδου Gauss-Seidel:');
disp(X(1));