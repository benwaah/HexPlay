package;

import geom.Hex;
import kha.Framebuffer;

class Project {
	public var hexes:Array<Hex>;

	public function new() {
		hexes = new Array<Hex>();
		for (i in 0 ... 10) {
			hexes.push(new Hex(Math.round(Math.random() * 800),
							   Math.round(Math.random() * 600)));
		}
	}

	public function update():Void {

	}

	public function render(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		for (i in 0 ... hexes.length) {
			hexes[i].render(g);
		}
		g.end();
	}
}
