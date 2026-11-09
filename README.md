# Herramientas Matemáticas para el Manejo de la Información (2026-3)
## Segundo Trabajo Grupal - Simulación de Colas

**Modelo Asignado:** Erlang C ($M/M/k/\infty/\infty$)  
**Medida de Desempeño:** Tiempo medio de espera en cola ($E[T_w]$)

---

### Estructura del Repositorio

- **`ACT1/`**: Modelo matemático de la cola Erlang C.
  - Diagrama de transición de estados (`Erlang_C_Diagram.drawio.png`).
  - Documento LaTeX y PDF con el planteamiento de ecuaciones de estado estacionario y deducción de $P_n$ y $P_0$.
- **`ACT2/`**: Herramienta de simulación.
  - Función de simulación en MATLAB (`simularErlangC.m`).
  - Script de validación (`validacion.m`).
  - Prototipo de prueba en Python (`simulacion.py`).
  - Diagrama de flujo del algoritmo multi-servidor (`diagramaFlujoMMK.png`).
- **`ACT3/`**: Verificación y comparación empírica vs. teórica.
  - Script de simulación y contraste teórico (`act3.m`).
  - Funciones de cálculo analítico de Erlang B y Erlang C (`pb.m`, `erlangC.m`).
  - Generador empírico por cuantiles (`superfuncion.m`).
  - Subcarpeta `Tarea13/` con la deducción analítica de la relación entre Erlang B y Erlang C y tablas de verificación.
- **`HM20263trabajo2.pdf`**: Enunciado y rúbrica oficial de la actividad.
