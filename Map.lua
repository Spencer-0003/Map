--[[
    @file Map
    @description Lua port of JavaScript Maps

    Based off https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map
]]

local Map = {}; do
    Map.__index = Map;

    function Map.new(iterables) 
        return setmetatable({ size = 0, _cache = type(iterables == 'table') and iterables or {} }, Map);
    end;

    function Map:set(key, value)
        self.size = self.size + 1;
        self._cache[key] = value;
    end;

    function Map:get(key)
        return self._cache[key];
    end;

    function Map:has(key)
        return self._cache[key] ~= nil;
    end;

    function Map:delete(key)
        if (self._cache[key]) then
            self._cache[key] = nil;
            self.size = self.size - 1;
            return true;
        end;
        return false;
    end;

    function Map:clear()
        self._cache = {};
        self.size = 0;
    end;

    function Map:keys()
        local values = {};
        for i in next, self._cache do
            values[#values + 1] = i;
        end;
        return values;
    end;

    function Map:values()
        local values = {};
        for _, v in next, self._cache do
            values[#values + 1] = v;
        end;
        return values;
    end;

    function Map:entries()
        return self._cache;
    end;

    function Map:forEach(callback)
        for i, v in next, self._cache do
            callback(v, i);
        end;
    end;
end;

return Map;
