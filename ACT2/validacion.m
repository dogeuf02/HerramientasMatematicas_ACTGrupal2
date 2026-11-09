% Parámetros del sistema
lambda = 4;   % Tasa de arribos (clientes por unidad de tiempo)
mu = 2;       % Tasa de servicio por servidor
k = 3;        % Servidores en paralelo
N = 10000;    % Total de clientes a simular

% Generación de tiempos exponenciales
tea = exprnd(1/lambda, 1, N);
tds = exprnd(1/mu, 1, N);

% Ejecución
[ETw, esperas] = simularErlangC(tea, tds, k);

fprintf('Tiempo medio de espera en cola (Wq): %.4f\n', ETw);