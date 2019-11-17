%% Práctica 02

% Universidad Nacional Autónoma de México 
% Facultad de Ingeniería
% Aguilar Enriquez Paul Sebastian
% 415028130
% Temas Selectos de Sistemas Inteligentes - 2020-1

clear variables;
clear global;
close all;

%% Función randn
% Devuelve una matriz de 1x3000 con valores aleatorios de una
% distribución normal estandar

x1 = randn(1,5);
x2 = randn(1,3000);

% Graficamos las matrices
figure;
subplot(1,2,1);
plot(x1); title("randn(1,5)");
subplot(1,2,2)
plot(x2); title("randn(1,3000)");

%% Función rand
% Devuelve una matriz de 1x5 con valores aleatorios entre 0 y 1

x1 = rand(1,5);
x2 = rand(1,3000);

% Graficamos las matrices
figure;
subplot(1,2,1);
plot(x1); title("rand(1,5)");
subplot(1,2,2)
plot(x2); title("rand(1,3000)");

%% Comparativa randn y rand

x1 = randn(1,30000);
x2 = rand(1,3000);

% Graficamos las matrices
figure;
subplot(1,2,1);
plot(x1); title("randn(1,30000)");
subplot(1,2,2)
plot(x2); title("rand(1,30000)");

% Mostramos un histograma de las matrices
figure;
subplot(1,2,1);
histogram(x1); title("Histograma de randn");
subplot(1,2,2)
histogram(x2); title("Histograma de rand");

%% Modificar los valores utilizando randn

% Modificamos la amplitud
x1 = 5 * randn(1,3000);

% Modificamos la media
x2 = 5 * randn(1,3000) - 10;

% Mostramos un histograma de las matrices
figure;
subplot(1,2,1);
histogram(x1); title("5 * randn(1,3000)");
subplot(1,2,2)
histogram(x2); title("5 * randn(1,3000) - 10");

%% Suma de dos distribuciones con mism amplitud

x1 = randn(1,3000);
x2 = randn(1,3000);
x3 = x1 + x2;

% Mostramos un histograma de las matrices
figure;
subplot(1,3,1);
histogram(x1); title("randn(1,3000)");
subplot(1,3,2)
histogram(x2); title("randn(1,3000)");
subplot(1,3,3)
histogram(x3); title("Suma");

%% Suma de dos distribuciones con distinta amplitud

x1 = randn(1,3000);
x2 = 5 * randn(1,3000);
x3 = x1 + x2;

% Mostramos un histograma de las matrices
figure;
subplot(1,3,1);
histogram(x1); title("randn(1,3000)");
subplot(1,3,2)
histogram(x2); title("5 * randn(1,3000)");
subplot(1,3,3)
histogram(x3); title("Suma");

%% Producto de dos distribuciones con distinta amplitud

x1 = randn(1,3000);
x2 = 5 * randn(1,3000) - 10;
x3 = x1 .* x2;

% Mostramos un histograma de las matrices
figure;
subplot(1,3,1);
histogram(x1); title("randn(1,3000)");
subplot(1,3,2)
histogram(x2); title("5 * randn(1,3000) - 10");
subplot(1,3,3)
histogram(x3); title("Producto (.*)");

%% Media y Varianza

% Distribución Gaussiana
x = randn(1,3000);

% Media
m = mean(x);

% Desviación Estandar
s = std(x);

% Varianza
v = s * s;
