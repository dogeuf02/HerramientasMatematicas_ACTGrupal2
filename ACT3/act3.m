figure(1);
usuarios = 100000;
lambda = 1;
k = 5;
simulaciones = 20; % # de comparaciones

% Resultado Teórico: E[Tw]
A = linspace(0.05,0.95*k,100000); % cambiar el 0.95 por el A sugerido en clase
mu = lambda./A;

Ptw = zeros(1,length(A));

for i = 1:length(A)
    Ptw(i) = erlangC(A(i),k);

end

teorico = Ptw./(mu.*(k-A));

 % usar el valor teórico según la cola asignada

superplot(A,teorico);
hold on;

% Resultado de Simulación: Twpromedio
A = linspace(0.05,0.95*k,simulaciones); % cambiar el 0.95 por el A sugerido en clase
mu = lambda./A;

resultadosimulacion = zeros(1,simulaciones);
for n = 1:simulaciones
    tea = exprnd(1/lambda,1,usuarios);
    tds = exprnd(1/mu(n),1,usuarios);
    resultadosimulacion(n) = simularErlangC(tea, tds, k); % usar su función 
end

superstem(A,resultadosimulacion,'Tiempos Promedios de Espera',...
    '$\frac{\lambda}{k\mu}$','$E[T_w],\:\overline{T_w}$');
xlim([0.05,0.95*k]); % Se debe cambiar el 0.95, por el límite sugerido en la línea 13
hold off;

legend({'Teórico','Simulación'},'Location','northwest');