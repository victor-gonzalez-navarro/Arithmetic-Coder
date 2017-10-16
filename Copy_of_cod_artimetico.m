function [cadena_bin, nbits] = cod_artimetico(prob, simbolos)

%El que li has de passar per parametre:
%Probabilidades de los 7 simbolos del alfabeto
prob = [0.05, 0.2, 0.1, 0.1, 0.3, 0.2, 0.05];
%Cadena a codificar. Simbolo 7 es EOF
simbolos = [2, 2, 3, 3, 5, 5, 6, 7];

cota_sup = 1;
cota_inf = 0;
punt_mig = (cota_sup + cota_inf)/2;
llargada = cota_sup - cota_inf;

acum = zeros(1,length(prob)+1);
acum(1) = 0;
for i = 2:length(prob)+1
    acum(i) = acum(i-1) + prob(i-1);
end

for i = 1:length(simbolos)
   
   cota_inf = cota_inf + llargada*acum(simbolos(i));
   llargada = llargada*prob(simbolos(i));
   cota_sup = cota_inf + llargada;
   %punt_mig = (cota_sup + cota_inf)/2;
   disp('\nCota inferior y superior: ');
   fprintf(1,'%f\n',cota_inf);   
   fprintf(1,'%f\n',cota_sup);
   
end

punt_mig = (cota_sup + cota_inf)/2; %%% Víctor

nbits = ceil(1-log2(llargada));
cadena_bin = dec2bin(floor(punt_mig*(2^nbits)), nbits);

end