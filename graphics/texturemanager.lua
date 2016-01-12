local TextureManager = {}

TextureManager.sheets = {}

function TextureManager.addSheet(imagePath, sheetName, gridSize)
  local sheet = {};
  sheet.image = love.graphics.newImage(imagePath);
  sheet.textures = {};
  for x = 0, sheet.image:getWidth(), 1 do
    for y = 0, sheet.image:getHeight(), 1 do
      local quad = love.graphics.newQuad(gridSize*x, gridSize*y, gridSize, gridSize, sheet.image:getWidth(), sheet.image:getHeight());
      sheet.textures[x.."_"..y] = require("graphics.texture").create(sheet.image, quad, gridSize)
    end
  end
  TextureManager.sheets[sheetName] = sheet;
end

function TextureManager.getTexture(sheetName, x, y)
  return TextureManager.sheets[sheetName].textures[x.."_"..y];
end

return TextureManager
