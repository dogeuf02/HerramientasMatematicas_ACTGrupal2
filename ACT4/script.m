% =========================================================================
% ACTIVIDAD 4 - EJEMPLO COMPLETO PARA AGOSTO (BCpaug89.TL)
% =========================================================================

clear;
clc;
close all;

intr_min = -0.001;
intr_max =  0.25;

% 1. Cargar datos y calcular tiempos entre arribos (TEA)
datos = load('BCOct89Ext.TL'); 
muestra = diff(datos(:, 1)');

% 2. Crear la función generadora (crea 'agostornd.m')
superfuncion(muestra, 'BCOct89Ext_superfun');
rehash;

% 3. Generar muestra sintética
muestra_sintetica = BCOct89Ext_superfun(1, 1000000);

% 4. Graficar ambas en una sola figura sobrepuesta
figure(1);
clf;
set(gcf, 'Color', 'w');

% Dibujar la primera traza (Muestra Real)
pdfcdfcontinua(muestra, intr_min, intr_max);

% Capturar los dos subplots creados por pdfcdfcontinua
axes_handles = findobj(gcf, 'Type', 'axes'); 
% MATLAB suele listar los axes en orden inverso: [subplot2, subplot1]
ax_cdf = axes_handles(1); 
ax_pdf = axes_handles(2);

% Activar hold en ambos subplots
hold(ax_pdf, 'on');
hold(ax_cdf, 'on');

% Dibujar la segunda traza (Muestra Sintética)
pdfcdfcontinua(muestra_sintetica, intr_min, intr_max);

% Modificar estilos: identificar las líneas dibujadas
lineas_pdf = findobj(ax_pdf, 'Type', 'line');
lineas_cdf = findobj(ax_cdf, 'Type', 'line');

% La línea más reciente (sintética) se pone roja discontinua
set(lineas_pdf(1), 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.4);
set(lineas_cdf(1), 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1.4);

% La línea previa (real original) se deja azul sólida
set(lineas_pdf(2), 'Color', 'b', 'LineStyle', '-', 'LineWidth', 1.8);
set(lineas_cdf(2), 'Color', 'b', 'LineStyle', '-', 'LineWidth', 1.8);

% Agregar leyendas a cada subplot
legend(ax_cdf, {'Generador Empírico', 'Traza Original'}, 'Location', 'northeast');
legend(ax_pdf, {'Generador Empírico', 'Traza Original'}, 'Location', 'southeast');

hold(ax_pdf, 'off');
hold(ax_cdf, 'off');



figure(2)

qqplot(muestra_sintetica, muestra)


% rehash; % Para que MATLAB reconozca la nueva función de inmediato
% 
% % 3. Generar 1 millón de datos con la función recién creada
% muestra_sintetica = agostornd(1, 1000000);
% 
% % =========================================================================
% % FIGURA 1: PDF Y CDF SUPERPUESTAS (Reales vs. Generador)
% % =========================================================================
% figure(1);
% clf;
% set(gcf, 'Color', 'w');
% 
% % Graficar la muestra real
% pdfcdfcontinua(muestra_real, -0.001, 0.006);
% hold on;
% 
% % Graficar encima la muestra del generador para comparar
% pdfcdfcontinua(muestra_sintetica, -0.001, 0.006);
% 
% % Ajustar títulos y leyendas
% subplot(2, 1, 1);
% title('Densidad de Probabilidad (PDF): Reales vs. agostornd', 'FontSize', 11, 'FontWeight', 'bold');
% legend({'Traza Original', 'Generador Empírico'}, 'Location', 'northeast');
% 
% subplot(2, 1, 2);
% title('Distribución Acumulada (CDF): Reales vs. agostornd', 'FontSize', 11, 'FontWeight', 'bold');
% legend({'Traza Original', 'Generador Empírico'}, 'Location', 'southeast');
% hold off;
% 
% % =========================================================================
% % FIGURA 2: QQ-PLOT (Ajuste Cuantil-Cuantil)
% % =========================================================================
% figure(2);
% clf;
% set(gcf, 'Color', 'w');
% 
% % En clase el profesor mostró el qqplot comparando el generador con la muestra original:
% qqplot(muestra_sintetica, muestra_real);
% grid on;
% title('QQ-Plot: agostornd vs. Traza Real Original', 'FontSize', 11, 'FontWeight', 'bold');
% xlabel('Cuantiles de la Traza Original (s)', 'FontSize', 10);
% ylabel('Cuantiles del Generador agostornd (s)', 'FontSize', 10);