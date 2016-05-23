package;

import config.Config;
import geom.Hex;
import geom.Point;
import helper.HexHelper;
import kha.Framebuffer;
import kha.input.Mouse;

class Project {
	public var hexes:Array<Hex>;

	public function new() {
		hexes = new Array<Hex>();
		for (i in 0 ... 10) {
			hexes.push(new Hex(Math.round(Math.random() * 800),
							   Math.round(Math.random() * 600)));
		}
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (i in 0 ... hexes.length) {
			var center = new Point(hexes[i].q, hexes[i].r);
			// TODO: convert (q, r) position to real (x, y) position
			var prevCorner = HexHelper.hexCorner(center, Config.HEX_SIZE, 5);
			for (i in 0 ... 6) {
				var corner = HexHelper.hexCorner(center, Config.HEX_SIZE, i);
				graphics.drawLine(prevCorner.x, prevCorner.y, corner.x, corner.y);
				prevCorner = corner;
			}
		}
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int) {
		if (button == 0)
		{
			HexHelper.pointyTopped = !HexHelper.pointyTopped;
		}
	}
}
