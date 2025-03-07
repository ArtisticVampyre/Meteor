local Signal = require(script.Parent.Signal)

local Meteor = {}

function Meteor:Fire(eventName: string, ...)
	self[eventName]:Fire(...)
end

function Meteor:Subscribe(eventName: string, callback: (any) -> nil)
	self[eventName]:Connect(callback)
end

return setmetatable(Meteor, {
	__index = function(self, eventName)
		if not rawget(self, eventName) then
			rawset(self, eventName, Signal.new())
		end
		return rawget(self, eventName)
	end,
})
