---@meta

local baseColors = {
  ---White: Written as `0` in paint files and term.blit, has a default terminal colour of #F0F0F0.
  white = 0x1,
  ---Orange: Written as `1` in paint files and term.blit, has a default terminal colour of #F2B233.
  oragnge = 0x2,
  ---Magenta: Written as `2` in paint files and term.blit, has a default terminal colour of #E57FD8.
  magenta = 0x4,
  ---Light blue: Written as `3` in paint files and term.blit, has a default terminal colour of #99B2F2.
  lightBlue = 0x8,
  ---Yellow: Written as `4` in paint files and term.blit, has a default terminal colour of #DEDE6C.
  yellow = 0x10,
  ---Lime: Written as `5` in paint files and term.blit, has a default terminal colour of #7FCC19.
  lime = 0x20,
  ---Pink: Written as `6` in paint files and term.blit, has a default terminal colour of #F2B2CC.
  pink = 0x40,
  ---Cyan: Written as `9` in paint files and term.blit, has a default terminal colour of #4C99B2.
  cyan = 0x200,
  ---Purple: Written as `a` in paint files and term.blit, has a default terminal colour of #B266E5.
  purple = 0x400,
  ---Blue: Written as `b` in paint files and term.blit, has a default terminal colour of #3366CC.
  blue = 0x800,
  ---Brown: Written as `c` in paint files and term.blit, has a default terminal colour of #7F664C.
  brown = 0x1000,
  ---Green: Written as `d` in paint files and term.blit, has a default terminal colour of #57A64E.
  green = 0x2000,
  ---Red: Written as `e` in paint files and term.blit, has a default terminal colour of #CC4C4C.
  red = 0x4000,
  ---Black: Written as `f` in paint files and term.blit, has a default terminal colour of #111111.
  black = 0x8000,
}

---Combines a set of colors (or sets of colors) into a larger set. Useful for Bundled Cables.
---@param ... number The colors to combine.
---@return number colorSet The union of the color sets given in `...`
function baseColors.combine(...) end

---Removes one or more colors (or sets of colors) from an initial set. Useful for Bundled Cables.\
---Each parameter beyond the first may be a single color or may be a set of colors (in the latter case, all colors in the set are removed from the original set).
---@param colors number The color from which to subtract.
---@param ... number The colors to subtract.
---@return number color The resulting color.
function baseColors.subtract(colors, ...) end

---Tests whether `color` is contained within `colors`. Useful for Bundled Cables.
---@param colors number A color, or color set
---@param color number A color or set of colors that `colors` should contain.
---@return boolean contains If colors contains all colors within color.
function baseColors.test(colors, color) end

---Combine a three-colour RGB value into one hexadecimal representation.
---@param r number The red channel, should be between 0 and 1.
---@param g number The green channel, should be between 0 and 1.
---@param b number The blue channel, should be between 0 and 1.
---@return number rgb The combined hexadecimal colour.
function baseColors.packRGB(r, g, b) end

---Separate a hexadecimal RGB colour into its three constituent channels.
---@param rgb number The combined hexadecimal colour.
---@return number r,number g,number b The red/green/blue channel, will be between 0 and 1.
function baseColors.unpackRGB(rgb) end

---@see colors.packRGB
---@see colors.unpackRGB
---@overload fun(r_or_rgb: number,g:nil,b:nil): number,number,number
---@overload fun(r_or_rgb: number,g:number,b:number): number
---@param r_or_rgb number The red channel, should be between 0 and 1. / The combined hexadecimal colour.
---@param g number? The green channel, should be between 0 and 1.
---@param b number? The blue channel, should be between 0 and 1.
---@return number r_or_rgb,number? g,number? b The combined hexadecimal colour. / The red/green/blue channel, will be between 0 and 1.
---@deprecated Use packRGB or unpackRGB directly.
function baseColors.rgb8(r_or_rgb, g, b) end

---Converts the given color to a paint/blit hex character (0-9a-f).\
---This is equivalent to converting `floor(log_2(color))` to hexadecimal. Values outside the range of a valid colour will error.
---@see colors.fromBlit
---@param color number The color to convert.
---@return string hex The blit hex code of the color.
function baseColors.toBlit(color) end

---Converts the given paint/blit hex character (0-9a-f) to a color.\
---This is equivalent to converting the hex character to a number and then `2 ^ decimal`
---@see colors.toBlit
---@param hex string The paint/blit hex character to convert
---@return number color The color
function baseColors.fromBlit(hex) end

colors = baseColors;
---Gray: Written as `7` in paint files and term.blit, has a default terminal colour of #4C4C4C.
colors.gray = 0x80;
---Light gray: Written as `8` in paint files and term.blit, has a default terminal colour of #999999.
colors.lightGray = 0x100;

colours = baseColors;
---Grey: Written as `7` in paint files and term.blit, has a default terminal colour of #4C4C4C.
colours.grey = 0x80;
---Light grey: Written as `8` in paint files and term.blit, has a default terminal colour of #999999.
colours.lightGrey = 0x100;
