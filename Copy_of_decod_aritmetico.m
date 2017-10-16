function [simbolos] = decod_aritmetico(cadena_bin, nbits)

%Aiixo ho passes per parametre o ho saps
%Probabilidades de los 7 simbolos del alfabeto
prob = [0.05, 0.2, 0.1, 0.1, 0.3, 0.2, 0.05];

acum = zeros(1,length(prob)+1);
acum(1) = 0;
for i = 2:length(prob)+1
    acum(i) = acum(i-1) + prob(i-1);
end

punt_mig = bin2dec(cadena_bin);
punt_mig = punt_mig/(2^nbits)
next_simbolo = 0;
j = 1;

while next_simbolo~=7
    
    for i = 1:length(acum)-1
       if punt_mig > acum(i)
           next_simbolo = i;
       end
    end
    %El primer simbolo que se envia es next_simbolo
    punt_mig = (punt_mig - acum(next_simbolo))/(acum(next_simbolo+1)-acum(next_simbolo));
    disp('\nPunto medio: ');
    fprintf(1,'%f\n',punt_mig);
    simbolos(j) = next_simbolo;
    j = j+1;
    
end

end
