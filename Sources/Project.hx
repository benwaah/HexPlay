package;

import geom.Point;
import helper.HexHelper;
import kha.Framebuffer;
import kha.Color;

class Project {
	static public inline var HEX_SIZE = 32.0;

	public var corners:Array<Point>;

	public function new() {
		var center:Point = new Point(128, 128);
		corners = new Array<Point>();
		for (i in 0 ... 6) {
			var res = HexHelper.hexCorner(center, HEX_SIZE, i);
			corners.push(res);
		}
	}

	public function update():Void {

	}

	public function render(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		var prevCorner = corners[corners.length - 1];
		for (i in 0 ... corners.length) {
			g.drawLine(prevCorner.x, prevCorner.y, corners[i].x, corners[i].y);
			prevCorner = corners[i];
		}
		g.end();
	}
}
