---@meta

fs = {};

---Provides completion for a file or directory name, suitable for use with `_G.read`.\
---When a directory is a possible candidate for completion, two entries are included - one with a trailing slash (indicating that entries within this directory exist) and one without it (meaning this entry is an immediate completion candidate). `include_dirs` can be set to false to only include those with a trailing slash.
---@overload fun(path:string,location:string,include_files?:boolean,include_dirs?:boolean):string[]
---@overload fun(path:string,location:string,options:{ include_dirs? : boolean, include_files? : boolean, include_hidden? : boolean }):string[]
---@param path string
---@param location string
---@param arg3 boolean|{ include_dirs? : boolean, include_files? : boolean, include_hidden? : boolean }|nil
---@param arg4 boolean|nil
---@return string[] candidates A list of possible completion candidates.
function fs.complete(path, location, arg3, arg4) end

---Searches for files matching a string with wildcards.\
---This string looks like a normal path string, but can include wildcards, which can match multiple paths:\
---    `?`: matches any single character in a file name.\
---    `*`: matches any number of characters.
---@param path string The wildcard-qualified path to search for.
---@return string[] paths A list of paths that match the search string.
function fs.find(path) end

---Returns true if a path is mounted to the parent filesystem.\
---The root filesystem `"/"` is considered a mount, along with disk folders and the rom folder.
---@see fs.getDrive
---@param path string The path to check.
---@return boolean If the path is mounted, rather than a normal file/folder.
function fs.isDriveRoot(path) end

---Returns a list of files in a directory.
---@param path string The path to list.
---@return string[] files A table with a list of files in the directory.
function fs.list(path) end

---Combines several parts of a path into one full path, adding separators as needed.
---@param path string The first part of the path. For example, a parent directory path.
---@param ... string Additional parts of the path to combine.
function fs.combine(path, ...) end

---Returns the file name portion of a path.
---@param path string The path to get the name from.
---@return string filename The final part of the path (the file name).
function fs.getName(path) end

---Returns the parent directory portion of a path.
---@param path string The path to get the directory from.
---@return string dirPath The path with the final part removed (the parent directory).
function fs.getDir(path) end

---Returns the size of the specified file.
---@param path string The file to get the file size of.
---@return number bytes The size of the file, in bytes.
function fs.getSize(path) end

---Returns whether the specified path exists.
---@param path string The path to check the existence of.
---@return boolean exists Whether the path exists.
function fs.exists(path) end

---Returns whether the specified path is a directory.
---@param path string The path to check.
---@return boolean isDir Whether the path is a directory.
function fs.isDir(path) end

---Returns whether a path is read-only.
---@param path string The path to check.
---@return boolean isROM Whether the path cannot be written to.
function fs.isReadOnly(path) end

---Creates a directory, and any missing parents, at the specified path.
---@param path string The path to the directory to create.
function fs.makeDir(path) end

---Moves a file or directory from one path to another.\
---Any parent directories are created as needed.
---@param path string The current file or directory to move from.
---@param dest string The destination path for the file or directory.
function fs.move(path, dest) end

---Copies a file or directory to a new path.\
---Any parent directories are created as needed.
---@param path string The file or directory to copy.
---@param dest string The path to the destination file or directory.
function fs.copy(path, dest) end

---Deletes a file or directory.
---If the path points to a directory, all of the enclosed files and subdirectories are also deleted.
---@param path string The path to the file or directory to delete.
function fs.delete(path) end

---@alias CC_Tweaked.fs.open.mode
---| "r" Read mode
---| "rb" Read mode (in binary)
---| "w" Write mode
---| "wb" Write mode (in binary)
---| "a" Append mode
---| "ab" Append mode (in binary)
---| "r+" Update mode: allows reading and writing, all data is **preserved**
---| "r+b" Update mode (in binary), all data is **preserved**
---| "w+" Update mode, all data is **erased**
---| "w+b" Update mode (in binary), all data is **erased**

---Opens a file for reading or writing at a path.\
---The mode may also have a "b" at the end, which opens the file in "binary mode". \
---This changes `fs.ReadHandle.read` and `fs.WriteHandle.write` to read/write single bytes as numbers rather than strings.\
---This option exists for backwards compatibility with older programs, and is not recommended with new code.
---@overload fun(path:string,mode:"r"): CC_Tweaked.ReadHandle
---@overload fun(path:string,mode:"rb"): CC_Tweaked.ReadBinaryHandle
---@overload fun(path:string,mode:"w"|"a"): CC_Tweaked.WriteHandle
---@overload fun(path:string,mode:"wb"|"ab"): CC_Tweaked.WriteBinaryHandle
---@overload fun(path:string,mode:"r+"|"w+"): CC_Tweaked.ReadWriteHandle
---@overload fun(path:string,mode:"r+b"|"w+b"): CC_Tweaked.ReadWriteBinaryHandle
---@param path string The path to the file to open.
---@param mode CC_Tweaked.fs.open.mode
function fs.open(path, mode) end

---Returns the name of the mount that the specified path is located on.
---@param path string The path to get the drive of.
---@return string|nil name The name of the drive that the file is on; e.g. `hdd` for local files, or `rom` for ROM files.
function fs.getDrive(path) end

---Returns the amount of free space available on the drive the path is located on.
---@param path string The path to check the free space for.
---@return number|"unlimited" free The amount of free space available, in bytes, or `"unlimited"`.
function fs.getFreeSpace(path) end

---Returns the capacity of the drive the path is located on.
---@param path string The path of the drive to get.
---@return number|nil capacity This drive's capacity. This will be nil for "read-only" drives, such as the ROM or treasure disks.
function fs.getCapacity(path) end

---Get attributes about a specific file or folder.
---The returned attributes table contains information about the size of the file, whether it is a directory, when it was created and last modified, and whether it is read only.
---The creation and modification times are given as the number of milliseconds since the UNIX epoch. This may be given to os.date in order to convert it to more usable form.
---@param path string The path to get attributes for.
---@return fs.Attributes The resulting attributes.
function fs.attributes(path) end
