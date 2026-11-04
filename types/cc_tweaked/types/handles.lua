---@meta


---@class CC_Tweaked.ReadWriteHandle
local ReadWriteHandle = {}

---Read a number of bytes from this file.
---@param count number? The number of bytes to read. This may be 0 to determine we are at the end of the file. When absent, a single byte will be read.
---@return string|nil byte The bytes read as a string. This is returned when the count is given. If we are at the end of the file, it will return nil.
function ReadWriteHandle.read(count) end

---Read the remainder of the file.
---@return string|nil content The remaining contents of the file, or nil in the event of an error.
function ReadWriteHandle.readAll() end

---Read a line from the file.
---@param withTrailing boolean? Whether to include the newline characters with the returned string. Defaults to `false`.
---@return string|nil line The read line or nil if at the end of the file.
function ReadWriteHandle.readLine(withTrailing) end

---@alias CC_Tweaked.Handle.seek.whence
---| "set" offset is relative to the beginning of the file.
---| "cur" offset is relative to the current position. This is the default.
---| "end" offset is relative to the end of the file.
---Seek to a new position within the file, changing where bytes are written to.\
---The new position is an offset given by `offset`, relative to a start position determined by `whence`.\
---In case of success, seek returns the new file position from the beginning of the file.
---@param whence CC_Tweaked.Handle.seek.whence? Where the offset is relative to.
---@param offset number? The offset to seek to.
---@return number|nil pos, string|nil reason The new position or nil if seeking failed.
function ReadWriteHandle.seek(whence, offset) end

---Write a string to the file.
---@param content string The string to write.
function ReadWriteHandle.write(content) end

---Write a string of characters to the file, following them with a new line character.
---@param content string The text to write to the file.
function ReadWriteHandle.writeLine(content) end

---Save the current file without closing it.
function ReadWriteHandle.flush() end

---Close this file, freeing any resources it uses.\
---Once a file is closed it may no longer be read or written to.
function ReadWriteHandle.close() end

-----------------------------

---@class CC_Tweaked.ReadWriteBinaryHandle
local ReadWriteBinaryHandle = {};

---Read a number of bytes from this file.
---@overload fun():number|nil
---@overload fun(count:number):string|nil
---@param count number? The number of bytes to read. This may be 0 to determine we are at the end of the file. When absent, a single byte will be read.
---@return number|string|nil byteOrText The value of the byte read if `count` is absent. The bytes read as a string if `count` exists.
function ReadWriteBinaryHandle.read(count) end

---Read the remainder of the file.
---@return string|nil content The remaining contents of the file, or nil in the event of an error.
function ReadWriteBinaryHandle.readAll() end

---Read a line from the file.
---@param withTrailing boolean? Whether to include the newline characters with the returned string. Defaults to `false`.
---@return string|nil line The read line or nil if at the end of the file.
function ReadWriteBinaryHandle.readLine(withTrailing) end

---Seek to a new position within the file, changing where bytes are written to.\
---The new position is an offset given by `offset`, relative to a start position determined by `whence`.\
---In case of success, seek returns the new file position from the beginning of the file.
---@param whence CC_Tweaked.Handle.seek.whence? Where the offset is relative to.
---@param offset number? The offset to seek to.
---@return number|nil pos, string|nil reason The new position or nil if seeking failed.
function ReadWriteBinaryHandle.seek(whence, offset) end

---Write a byte to the file.
---@param charcode number The byte to write.
function ReadWriteBinaryHandle.write(charcode) end

---Write a string of characters to the file, following them with a new line character.
---@param content string The text to write to the file.
function ReadWriteBinaryHandle.writeLine(content) end

---Save the current file without closing it.
function ReadWriteBinaryHandle.flush() end

---Close this file, freeing any resources it uses.\
---Once a file is closed it may no longer be read or written to.
function ReadWriteBinaryHandle.close() end

-----------------------------

---@class CC_Tweaked.WriteHandle
local WriteHandle = {}

---Seek to a new position within the file, changing where bytes are written to.\
---The new position is an offset given by `offset`, relative to a start position determined by `whence`.\
---In case of success, seek returns the new file position from the beginning of the file.
---@param whence CC_Tweaked.Handle.seek.whence? Where the offset is relative to.
---@param offset number? The offset to seek to.
---@return number|nil pos, string|nil reason The new position or nil if seeking failed.
function WriteHandle.seek(whence, offset) end

