A_base = [0.2, 0.5, 0.8];
k_base = 1;

    for i = 1:length(A_base)
        P_esp = erlangC(A_base(i), k_base);
        fprintf('A = %4.1f | k = %3d | P(espera) = %8.4f\n', ...
                A_base(i), k_base, P_esp);
    end


pruebas = [
    2.0,   3;
    2.0,   5;
    2.0,  10;
    4.0,   5;
    4.0,  10;
    4.0,  20;
    4.0,  40;
    4.0, 200
];

    for i = 1:size(pruebas, 1)
        A_val = pruebas(i, 1);
        k_val = pruebas(i, 2);
        P_esp = erlangC(A_val, k_val);
        fprintf('A = %4.1f | k = %3d (Cumple A < k) -> P(espera) = %.4e\n', ...
                A_val, k_val, P_esp);
    end