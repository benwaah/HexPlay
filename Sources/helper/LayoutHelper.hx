package helper;

import geom.Hex;
import geom.Point;
import geom.Layout;

class LayoutHelper {
	static public function hexToPixel(layout:Layout, h:Hex):Point {
		var o = layout.orientation;
		var x:Float = (o.f0 * h.q + o.f1 * h.r) * layout.size.x;
		var y:Float = (o.f2 * h.q + o.f3 * h.r) * layout.size.y;
		return new Point(x + layout.origin.x, y + layout.origin.y);
	}

	static public function pixelToHex(layout:Layout, p:Point):Hex {
		var o = layout.orientation;
		var pt = new Point((p.x - layout.origin.x) / layout.size.x,
						   (p.y - layout.origin.y) / layout.size.y);
		var q:Int = Math.round(o.b0 * pt.x + o.b1 * pt.y);
		var r:Int = Math.round(o.b2 * pt.x + o.b3 * pt.y);
		return new Hex(q, r);
	}
}