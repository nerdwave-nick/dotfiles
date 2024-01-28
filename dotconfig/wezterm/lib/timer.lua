-- A multithreading implementation equivalent for the javascript setInterval function that will run a function periodically every X seconds in a different thread. Note that if the main thread finishes, the function will stop running... why? I don't know, lua things
-- IMPORTANT: Standard output written by a thread won't be seen because the lanes module for some reason redirects output elsewhere and you would need a communication system between the threads

local lanes = require("lanes")

local m = {}

local function wrapper(callback, interval)
	while true do
		callback()
		os.execute("sleep " .. interval)
	end
end

-- interval is expressed in seconds
function m.setInterval(callback, interval)
	m.timerThread = lanes.gen("*", wrapper)(callback, interval)
end

function m.cancelInterval()
	m.timerThread:cancel()
end

return m
