r1=[8 9 10 11];
r2=[2 4 3];
r3=[6 7 1];
r4=[5];

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

custom1 = length(r1);
custom2 = length(r2);
custom3 = length(r3);
custom4 = length(r4);
dis1=0; dis2=0; dis3=0; dis4=0;

% Calculate route 1
for i=1:custom1+1
    if i==1
        dis1 = dis1+distance(1,r1(1)+1);
    elseif i==custom1+1
        dis1 = dis1+distance(r1(custom1)+1,1);
    else
        dis1 = dis1+distance(r1(i-1)+1,r1(i)+1);
    end
end

% Calculate route 2
for i=1:custom2+1
    if i==1
        dis2 = dis2+distance(1,r2(1)+1);
    elseif i==custom2+1
        dis2 = dis2+distance(r2(custom2)+1,1);
    else
        dis2 = dis2+distance(r2(i-1)+1,r2(i)+1);
    end
end

% Calculate route 3
for i=1:custom3+1
    if i==1
        dis3 = dis3+distance(1,r3(1)+1);
    elseif i==custom3+1
        dis3 = dis3+distance(r3(custom3)+1,1);
    else
        dis3 = dis3+distance(r3(i-1)+1,r3(i)+1);
    end
end

% Calculate route 4
for i=1:custom4+1
    if i==1
        dis4 = dis4+distance(1,r4(1)+1);
    elseif i==custom4+1
        dis4 = dis4+distance(r4(custom4)+1,1);
    else
        dis4 = dis4+distance(r4(i-1)+1,r4(i)+1);
    end
end

miles = dis1 + dis2+ dis3 + dis4;