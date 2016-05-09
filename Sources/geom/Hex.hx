package geom;

import helper.HexHelper;
import kha.graphics2.Graphics;

class Hex {
	static public inline var HEX_SIZE = 32.0;

	public var x:Int;
	public var y:Int;

	public function new(?x:Int = 0, ?y:Int = 0) {
		this.x = x;
		this.y = y;
	}

	public function update() {

	}

	public function render(graphics:Graphics) {
		var center = new Point(x, y);
		var prevCorner = HexHelper.hexCorner(center, HEX_SIZE, 5);
		for (i in 0 ... 6) {
			var corner = HexHelper.hexCorner(center, HEX_SIZE, i);
			graphics.drawLine(prevCorner.x, prevCorner.y, corner.x, corner.y);
			prevCorner = corner;
		}
	}
}