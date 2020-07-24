clear, clc

imp = false;
dimensions = 100;
matrixMain = zeros(dimensions);
immunity = zeros(dimensions);
day = 100;
numberNewInfections = zeros(1, day);
time = 1:day;
numberNewCurrentInfections = zeros(1, day);



r1 = randi([25,75]);
r2 = randi([25,75]);

[p,q] = size(matrixMain);

matrixMain(r1,r2) = 7;
immunity(r1,r2) = 1;

fprintf('Zombie apocolypse with immunity: 1\n');
fprintf('Zombie apocolypse without immunity: 2\n\n');
prompt = 'Apocolypse selection: ';
x = input(prompt);
if (x == 1) || (x == 2)
    imp = true;
end

while imp == false || isempty(x)
    fprintf('Please enter a valid selection\n');
    x = input(prompt);
    if (x == 1) || (x == 2)
        imp = true;
    end
end

switch x
    case 1
        for days = 1:day
            figure(1);
            image(double(matrixMain));
            colormap(jet(7));    
            pause(0.05)
            
            infected = 0;
            for rows = 1:dimensions
                for column = 1:dimensions
                    if matrixMain(rows, column) ~= 0
                        infected = infected + 1;
                    end
                end
            end
            numberNewCurrentInfections(1, days) = infected;
            
            [out, immunity] = Fractal(matrixMain, immunity);

            [m,n] = size(out);
            x = 0;

            for row = 1:m
                if out(row,1) ~= 0
                    matrixMain(out(row,1), out(row,2)) = 7;
                    immunity(out(row,1), out(row,2)) = 7;
                    x = x +1;
                end
            end
            numberNewInfections(1, days) = x;

            for row = 1:p
                for column = 1:q
                    if matrixMain(row, column) > 0
                        matrixMain(row, column) = matrixMain(row, column) -1;
                    end
                end
            end
        end
        if (days == day)
            fprintf("Apocolypse cycle complete, press any button to view graphical results");
            pause
        end
        
        subplot(2,1,1);
        plot(time, numberNewInfections);
        title('Number of New Infections Each Day');
        xlabel('Day Number');
        ylabel('Number of Infected People');
        
        subplot(2,1,2);
        plot(time, numberNewCurrentInfections);
        title('Number of Current Infections Each Day');
        xlabel('Day Number');
        ylabel('Number of Infected People');
        
    case 2
      for days = 1:day
          figure(1);
          image(double(matrixMain));
          colormap(jet(7));
          pause(0.05)
          
          infected = 0;
          for rows = 1:dimensions
                for column = 1:dimensions
                    if matrixMain(rows, column) ~= 0
                        infected = infected + 1;
                    end
                end
           end
            numberNewCurrentInfections(1, days) = infected;
            [out] = Fractal2(matrixMain);

            [m,n] = size(out);
            x = 0;

            for row = 1:m
                if out(row,1) ~= 0
                    matrixMain(out(row,1), out(row,2)) = 7;
                    x = x +1;
                end
            end
            numberNewInfections(1, days) = x;

            for row = 1:p
                for column = 1:q
                    if matrixMain(row, column) > 0
                        matrixMain(row, column) = matrixMain(row, column) -1;
                    end
                end
            end
      end
      if (days == day)
            fprintf("Apocolypse cycle complete, press any button to view graphical results");
            pause
      end
        
      subplot(2,1,1);
      plot(time, numberNewInfections);
      title('Number of New Infections Each Day');
      xlabel('Day Number');
      ylabel('Number of Infected People');
      
      subplot(2,1,2);
      plot(time, numberNewCurrentInfections);
      title('Number of Current Infections Each Day');
      xlabel('Day Number');
      ylabel('Number of Infected People');
end