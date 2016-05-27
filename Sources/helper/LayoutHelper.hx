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

	static public function corner(layout:Layout, corner:Int):Point {
		var size = layout.size;
		var angle = 2 * Math.PI * (corner + layout.orientation.startAngle) / 6;
		return new Point(size.x * Math.cos(angle), size.y * Math.sin(angle));
	}

	static public function hexCorners(layout:Layout, h:Hex):Array<Point> {
		var corners = new Array<Point>();
		var center = hexToPixel(layout, h);
		for (i in 0...6) {
			var offset = corner(layout, i);
			corners.push(new Point(center.x + offset.x, center.y + offset.y));
		}
		return corners;
	}
}