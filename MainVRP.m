% Undergraduate Thesis VRP using Differential Evolution
clc; clear; close all, format longg;

% Initialization
Np=30;                                                  % Number of generate population
capacity = 600;                                         % Vehicle capacity
lb = 1;                                                 % Lower bound
ub = 11;                                                % Upper bound
PCr = 0.5;                                              % Crossover probability
F = 0.8;                                                % Mutation rate
d = lb;                                         % Dimension
T = 500;                                                % Maximum iterations
vecX = zeros(Np,ub);
test = 100;
BestAll = zeros(test,ub+2);

distance = [0 18 29.4 24.8 88.3 191 110 147 61.8 274 345 346; ...
    18 0 32.5 28.2 90.7 194 113 150 50.1 321 348 349; ...
    29.4 32.5 0 42.1 61.3 165 127 164 79 334 362 363;...
    24.8 28.2 42.1 0 97.8 202 88.4 125 54.1 296 323 325;...
    88.3 90.7 61.3 97.8 0 202 183 219 135 390 417 419;...
    191 194 165 202 202 0 286 322 239 949 520 522;...
    110 113 127 88.4 183 286 0 30.1 111 219 245 246;...
    147 150 164 125 219 322 30.1 0 147 183 211 212;...
    61.8 50.1 79 54.1 135 239 111 147 0 214 345 346;...
    274 321 334 296 390 949 219 183 214 0 55.7 54.4;...
    345 348 362 323 417 520 245 211 345 55.7 0 6.5;...
    346 349 363 325 419 522 246 212 346 54.4 6.5 0];

demand = [200 220 180 180 200 150 160 110 110 160 140];

for p=1:test
    % Generate Population (Route)
    customer = lb:1:ub;
    for k = 1:Np
        vecX(k,:) = customer(randperm(numel(customer)));
    end

    % DE Process
    for n = 1:T
        for i=1:Np
            id = randi(Np,3,1);                                % Selecting 3 random vector
            xp = vecX(id(1),:);
            xq = vecX(id(2),:);
            xr = vecX(id(3),:);
            v = Mutation(xp,xq,xr,F,lb,ub);                    % Create vector mutation
            Jr = randi(d);
            r = rand();

            % Crossover
            for j = 1:d
                if r <= PCr || j == Jr
                    u = v;
                else
                    u = vecX(i,:);
                end
            end

            % Checking distance
            [FitReal, optReal] = MinimumDistance(distance,vecX(i,:),capacity,demand);

            [FitCros, optCros] = MinimumDistance(distance,u,capacity,demand);

            % Selection
            if FitCros <= FitReal
                vecX(i,:) = u;
                FitReal = FitCros;
                optReal = optCros;
            end
            SaveOpt(i)=optReal;
            SaveDistance(i,1)=FitReal;
        end
        [num,loc] = min(SaveDistance);
        Xest = vecX(loc,:);
        DistHist(n,1) = num; 
    end
    save = [Xest num SaveOpt(loc)];
    BestAll(p,:) = save;
    fprintf('Iterasi ke-%3d telah dijalankan\n',p);
end