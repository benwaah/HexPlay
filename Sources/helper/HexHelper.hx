package helper;

import geom.FractionalHex;
import geom.Hex;
import geom.Offset;

class HexHelper {
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

	static public function roundHex(hex:FractionalHex):Hex {
		var q = Math.round(hex.q);
		var r = Math.round(hex.r);
		var s = Math.round(hex.s);

		var qDiff = Math.abs(q - hex.q);
		var rDiff = Math.abs(r - hex.r);
		var sDiff = Math.abs(s - hex.s);

		if (qDiff > rDiff && qDiff > sDiff)
			q = -r - s;
		else if (rDiff > sDiff)
			r = -q - s;
		else
			s = -q - r;
		return new Hex(q, r, s);
	}

	static public function hexLerp(a:Hex, b:Hex, t:Float):FractionalHex {
		return new FractionalHex(a.q + (b.q - a.q) * t,
								 a.r + (b.r - a.r) * t,
								 a.s + (b.s - a.s) * t);
	}

	static public function lineDraw(a:Hex, b:Hex):Array<Hex> {
		var n:Int = distance(a, b);
		var results:Array<Hex> = new Array<Hex>();
		var step:Float = 1 / Math.max(n, 1);
		for (i in 0...n+1)
			results.push(roundHex(hexLerp(a, b, step * i)));
		return results;
	}
}
