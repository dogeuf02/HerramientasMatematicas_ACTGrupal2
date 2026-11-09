function p = pb(A,k)

    p = A./(1+A);

    for n = 2:k
            p = A.*p./(n+A.*p);
    end
end