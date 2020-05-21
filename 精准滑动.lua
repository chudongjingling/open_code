--该函数来自于 QQ 群 592860666，由开发者“一个人自嘲”分享
Direction = {left=0,right=1,up=2,down=3}

function slide(x1,y1,dist,dir,ms,step)
	ms = ms or 100
	step = step or 30
	local x2,y2
	if dir == Direction.up then
		moveTo(x1,y1,  x1,  y1-dist,{["step"] = step,["ms"] = 50,["index"] = 1,["stop"] = false})
	 	mSleep(ms)
		moveTo(x1,  y1-dist,  x1,  y1-dist+1,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
		mSleep(ms)
		moveTo(x1,  y1-dist+1,  x1,  y1-dist+2,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
	elseif dir == Direction.down then
		moveTo(x1,y1,  x1,  y1+dist,{["step"] = step,["ms"] = 50,["index"] = 1,["stop"] = false})
	 	mSleep(ms)
		moveTo(x1,  y1+dist,  x1,  y1+dist-1,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
		mSleep(ms)
		moveTo(x1,  y1+dist-1,  x1,  y1+dist-2,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
	elseif dir == Direction.left then
		moveTo(x1,y1,  x1-dist,  y1,{["step"] = step,["ms"] = 50,["index"] = 1,["stop"] = false})
	 	mSleep(ms)
		moveTo(x1,  y1,  x1-dist+1,  y1,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
		mSleep(ms)
		moveTo( x1-dist+1,  y1,   x1-dist+2,  y1,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
	elseif dir == Direction.right then
		moveTo(x1,y1,  x1+dist,  y1,{["step"] = step,["ms"] = 50,["index"] = 1,["stop"] = false})
	 	mSleep(ms)
		moveTo(x1,  y1,  x1+dist-1,  y1,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
		mSleep(ms)
		moveTo( x1+dist-1,  y1,   x1+dist-2,  y1,{["step"] = 1,["ms"] = 50,["index"] = 1,["stop"] = false})
	else
		nLog('滑动方向错误，必须为上下左右中的一个')
	end
	mSleep(500)
end
