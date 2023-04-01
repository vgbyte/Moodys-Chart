%For Turbulent flow
l=log10(2300);
Re=logspace(l,8,500); %For 2300<Re
e=[1*10^-2 2*10^-2 1*10^-3 1*10^-4 1*10^-5];    %Relative Roughness
error=1*10^-6; %Maximum permissible error

for i=1:5
    for j=1:500
        x=5;
        xold=x;
        for k=1:50
            %Using Newton Raphson method for colebrook equation
            g=(x-1.14+2*log10(e(i)+9.3*x/Re(j)));
            dg=(1+(2*9.3)/(2.303*Re(j)*(e(i)+9.3*x/Re(j))));
            x=x-g/dg;
            err=abs(x-xold);
            xold=x;
            if(err<error)
                break
            end
        end
        f(i,j)=x^-2;
    end
end
plot(Re,f(:,:),'m'); %Plotting graph of Turbulent Region
ylim([0 0.1])
hold on

%%For Laminar flow
a=linspace(1,2300,2000); %For 1<Re<2300
b=64*a.^-1;
plot(a,b,'r');   %Plotting graph of Laminar Region
set(gca, 'XScale', 'log')    %Changing nature of graph to Semilog
xlabel('Reynolds Number (Re)'); 
ylabel('Frictional factor (f)');
grid on             %Adding grids to graph  
lgd=legend('0.01','0.02','0.001','0.0001','0.00001'); 
title(lgd,'Relative Roughness(e/D)') %Adding title to information