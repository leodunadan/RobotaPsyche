# RobotaPsyche
## February 8th - Assignment 1
I struggled a lot with the vector funtions (velocity.add and all those)and had to get back to Daniel's Youtube videos multiple times and I managed to get a better understanding of them even though i still find them confusing. I wanted to experiemnt with uploading an image and made the rocket more fun with a png image that I used in my code. I wanted to make the rocket roate when it changes direction and ended up using float theta = velocity.heading2D() in my code even though I didn't quite undersnad how it differs (if at all) from rotate(velocity.heading()) which is what Professor Michael showed us in class. Overall, this assignemt made me understand vectors a but betetr and I am happy that I could make my code work!

## February 10th - Assignment 2 
List of forces:
1) leaf blown by the wind 
2) leaf floating on the surface of a lake
3) sail boat on a lake
4) boat on the surface of the sea during a storm 
5) bungie jumper
6) skydiver 

## February 15th - Assignment 3
I found force fields confusing so the goal of doing this assignemt for me was to undertstand them better. I watched Daniel's Shiffman's videos and got inspired by one of the force fields that he made so I tried to recreate it on my own. Since I used the video to understand it, the code is very similar to what Daniel used, but I was proud of being able to make it work on my own. 

![](Images/forceFieldFeb15.JPG)

I thought that the pattern of the movement looked a lot like a school of fish in an ocean so I tried to use an image of a fish to replace the trianges. The code didn't work however (I would post it here anyway for Michael to have a look) and it kept giving me an error that I didnt find the cause of because all the variables seemed defined to me. It was taking to much time so I unfortunately had to give up even though I suspect that the error is something silly :( I would like to talk to Michael about it in class and hopefully get it to work!

![](Images/forceFieldFail.JPG)

## February 22nd - Assignment 4

I decided to modify the code of my previous assignemt to have the vehicles evolve to stay away from the edges of the canvas. For the first part, I decided to use applyForce when they approach the edge and turn around - kind of like they are scared and want to run away from the edges. I decided to do that by increading acceleration based on the parameter of being close to the edges. I thought that an 'if' function would be appropriate. So I would say 'if distance x is as such the force would be applied'. I then realised that for that to make sense, the vehicles would have to turn back first. That would be the second part of the assignemt - to evolve the vehicles to be 'afraid' of the edges so that they turn away when they are close and then accelerate away for a short time. I went back to the lecture notes and then to Daniel's Shiffman's books and spent a considerable amount of type stydying it again before admitting to myself that I am completely an utterly lost in regard to how to come about to actually implementing this and reached out to Michael. 
 
## March 1 - Assignment 5

I wanted to have fish that are afriad of the edges of the canvas and turn back when they are too close to one. The have a genetic fear threshold that determines how succeptable they are to fear and if their fear tops this threshold they act on it and run. 
I did that by having the fear increase the closer they get to and edge and then comapre the fear level ot the threshold. 

My biggest challenge was understanding the concept of evolution in terms of creating new fish. I wanted to have the fish die when their fear level is way too high (perhaps of shock) and I tried implementing that in my code, but I didnt fully understand how to make new fish and change their DNA so that they are less fearful. 

I spent Thursday and Friday rereading and rewatching information on evolution to be clearer on the concepts, and I spent Saturday and Sunday coding an debugging. My main frustration is all the syntax errors that I accidentally make and cant find the cause of because they end up taking a lot of my time out of trying to debug the actual content. In the end, I was sure that my code was going to work, but then this happened:
