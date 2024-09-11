%计算种群个体适应度

fitness_value = zeros(pop_size,1);

for i=1:pop_size
    fit_value = cacl_fitness(pop(i,:));
    fitness_value(i)= fit_value;
end

clear i;
clear j;

function value = cacl_fitness(w)
    ratioA=1-(-1.121+37.970*w(4)-258.570*w(4)^2+640.944*w(4)^3);    
    valueA=3*w(1)*ratioA*w(4);
    ratioB=1-(-1.017+33.995*w(5)-225.051*w(5)^2+552.829*w(5)^3);
    valueB=57*w(2)*ratioB*(w(5)*0.97-0.03);
    ratioC=1-(-0.973+32.157*w(6)+207.386*w(6)^2+504.717*w(6)^3);
    valueC=70*w(3)*ratioC*(w(6)*0.94-0.06);
    value=valueA+valueB+valueC;
    if 3*w(1)+57*w(2)+70*w(3)>1e8
    value = value - 1e5*(3*w(1)+57*w(2)+70*w(3)-1e8);
    end
    if w(4)>w(5)
        value = value - 1e6*(w(4)-w(5));
    end
    if w(5)>w(6)
        value = value - 1e6*(w(5)-w(6));
    end
end
