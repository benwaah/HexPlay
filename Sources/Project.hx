package;

import config.Config;
import geom.Hex;
import geom.Layout;
import geom.Orientation;
import geom.Point;
import kha.Framebuffer;
import kha.input.Mouse;

using helper.LayoutHelper;

class Project {
	public var layouts:Array<Layout>;
	public var hexes:Array<Hex>;

	private var currentLayout:Int = 0;

	public function new() {
		createLayouts();
		createHexes();
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for (i in 0 ... hexes.length) {
			var corners = layouts[currentLayout].hexCorners(hexes[i]);
			var prevCorner = corners[5];
			for (i in 0 ... 6) {
				var corner = corners[i];
				graphics.drawLine(prevCorner.x, prevCorner.y, corner.x, corner.y);
				prevCorner = corner;
			}
		}
		graphics.end();
	}

	private function createLayouts():Void {
		var origin = new Point(400, 300);
		layouts = new Array<Layout>();
		layouts.push(new Layout(Orientation.LAYOUT_FLAT, new Point(20, 20), origin));
		layouts.push(new Layout(Orientation.LAYOUT_POINTY, new Point(20, 20), origin));
		layouts.push(new Layout(Orientation.LAYOUT_FLAT, new Point(10, 10), origin));
		layouts.push(new Layout(Orientation.LAYOUT_POINTY, new Point(10, 10), origin));
		layouts.push(new Layout(Orientation.LAYOUT_FLAT, new Point(40, 40), origin));
		layouts.push(new Layout(Orientation.LAYOUT_POINTY, new Point(40, 40), origin));
		layouts.push(new Layout(Orientation.LAYOUT_FLAT, new Point(15, 25), origin));
		layouts.push(new Layout(Orientation.LAYOUT_POINTY, new Point(15, 25), origin));
		layouts.push(new Layout(Orientation.LAYOUT_FLAT, new Point(25, 15), origin));
		layouts.push(new Layout(Orientation.LAYOUT_POINTY, new Point(25, 15), origin));
	}

	private function createHexes():Void {
		hexes = new Array<Hex>();
		for (s in -3...4) {
			for (r in -3...4) {
				for (q in -3...4) {
					if (q + r + s == 0) {
						hexes.push(new Hex(q, r, s));
						trace("Hex added: " + q + ", " + r + ", " + s);
					}
				}
			}
		}
	}

	private function onMouseDown(button:Int, x:Int, y:Int) {
		if (button == 0)
		{
			currentLayout = (currentLayout + 1) % layouts.length;
		}
	}
}
