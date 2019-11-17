% Universidad Nacional Autónoma de México 
% Facultad de Ingeniería
% Aguilar Enriquez Paul Sebastian
% 415028130
% Temas Selectos de Sistemas Inteligentes - 2020-1

%% Ejercicio 0, Simuladores
nnd4db;
nnd4pr;

%% Ejercicio 1, Perceptrón de entradas de dos dimensiones

clear variables;
clear global;
close all;

% Creamos un nuevo perceptrón que tendra entradas en dos dimensiones,
% la primera dimensión tiene valores de 0 a 1 y la segunda de -2 a 2
net = newp([0 1; -2 2],1);

%  Los puntos de entrada, 4 de 2 dimensiones
P = [0 0 1 1; 0 1 0 1];

% Las etiquetas o 'targets' para cada punto
T = [0 1 1 1];

% Vemos los valores actuales asignados a la red dada la entrada P
Y = net(P)

% Asiganmos la cantidad de epocas para el entrenamiento, en este caso 20
net.trainParam.epochs = 20;

% Entrenamos la red con los puntos P y las etiquetas T
net = train(net,P,T);

% Vemos los valores actuales de las salidas despues del entrenamiento
Y = net(P)

%% Ejercicio 2,  Perceptrón de entradas de tres dimensiones

clear variables;
clear global;
close all;

% Creamos un nuevo perceptrón que tendra entradas en tres dimensiones,
% las tres dimensiones tienen valores de -1 a 1
net = newp([-1 1; -1 1; -1 1],[0 1]);

%  Los puntos de entrada, 2 de 3 dimensiones
P = [1 -1 -1; 1 1 -1];

% Las etiquetas o 'targets' para cada punto
T = [0 1];

% Pesos iniciales
W = initzero(1, [1 -1 -0.5]);

% Bias inicial
B = initzero(1, [1]);

% Vemos los valores actuales asignados a la red dada la entrada P
Y = net(P')

% Asiganmos la cantidad de epocas para el entrenamiento, en este caso 10
net.trainParam.epochs = 10;

% Entrenamos la red con los puntos P y las etiquetas T
net = train(net,P',T);

% Vemos los valores actuales de salidas despues del entrenamiento
Y = net(P')

% Valores actuales del bias despues del entrenamiento
bias = net.b{1}

% Valores actuales de los pesos despues del entrenamiento
pesos = net. IW{1,1,1}

% Definimos dos entradas distintas para una simulación o 'test'
P2 = [1 0 -1; 1 0 -1];
P3 = [1 -1 0; 0 1 -1];

% Hacemos la simulación o 'test' con las entradas anteriores y la red
% entrenada
a = sim(net, P')
b = sim(net, P2')
c = sim(net, P3')

%% Ejercicio 3, Graficación de un clasificador basado en un perceptrón

clear variables;
clear global;
close all;

%  Los puntos de entrada, 4 de 2 dimensiones
P = [ -0.5 -0.5 +0.3 -0.1; ...
      -0.5 +0.5 -0.5 +1.0];

% Las etiquetas o 'targets' para cada punto
T = [1 1 0 0];

% Graficamos los puntos P dadas sus etiquetas T
plotpv(P, T);

% Creamos un nuevo perceptrón que tendra entradas en dos dimensiones,
% ambas dimensiones van de -1 a 1
net = newp([-1 1; -1 1], 1);

% Graficamos los puntos P dadas sus etiquetas T
plotpv(P, T);

% Graficamos la recta del clasificar
plotpc(net.IW{1}, net.b{1});

% Asiganmos la cantidad de epocas para el entrenamiento, en este caso 10
net.adaptParam.passes = 3;

% Adaptamos (entrenamos) la red neuronal con los valores de entrada
net = adapt(net, P, T);

% Gráficamos la recta del clasificador despues de entrenar
plotpc(net.IW{1}, net.b{1});

% Definimos un nuevo punto de entrada
p = [0.7; 1.2];

% Hacemos una prueba con la red entrenada y el punto definido
a = sim(net, p);

% Graficamos los puntos etiquetados con respectos a las salidas
plotpv(p, a);
point = findobj(gca, 'type', 'line');
set(point, 'Color', 'red');

% Graficamos la recta del clasificar
hold on;
plotpv(P, T);
plotpc(net.IW{1}, net.b{1});
hold off;

%% Ejercicio 4, feed-forward backpropagation network

clear variables;
clear global;
close all;

% Definimos los puntos de entrada
P = [1 2; 2 0; 4 2; 4 4; 6 4; 2 -3; 6 -2; -2 1; -4 0; -4 2; -4 -3; -6 4;...
    1 3; 2 4; 4 6; 6 8; -2 5; -2 7; -4 4; -5 5;]
P2 = [1 2.5; 2 0.5; 4 2.5; 4 4.5; 6 4.5; 2 -3.5; 6 -2.5; -2 1.5; -4 0.5; -4 2.5; -4 -3.5; -6 4.5;...
    1.5 3; 2.5 4; 4.5 6; 6.5 8; -2.5 5; -2.5 7; -4.5 4; -5.5 5;]

% Definimos las etiquetas para los puntos
T = [1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1; 1;...
 0; 0; 0; 0; 0; 0; 0; 0;]

% Creamos una nueva red que tendra entradas en dos dimensiones,
% ambas dimensiones van de -8 a 8, las etiquetas de 0 a 1 y tendra dos
% capas
net = newff([-8 8; -8 8], [0 1], 2);

% Definimos las epocas para el entrenamiento
net.trainParam.epochs = 10000;

% Definimos el error para ele ntrenamiento
net.trainParam.goal = 0.0001;

% Definimos el learning rate para el aprendizaje
net.trainParam.lr = .5;

% Entrenamos la red con los puntos y las etiquetas previas
net = train(net, P', T');

% Vemos la salida de la red
out = net(P')

% Vemos el error actual en la red
errors = out - T'

% Vemos el performance de nuestra red dadas sus salidas y las etiquetas
% previas
perf = perform(net, out, T')

% Hacemos dos pruebas para dos conjutnos de puntos distintos
a = sim(net, P')
b = sim(net, P2')

% Graficamos los puntos y las rectas del clasificador
figure;
subplot(1, 2, 1);
plotpv(P', round(a));

point = findobj(gca, 'type', 'line');
set(point, 'Color', 'red');
hold on;
plotpc(net.IW{1}, net.b{1});
hold off;

subplot(1,2, 2);
plotpv(P2', round(b));

point = findobj(gca, 'type', 'line');
set(point, 'Color', 'red');
hold on;
plotpc(net.IW{1}, net.b{1});
hold off;