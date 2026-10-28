---@meta

--#region Vanila Commands
---The commands are from version 26.2.
local vanilacmds = {}

---@param selector string
---@param enchant string
---@param level number|string|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.enchant(selector, enchant, level) end

---@param selector string
---@param hand "mainhand"|"offhand"|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.swing(selector, hand) end

---@param type "feature"|"jigsaw"|"structure"|"template"
---@param placement string
---@param ... string|number|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.place(type, placement, ...) end

---@param rule string
---@param setTo string|boolean|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.gamerule(rule, setTo) end

---@overload fun():success:boolean,messages:string[],affecteds:number
---@overload fun(x:number,y:number,z:number):success:boolean,messages:string[],affecteds:number
---@overload fun(x:number,y:number,z:number,yaw:number,pitch:number):success:boolean,messages:string[],affecteds:number
---@param ... number|string|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.setworldspawn(...) end

---@param type "give"|"insert"|"replace"|"spawn"
---@param ... string|number|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.loot(type, ...) end

---@overload fun(type:"freeze"|"query"|"unfreeze"):success:boolean,messages:string[],affecteds:number
---@overload fun(type:"rate"|"sprint"|"step",param:string|number):success:boolean,messages:string[],affecteds:number
---@param type "freeze"|"query"|"rate"|"sprint"|"step"|"unfreeze"
---@param param string|number|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.tick(type, param) end

---@param action "grant"|"revoke"
---@param selector string
---@param advSelect "everything"|"from"|"only"|"through"|"until"
---@param advancementId string|nil
---@param advCondition string|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.advancement(action, selector, advSelect, advancementId, advCondition) end

---@param action "start"|"stop"
---@return boolean success, string[] messages, number affecteds
function vanilacmds.jfr(action) end

---@overload fun(action:"fail"):success:boolean,messages:string[],affecteds:number
---@overload fun(action:"run",...:string|number|boolean|nil):success:boolean,messages:string[],affecteds:number
---@param action "fail"|"run"
---@param ... string|number|boolean|nil
---@return boolean success, string[] messages, number affecteds
local function vanilacmds_return(action, ...) end
vanilacmds["return"] = vanilacmds_return;

---@overload fun(action:"list"):success:boolean,messages:string[],affecteds:number
---@overload fun(action:"modify",selector:string,modType:"color"|"style",...:string):success:boolean,messages:string[],affecteds:number
---@param action "list"|"modify"
---@param selector string?
---@param modType "color"|"style"|nil
---@param ... string
---@return boolean success, string[] messages, number affecteds
function vanilacmds.waypoint(action, selector, modType, ...) end

---@param selector string
---@param message string
---@return boolean success, string[] messages, number affecteds
function vanilacmds.tell(selector, message) end

vanilacmds.w = vanilacmds.tell;

--#TODO: title table to interface (also it will use for advanced peripherals)

---@overload fun(selector:string,type:"actionbar"|"subtitle"|"title",title:string|table):success:boolean,messages:string[],affecteds:number
---@overload fun(selector:string,type:"clear"|"reset"):success:boolean,messages:string[],affecteds:number
---@overload fun(selector:string,type:"times",...:string|number|nil):success:boolean,messages:string[],affecteds:number
---@param selector string
---@param type "actionbar"|"clear"|"reset"|"subtitle"|"times"|"title"
---@param ... string|number|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.title(selector, type, ...) end

---@param action "add"|"get"|"list"|"remove"|"set"
---@param ... string|number|boolean|nil
---@return boolean success, string[] messages, number affecteds
function vanilacmds.bossbar(action, ...) end

---@param action "create"|"query"|"remove"|"restart"
---@param id string
---@param scale string?
---@return boolean success, string[] messages, number affecteds
function vanilacmds.stopwatch(action, id, scale) end

--#TODO: Add more functions to complete commands

--#endregion

commands = vanilacmds;
---A table containing asynchronous wrappers for all commands.\
---As with `commands.execAsync`, this returns the "task id" of the enqueued command.
commands.async = vanilacmds;
---The builtin commands API, without any generated command helper functions\
---This may be useful if a built-in function (such as `commands.list`) has been overwritten by a command.
commands.native = {};

---Execute a specific command.
---@param command string
---@return boolean success, string[] messages, number affecteds
function commands.exec(command) end;

---Asynchronously execute a command.\
---Unlike `exec`, this will immediately return, instead of waiting for the command to execute. This allows you to run multiple commands at the same time.\
---When this command has finished executing, it will queue a `task_complete` event containing the result of executing this command (what exec would return).
---@param command string
---@return number taskId When this command has been executed, it will queue a `task_complete` event with a matching id.
function commands.execAsync(command) end;

---List all available commands which the computer has permission to execute.
---@param ... string The sub-command to complete.
---@return string[] commands A list of all available commands
function commands.list(...) end;

---Get the name of the dimension the current command computer is in, such as `minecraft:overworld`.
---@see commands.getBlockPosition
---@return string dimension The dimension the computer is in.
function commands.getDimension() end;

---Get the position of the current command computer.
---@see gps.locate
---@see commands.getDimension
---@return number x,number y,number z This computer's x/y/z position.
function commands.getBlockPosition() end;

---Get information about a range of blocks.
---This returns the same information as `getBlockInfo`, just for multiple blocks at once.
---Blocks are traversed by ascending y level, followed by z and x - the returned table may be indexed using `x + z*width + y*width*depth + 1`.
---@param minX number The start x coordinate of the range to query.
---@param minY number The start y coordinate of the range to query.
---@param minZ number The start z coordinate of the range to query.
---@param maxX number The end x coordinate of the range to query.
---@param maxY number The end y coordinate of the range to query.
---@param maxZ number The end z coordinate of the range to query.
---@param dimension string? The dimension to query (e.g. "minecraft:overworld"). Defaults to the current dimension.
---@return CC_Tweaked.BlockInfo[]
function commands.getBlockInfos(minX, minY, minZ, maxX, maxY, maxZ, dimension) end;

---Get some basic information about a block.
---The returned table contains the same information as listed in Block details. If there is a block entity for that block, its NBT will also be returned.
---@param x number The x position of the block to query.
---@param y number The y position of the block to query.
---@param z number The z position of the block to query.
---@param dimension string? The dimension to query (e.g. "minecraft:overworld"). Defaults to the current dimension.
---@return CC_Tweaked.BlockInfo
function commands.getBlockInfo(x, y, z, dimension) end;

---Get all entities matching the given selector.
---@param selector string
---@return CC_Tweaked.EntityInfo[]
function commands.getEntities(selector) end;
