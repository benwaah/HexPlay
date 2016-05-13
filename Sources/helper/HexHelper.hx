package helper;

import geom.Point;
import geom.Cube;
import geom.Hex;
import geom.OddQ;
import geom.OddR;

class HexHelper {
	static public var pointyTopped:Bool = false;

	static public function hexCorner(center:Point, size:Float, i:Int):Point {
		var angleDeg = 60 * i;
		if (pointyTopped)
			angleDeg += 30;
		var angleRad = Math.PI / 180 * angleDeg;
		return new Point(Math.round(center.x + size * Math.cos(angleRad)),
						 Math.round(center.y + size * Math.sin(angleRad)));
	}

	static public function cubeToHex(cube:Cube):Hex {
		var q = cube.x;
		var r = cube.z;
		return new Hex(q, r);
	}

	static public function hexToCube(hex:Hex):Cube {
		var x = hex.q;
		var z = hex.r;
		var y = -x - z;
		return new Cube(x, y, z);
	}

	static public function cubeToOddR(cube:Cube):OddR {
		var col:Int = Math.round(cube.x + (cube.z - (cube.z & 1)) / 2);
		var row:Int = cube.z;
		return new OddR(col, row);
	}

	static public function oddRToCube(offset:OddR):Cube {
		var x = Math.round(offset.col - (offset.row - (offset.row & 1)) / 2);
		var z = offset.row;
		var y = -x - z;
		return new Cube(x, y, z);
	}

	static public function cubeToOddQ(cube:Cube):OddQ {
		var col:Int = cube.x;
		var row:Int = Math.round(cube.z + (cube.x - (cube.x & 1)) / 2);
		return new OddQ(col, row);
	}

	static public function oddQToCube(offset:OddQ):Cube {
		var x = offset.col;
		var z = Math.round(offset.row - (offset.col - (offset.col & 1)) / 2);
		var y = -x - z;
		return new Cube(x, y, z);
	}
}
