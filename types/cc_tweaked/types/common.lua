---@meta

---@class CC_Tweaked.BlockInfo
local BlockInfo = {
  ---@type string The namespaced ID for this block.
  name = "",
  ---@type table A table containing the block state of the block.
  state = {},
  ---@type table The set of tags for this block. This is a mapping of tag name to `true`.
  tags = {},
  ---@type table? A table for NBT of the block.
  nbt = nil,
  ---@type number? The color of the block, as an RGB hex value.
  mapColor = nil,
  ---@type number? The colour of the block, as an RGB hex value.
  mapColour = nil
}

---@class CC_Tweaked.EntityInfo
local EntityInfo = {
  ---@type string The namespaced ID for this entity.
  name = "",
  ---@type string The translated display name of the entity. This uses the *server*'s language. This will typically be English on multi-player servers, and your current language on single player
  displayName = "",
  ---@type number The current health of the entity.
  health = 20,
  ---@type number The maximum health of an entity.
  maxHealth = 20,
  ---@type table The set of tags for this entity. This is a mapping of tag name to `true`.
  tags = {},
}
