function E2k = erlangC(A, k)


if any(A <= 0 | A >= k)
        error('A debe ser positivo y menor que k (0 < A < k).') 
end

E1k = pb(A, k);

E2k = (k.*E1k) ./ (k-(A.*(1-E1k)));

return