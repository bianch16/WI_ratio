power_ant = zeros(11,1);
for i  = 2:12
    if i>=10
filename = strcat('C:\Users\xyzhang\Desktop\chenghong\base_station\x3d\bs_simulation.pg.t001_',num2str(i),'.r001.p2m');
    else
filename = strcat('C:\Users\xyzhang\Desktop\chenghong\base_station\x3d\bs_simulation.pg.t001_0',num2str(i),'.r001.p2m');
    end

    file = fopen(filename)
    
    % first remove the discriptions of the files
    while true
        line = fgetl(file);
        if line(1) ~= '#'
            break;
        end
    end
    % begin reading the p2m file 
 
    power = zeros(1,64);
    for user = 1:64
       line = str2num(line);
       power(1,user) = 10^(line(6)/10);       
       line = fgetl(file); 
    end
    power_ant(i-1,1) = mean(power);
    
    save('power.mat','power_ant');
    fclose(file);
end


real_min_power =min(power_ant);
real_max_power = max(power_ant);
ratio = log2(1+real_max_power)/log2(1+real_min_power)
ratio_fraction = log2(1+power_ant(5))/log2(1+power_ant(11))


