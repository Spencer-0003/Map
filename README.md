## Map

Lua port of JavaScript Maps.

Usage
-----

```lua
local map = Map.new(); -- can pass a dictionary to auto set the values.

map:set('a', 'b');
map:get('a'); -- 'b'
map:has('a'); -- true
map:has('non existent value'); -- false
map:delete('a'); -- true
map:delete('non existent value'); -- false
map:clear(); -- deletes all keys & values
map:keys(); -- returns all keys
map:values(); -- returns all values
map:entries(); -- returns all keys & values in a dictionary 

map:forEach(function(value, index)
    print(value, index);
end);
```
