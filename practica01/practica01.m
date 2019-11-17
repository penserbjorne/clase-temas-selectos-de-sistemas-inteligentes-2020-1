%%% Ejercicio 1
str = "Ejercicio 1"
x = [-5, 3, 8, -10]
figure();
plot(x);
xlabel('Tiempo');
ylabel('Amplitud');
annotation('textarrow','String','Sube');
%annotation('textarrow','String','Baja');

%%% Ejercicio 2
str = "Ejercicio 2"
A = [1, 3, -3; 4, 5, 0; -1, 2, 4]
B = [-1, 3, 0]

% Transpuesta
str = "Transpuesta de A"
transpose(A)

% Inversa
str = "Inversa de A"
inv(A)

% Determinante
str = "Determinante de A"
det(A)

% Traza
str = "Traza de A"
trace(A)

% Vector Propio
str = "Vector propio de A"
eig(A)

% v.p. (Valores propios)
str = "Valores propios de A"
[V,D] = eig(A)

% Av=B
str = "Solucion de Av=B"
v = B * inv(A)

%%% Ejercicio 3
str = "Ejercicio 3"
r = rand(1000,1);
rn = randn(1000,1);
figure();
subplot(2,1,1);
plot(r);
subplot(2,1,2);
plot(rn);
