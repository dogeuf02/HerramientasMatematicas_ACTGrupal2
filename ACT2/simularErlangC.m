function [ETw, esperas] = simular_erlangC(tea, tds, k)
    % Función de simulación por eventos para Erlang C (M/M/k/inf)
    % Entradas:
    %   tea : Tiempos entre arribos
    %   tds : Tiempos de servicio
    %   k   : Número de servidores
    % Salidas:
    %   ETw     : Tiempo medio de espera estimado (mean(esperas))
    %   esperas : Vector de tiempos de espera individuales

    n = length(tea);
    reloj = cumsum(tea);
    inicio = zeros(1, n);
    salida = zeros(1, n);
    servidor = zeros(1, n);
    servidor_k = zeros(1, k);

    index = 1;
    while index <= n

        [~, servidor(index)] = min(servidor_k);
        
        if any(reloj(index) >= servidor_k)
            inicio(index) = reloj(index);
        else
            inicio(index) = servidor_k(servidor(index));
        end
        
        salida(index) = inicio(index) + tds(index);
        servidor_k(servidor(index)) = salida(index);
        index = index + 1;
    end

    esperas = inicio - reloj;
    ETw = mean(esperas);
end