---Write a string to the file.
---@param content string The string to write.
function WriteHandle.write(content) end

---Write a string of characters to the file, following them with a new line character.
---@param content string The text to write to the file.
function WriteHandle.writeLine(content) end

---Save the current file without closing it.
function WriteHandle.flush() end

---Close this file, freeing any resources it uses.\
---Once a file is closed it may no longer be read or written to.
function WriteHandle.close() end

-----------------------------

---@class CC_Tweaked.WriteBinaryHandle
local WriteBinaryHandle = {};

---Seek to a new position within the file, changing where bytes are written to.\
---The new position is an offset given by `offset`, relative to a start position determined by `whence`.\
---In case of success, seek returns the new file position from the beginning of the file.
---@param whence CC_Tweaked.Handle.seek.whence? Where the offset is relative to.
---@param offset number? The offset to seek to.
---@return number|nil pos, string|nil reason The new position or nil if seeking failed.
function WriteBinaryHandle.seek(whence, offset) end

---Write a byte to the file.
---@param charcode number The byte to write.
function WriteBinaryHandle.write(charcode) end

---Write a string of characters to the file, following them with a new line character.
---@param content string The text to write to the file.
function WriteBinaryHandle.writeLine(content) end

---Save the current file without closing it.
function WriteBinaryHandle.flush() end

---Close this file, freeing any resources it uses.\
---Once a file is closed it may no longer be read or written to.
function WriteBinaryHandle.close() end

-----------------------------

---@class CC_Tweaked.ReadHandle
local ReadHandle = {}

---Read a number of bytes from this file.
---@param count number? The number of bytes to read. This may be 0 to determine we are at the end of the file. When absent, a single byte will be read.
---@return string|nil byte The bytes read as a string. This is returned when the count is given. If we are at the end of the file, it will return nil.
function ReadHandle.read(count) end

---Read the remainder of the file.
---@return string|nil content The remaining contents of the file, or nil in the event of an error.
function ReadHandle.readAll() end

---Read a line from the file.
---@param withTrailing boolean? Whether to include the newline characters with the returned string. Defaults to `false`.
---@return string|nil line The read line or nil if at the end of the file.
function ReadHandle.readLine(withTrailing) end

---Seek to a new position within the file, changing where bytes are written to.\
---The new position is an offset given by `offset`, relative to a start position determined by `whence`.\
---In case of success, seek returns the new file position from the beginning of the file.
---@param whence CC_Tweaked.Handle.seek.whence? Where the offset is relative to.
---@param offset number? The offset to seek to.
---@return number|nil pos, string|nil reason The new position or nil if seeking failed.
function ReadHandle.seek(whence, offset) end

---Close this file, freeing any resources it uses.\
---Once a file is closed it may no longer be read or written to.
function ReadHandle.close() end

-----------------------------

---@class CC_Tweaked.ReadBinaryHandle
local ReadBinaryHandle = {};

---Read a number of bytes from this file.
---@overload fun():number|nil
---@overload fun(count:number):string|nil
---@param count number? The number of bytes to read. This may be 0 to determine we are at the end of the file. When absent, a single byte will be read.
---@return number|string|nil byteOrText The value of the byte read if `count` is absent. The bytes read as a string if `count` exists.
function ReadBinaryHandle.read(count) end

---Read the remainder of the file.
---@return string|nil content The remaining contents of the file, or nil in the event of an error.
function ReadBinaryHandle.readAll() end

---Read a line from the file.
---@param withTrailing boolean? Whether to include the newline characters with the returned string. Defaults to `false`.
---@return string|nil line The read line or nil if at the end of the file.
function ReadBinaryHandle.readLine(withTrailing) end

---Seek to a new position within the file, changing where bytes are written to.\
---The new position is an offset given by `offset`, relative to a start position determined by `whence`.\
---In case of success, seek returns the new file position from the beginning of the file.
---@param whence CC_Tweaked.Handle.seek.whence? Where the offset is relative to.
---@param offset number? The offset to seek to.
---@return number|nil pos, string|nil reason The new position or nil if seeking failed.
function ReadBinaryHandle.seek(whence, offset) end

---Close this file, freeing any resources it uses.\
---Once a file is closed it may no longer be read or written to.
function ReadBinaryHandle.close() end

-----------------------------
