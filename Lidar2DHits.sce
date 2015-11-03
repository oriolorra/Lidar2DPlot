//Calculate hits to 20cm leg for a Lidar2D

//Define width leg
Lw = (0.1:0.1:0.4)
//Num. elements of Lw vector
szL = length(Lw)

//Vector that will store all vector for each width leg
vectors = list()

//Total of hits in 270º by steps of 0.25º
Th = 270/0.25

//Set up range of the Lidar2D
range = (0.1:0.1:30)
//Num. elements of range vector
sz = length(range)

//Loop for each width leg
for i = 1:szL
    //Loop to create the vector for specific width
    for j = 1:sz
         //Angle in º for each range value
        alpha=(180/%pi)*atan(Lw(i)/range(j))
        //Caculation of hits for each range value
        hits=Th*(alpha/270)
        //Fill vector with values (must be int, it is discrete)
        vecHits(j) = int(hits);
    end;
    //Fill vectors with each vector created
    vectors(i) = vecHits
end

//Draw the four range values
plot (range,vectors(1)','r')
plot (range,vectors(2)','g')
plot (range,vectors(3)','b')
plot (range,vectors(4)','r')

//Write axis-labels and title on the graph
xlabel('Range (m)','fontsize',4)
ylabel ('Laser hits','fontsize',4)
title('Lidar2D graph','fontsize',8,'color','green')
