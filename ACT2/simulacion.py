import numpy as np

k = 5
tea = np.array([0, 0, 0, 0, 0, 0, 0, 3, 1, 0, 20, 2])
tds = np.array([30, 2, 15, 4, 25, 3, 8, 12, 6, 2, 5, 10])

n = np.size(tea)


reloj = np.cumsum(tea)

inicio = np.zeros(n)
salida = np.zeros(n)
servidor = np.zeros(n,dtype=int)
servidor_k = np.zeros(k)


index = 0


while index < n:
    
    
    
    
    servidor[index] = np.argmin(servidor_k)
    
    
    if (reloj[index] >= servidor_k).any():
        inicio[index] = reloj[index]
    else:
        
        inicio[index] = servidor_k[servidor[index]]
        
    salida[index] = inicio[index] + tds[index]
    
    servidor_k[servidor[index]] = salida[index]
    
    index += 1
    
    
esperas = inicio - reloj


print("tea", tea,
      "\ntds", tds,    
      "\nReloj", reloj,
      "\nServidor", servidor,
       "\nInicio", inicio,
       "\nSalida", salida,
       "\n",
       "\nServidor_k", servidor_k,
       "\nEsperas", esperas)
