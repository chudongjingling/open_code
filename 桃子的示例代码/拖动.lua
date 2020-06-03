touch = {
--点击
click = (function(x,y,startwait,stopwait) mSleep(startwait);touchDown(1,x,y);mSleep(20);touchUp(1,x,y);mSleep(stopwait) end),
--拖动
drag = (function(x1,y1,x2,y2,step,wait,stepwait) local step = step or 30;touchDown(1,x1,y1);repeat x1,y1 = ((math.abs(x2-x1)<step and x1) or x1 + (step * ((x2-x1<0 and -1) or 1))),((math.abs(y2-y1)<step and y1) or y1 + (step * ((y2-y1<0 and -1) or 1)));touchMove(1,x1,y1);mSleep(stepwait or 30);until ((math.abs(x2-x1)<step) and (math.abs(y2-y1)<step));touchMove(1,x2,y2);mSleep(wait or 300)touchUp(1,x2,y2) end),
}
touch.drag(100,100,200,200)
