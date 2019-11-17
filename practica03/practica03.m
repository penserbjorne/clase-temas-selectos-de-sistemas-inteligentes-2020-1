%% Práctica 03

% Universidad Nacional Autónoma de México 
% Facultad de Ingeniería
% Aguilar Enriquez Paul Sebastian
% 415028130
% Temas Selectos de Sistemas Inteligentes - 2020-1

clear variables;
clear global;
close all;

%% Valores iniciales (hipotesis)
values = [ 1,2; 2,4; 3,5.8];
learningRate = 0.1;
theta = 1;

%% Variables para la función

% m es la cantidad de puntos
m = 3;
delta = 0.001;
n_iter = 20;
thetas = zeros([(n_iter+1) 1]);
thetas(1) = theta;

%% Función de costo
for it=1:n_iter
    % Funcón de costo
    sum = 0;
    for i=1:m
        sum = sum + ( ( (thetas(it) * values(i,1)) - values(i,2) ) * values(i,1)) ;
    end
    thetas(it+1) = thetas(it) - ( (learningRate/m) * sum );
    diff = thetas(it + 1) - thetas(it);
    if diff <= delta
        break;
    end
end

disp(thetas);