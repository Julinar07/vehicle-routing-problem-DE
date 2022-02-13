function miles = TravelDistance(r1,r2,r3,r4,distance)
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

end