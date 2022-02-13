function [dis, who] = MinimumDistance(distance,path,capacity,demand)
% Dividing route
for q=1:3
    switch q
        case 1
            route1 = path(1:4); dem1 = sum(demand(route1));
            route2 = path(5:7); dem2 = sum(demand(route2));
            route3 = path(8:10); dem3 = sum(demand(route3));
            route4 = path(11); dem4 = sum(demand(route4));
            % Check if demand larger than capacity each route
            if dem1<capacity && dem2<capacity && dem3<capacity && dem4<capacity
                counter=1;
            else
                counter=0;
            end
            % Check distance
            if counter==1
                travel1 = TravelDistance(route1,route2,route3,route4,distance);
            else
                travel1 = 1e4;
            end
        case 2
            route1 = path(1:4); dem1 = sum(demand(route1));
            route2 = path(5:7); dem2 = sum(demand(route2));
            route3 = path(8:9); dem3 = sum(demand(route3));
            route4 = path(10:11); dem4 = sum(demand(route4));
            % Check if demand larger than capacity each route
            if dem1<capacity && dem2<capacity && dem3<capacity && dem4<capacity
                counter=1;
            else
                counter=0;
            end
            % Check distance
            if counter==1
                travel2 = TravelDistance(route1,route2,route3,route4,distance);
            else
                travel2 = 2e4;
            end
        case 3
            route1 = path(1:3); dem1 = sum(demand(route1));
            route2 = path(4:6); dem2 = sum(demand(route2));
            route3 = path(7:9); dem3 = sum(demand(route3));
            route4 = path(10:11); dem4 = sum(demand(route4));
            % Check if demand larger than capacity each route
            if dem1<capacity && dem2<capacity && dem3<capacity && dem4<capacity
                counter=1;
            else
                counter=0;
            end
            % Check distance
            if counter==1
                travel3 = TravelDistance(route1,route2,route3,route4,distance);
            else
                travel3 = 3e4;
            end
    end
end

option = [travel1 travel2 travel3];
[dis, who] = min(option);
end