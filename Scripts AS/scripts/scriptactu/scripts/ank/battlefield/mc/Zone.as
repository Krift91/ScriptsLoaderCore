class ank.battlefield.mc.Zone extends MovieClip
{
   var _oMap;
   var _mcZone;
   static var ALPHA = 30;

   function Zone(oMap)
   {
      super();
      this.initialize(oMap);
   }

   function initialize(oMap)
   {
      this._oMap = oMap;
      this.clear();
   }

   function clear()
   {
      this.createEmptyMovieClip("_mcZone", 10);
   }

   function remove()
   {
      this.removeMovieClip();
   }

   function drawCircle(size, color, cellID)
   {
      var mc = this._mcZone;
      mc.beginFill(color, ank.battlefield.mc.Zone.ALPHA);
      this.drawCircleBorder(size, color, cellID);
      mc.endFill();
   }

   function drawRing(innerSize, outerSize, color, cellID)
   {
      var mc = this._mcZone;
      mc.beginFill(color, ank.battlefield.mc.Zone.ALPHA);
      this.drawCircleBorder(outerSize, color, cellID);
      this.drawCircleBorder(innerSize, color, cellID);
      mc.endFill();
   }

   function drawRectangle(width, height, color, cellID)
   {
      var mc = this._mcZone;
      mc.beginFill(color, ank.battlefield.mc.Zone.ALPHA);
      this.drawRectangleBorder(width, height, color, cellID);
      mc.endFill();
   }

   function drawCross(size, color, cellID)
   {
      var cellCoords = ank.battlefield.Constants.CELL_COORD;
      var mapWidth = this._oMap.getWidth();
      var currentCell = cellID;
      var mc = this._mcZone;
      mc.beginFill(color, ank.battlefield.mc.Zone.ALPHA);
      mc.lineStyle(1, color, 100);

      var groundData = this.getGroundData(currentCell);
      mc.moveTo(cellCoords[groundData.gf][0][0], cellCoords[groundData.gf][0][1] - groundData.gl * 20);

      var i = 1;
      while(i <= size)
      {
         currentCell -= mapWidth;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][0][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][0][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i + 1;
      }

      i = size;
      while(i >= 0)
      {
         if(i != size)
         {
            currentCell += mapWidth;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][1][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][1][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i - 1;
      }

      i = 1;
      while(i <= size)
      {
         currentCell -= mapWidth - 1;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][1][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][1][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i + 1;
      }

      i = size;
      while(i >= 0)
      {
         if(i != size)
         {
            currentCell += mapWidth - 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][2][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i - 1;
      }

      i = 1;
      while(i <= size)
      {
         currentCell += mapWidth;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][2][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i + 1;
      }

      i = size;
      while(i >= 0)
      {
         if(i != size)
         {
            currentCell -= mapWidth;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][3][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][3][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i - 1;
      }

      i = 1;
      while(i <= size)
      {
         currentCell += mapWidth - 1;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][3][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][3][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i + 1;
      }

      i = size;
      while(i > 0)
      {
         if(i != size)
         {
            currentCell -= mapWidth - 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][0][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH,
                   cellCoords[groundData.gf][0][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT);
         i = i - 1;
      }

      mc.endFill();
   }

   function drawLine(size, color, castCellID, targetCellID, usePerpendicular, useOffset)
   {
      var offsetX = 0;
      var offsetY = 0;

      if(useOffset == true)
      {
         var castData = this._oMap.getCellData(castCellID);
         var targetData = this._oMap.getCellData(targetCellID);
         offsetX = castData.x - targetData.x;
         offsetY = castData.rootY - targetData.rootY;
      }

      var cellCoords = ank.battlefield.Constants.CELL_COORD;
      var mapWidth = this._oMap.getWidth();
      var currentCell = castCellID;
      var directions = [0, 0, 0, 0, 0, 0, 0, 0];

      if(targetCellID != castCellID)
      {
         var direction = ank.battlefield.utils.Pathfinding.getDirection(this._oMap, targetCellID, castCellID);
         if(usePerpendicular == true)
         {
            directions[(direction + 6) % 8] = size;
            directions[(direction + 10) % 8] = size;
         }
         else
         {
            directions[direction] = size;
         }
      }

      var mc = this._mcZone;
      mc.beginFill(color, ank.battlefield.mc.Zone.ALPHA);
      mc.lineStyle(1, color, 100);

      var groundData = this.getGroundData(currentCell);
      mc.moveTo(cellCoords[groundData.gf][0][0] + offsetX, cellCoords[groundData.gf][0][1] - groundData.gl * 20 + offsetY);

      var i = 1;
      while(i <= directions[5])
      {
         currentCell -= mapWidth;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][0][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][0][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i + 1;
      }

      i = directions[5];
      while(i >= 0)
      {
         if(i != directions[5])
         {
            currentCell += mapWidth;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][1][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][1][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i - 1;
      }

      i = 1;
      while(i <= directions[7])
      {
         currentCell -= mapWidth - 1;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][1][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][1][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i + 1;
      }

      i = directions[7];
      while(i >= 0)
      {
         if(i != directions[7])
         {
            currentCell += mapWidth - 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][2][1] - groundData.gl * 20 - i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i - 1;
      }

      i = 1;
      while(i <= directions[1])
      {
         currentCell += mapWidth;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][2][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i + 1;
      }

      i = directions[1];
      while(i >= 0)
      {
         if(i != directions[1])
         {
            currentCell -= mapWidth;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][3][0] + i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][3][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i - 1;
      }

      i = 1;
      while(i <= directions[3])
      {
         currentCell += mapWidth - 1;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][3][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][3][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i + 1;
      }

      i = directions[3];
      while(i > 0)
      {
         if(i != directions[3])
         {
            currentCell -= mapWidth - 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(cellCoords[groundData.gf][0][0] - i * ank.battlefield.Constants.CELL_HALF_WIDTH + offsetX,
                   cellCoords[groundData.gf][0][1] - groundData.gl * 20 + i * ank.battlefield.Constants.CELL_HALF_HEIGHT + offsetY);
         i = i - 1;
      }

      mc.endFill();
   }

   function getGroundData(cellID)
   {
      var cellData = this._oMap.getCellData(cellID);
      var groundSlope = cellData.groundSlope != undefined ? cellData.groundSlope : 1;
      var groundLevel = cellData.groundLevel != undefined ? cellData.groundLevel - 7 : 0;
      return {gf: groundSlope, gl: groundLevel};
   }

   function drawCircleBorder(size, color, cellID)
   {
      var cellCoords = ank.battlefield.Constants.CELL_COORD;
      var mapWidth = this._oMap.getWidth();
      var mapStride = mapWidth * 2 - 1;
      var currentCell = cellID - size * mapWidth;
      var offsetX = (-size) * ank.battlefield.Constants.CELL_HALF_WIDTH;
      var offsetY = (-size) * ank.battlefield.Constants.CELL_HALF_HEIGHT;
      var mc = this._mcZone;
      mc.lineStyle(1, color, 100);

      var groundData = this.getGroundData(currentCell);
      mc.moveTo(offsetX + cellCoords[groundData.gf][0][0], offsetY + cellCoords[groundData.gf][0][1] - groundData.gl * 20);

      var i = 0;
      while(i < size + 1)
      {
         if(i != 0)
         {
            currentCell = currentCell + 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][1][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][1][1] - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][2][1] - groundData.gl * 20);
         i = i + 1;
      }

      i -= 1;
      var j = 0;
      while(j < size)
      {
         currentCell += mapStride;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][1][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][1][1] + (j + 1) * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][2][1] + (j + 1) * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         j = j + 1;
      }

      i = size;
      while(i >= 0)
      {
         if(i != size)
         {
            currentCell = currentCell - 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][3][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][3][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][0][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][0][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         i = i - 1;
      }

      i += 1;
      j = size - 1;
      while(j >= 0)
      {
         currentCell -= mapStride;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][3][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][3][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][0][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][0][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         j = j - 1;
      }
   }

   function drawRectangleBorder(width, height, color, cellID)
   {
      var cellCoords = ank.battlefield.Constants.CELL_COORD;
      var mapStride = this._oMap.getWidth() * 2 - 1;
      var currentCell = Number(cellID);
      var offsetX = 0;
      var offsetY = 0;
      var mc = this._mcZone;
      mc.lineStyle(1, color, 100);

      var groundData = this.getGroundData(currentCell);
      mc.moveTo(offsetX + cellCoords[groundData.gf][0][0], offsetY + cellCoords[groundData.gf][0][1] - groundData.gl * 20);

      var i = 0;
      while(i < width)
      {
         if(i != 0)
         {
            currentCell = currentCell + 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][1][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][1][1] - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][2][1] - groundData.gl * 20);
         i = i + 1;
      }

      i -= 1;
      var j = 0;
      while(j < height - 1)
      {
         currentCell += mapStride;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][1][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][1][1] + (j + 1) * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][2][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][2][1] + (j + 1) * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         j = j + 1;
      }

      i = width - 1;
      while(i >= 0)
      {
         if(i != width - 1)
         {
            currentCell = currentCell - 1;
         }
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][3][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][3][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][0][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][0][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         i = i - 1;
      }

      i += 1;
      j = height - 2;
      while(j >= 0)
      {
         currentCell -= mapStride;
         groundData = this.getGroundData(currentCell);
         mc.lineTo(offsetX + cellCoords[groundData.gf][3][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][3][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         mc.lineTo(offsetX + cellCoords[groundData.gf][0][0] + i * ank.battlefield.Constants.CELL_WIDTH,
                   offsetY + cellCoords[groundData.gf][0][1] + j * ank.battlefield.Constants.CELL_HEIGHT - groundData.gl * 20);
         j = j - 1;
      }
   }
}
