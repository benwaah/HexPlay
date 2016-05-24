package helper;

import geom.Point;
import geom.Hex;
import geom.Offset;

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

	static public function toOddR(cube:Hex):Offset {
		var col:Int = Math.round(cube.q + (cube.r - (cube.r & 1)) / 2);
		var row:Int = cube.r;
		return new Offset(col, row);
	}

	static public function hexFromOddR(offset:Offset):Hex {
		var q = Math.round(offset.col - (offset.row - (offset.row & 1)) / 2);
		var r = offset.row;
		return new Hex(q, r);
	}

	static public function toOddQ(cube:Hex):Offset {
		var col:Int = cube.q;
		var row:Int = Math.round(cube.r + (cube.q - (cube.q & 1)) / 2);
		return new Offset(col, row);
	}

	static public function hexFromOddQ(offset:Offset):Hex {
		var q = offset.col;
		var r = Math.round(offset.row - (offset.col - (offset.col & 1)) / 2);
		return new Hex(q, r);
	}

	static public function add(a:Hex, b:Hex):Hex {
		return new Hex(a.q + b.q, a.r + b.r, a.s + b.s);
	}

	static public function substract(a:Hex, b:Hex):Hex {
		return new Hex(a.q - b.q, a.r - b.r, a.s - b.s);
	}

	static public function multiply(a:Hex, k:Int):Hex {
		return new Hex(a.q * k, a.r * k, a.s * k);
	}

	static public function length(h:Hex):Int {
		return Math.round((Math.abs(h.q) + Math.abs(h.r) + Math.abs(h.s)) / 2);
	}

	static public function distance(a:Hex, b:Hex) {
		return length(substract(a, b));
	}

	static public function neighbour(h:Hex, direction:Int) {
		return add(h, Hex.direction(direction));
	}
}
