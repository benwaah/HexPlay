package helper;

import geom.Point;

class HexHelper {
	static public function hexCorner(center:Point, size:Float, i:Int) {
		var angleDeg = 60 * i;
		var angleRad = Math.PI / 180 * angleDeg;
		return new Point(center.x + size * Math.cos(angleRad),
						 center.y + size * Math.sin(angleRad));
	}
}
