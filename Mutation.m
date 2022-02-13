function v = Mutation(xp,xq,xr,F,lb,ub)
% Mutation formula (little bit modification)
start_v = round(abs(xp + F*(xq - xr)));

% Prevent out from boundary
for i=1:length(start_v)
    if start_v(i) < lb
        start_v(i) = lb;
    elseif start_v(i) > ub
        start_v(i) = ub;
    end
end

% Check one time visiting
x=1;                                                        % Counter loop
while x>0
    % Checking which customer is missing
    k=1;
    for j=1:ub
        Z = find(start_v==j);
        h = length(Z);
        if h==0
            missing(k) = j;
            k=k+1;
        end
    end
    
    % Replace duplicate customer in path with missing one
    m=1;
    for c=1:ub
        Z = find(start_v==c);
        h = length(Z);
        if h>1
            start_v(Z(h))=missing(m);
            m=m+1;
        end
    end
    [comp,ia] = unique(start_v,'stable');
    same = ones(size(start_v));
    same(ia) = 0;
    x = sum(same);
end

v = start_v;

end