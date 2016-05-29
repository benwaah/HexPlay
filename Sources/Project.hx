package;

import geom.Hex;
import geom.Layout;
import geom.Orientation;
import geom.Point;
import kha.Assets;
import kha.Font;
import kha.Framebuffer;
import kha.graphics2.Graphics;
import zui.Id;
import zui.Zui;

using helper.LayoutHelper;

class Project {
	private var ui:Zui;

	private var flatLayout:Layout;
	private var pointyLayout:Layout;
	private var flatInUse:Bool;

	private var lastMapSize:Int = -1;
	private var mapSize:Float;
	public var hexes:Array<Hex>;

	public function new() {
		createLayouts();
		createUI();
	}

	public function update():Void {
		var range = Math.round(mapSize);
		if (lastMapSize != range) {
			lastMapSize = range;
			createHexes(range);
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		// var layout = layouts[currentLayout];
		var layout = flatInUse ? flatLayout : pointyLayout;
		var graphics = framebuffer.g2;
		graphics.begin();
		for (i in 0 ... hexes.length) {
			var corners = layout.hexCorners(hexes[i]);
			var prevCorner = corners[5];
			for (i in 0 ... 6) {
				var corner = corners[i];
				graphics.drawLine(prevCorner.x, prevCorner.y, corner.x, corner.y);
				prevCorner = corner;
			}
		}
		graphics.end();
		gui(graphics);
	}

	private function createLayouts():Void {
		flatLayout = new Layout(Orientation.LAYOUT_FLAT, new Point(), new Point());
		pointyLayout = new Layout(Orientation.LAYOUT_POINTY, new Point(), new Point());
	}

	private function createHexes(range:Int):Void {
		hexes = new Array<Hex>();
		for (s in -range...(range + 1)) {
			for (r in -range...(range + 1)) {
				for (q in -range...(range + 1)) {
					if (q + r + s == 0) {
						hexes.push(new Hex(q, r, s));
					}
				}
			}
		}
	}

	private function createUI():Void {
		ui = new Zui(Assets.fonts.OpenSans, 64);
	}

	private function gui(graphics:Graphics) {
		ui.begin(graphics);
		if (ui.window(Id.window(), 600, 0, 200, 600)) {
			if (ui.node(Id.node(), 'Orientation', 0, true)) {
				flatInUse = ui.check(Id.check(), 'Use flat layout', true);
			}
			if (ui.node(Id.node(), 'Flat layout', 0, true)) {
				flatLayout.origin.x = ui.slider(Id.slider(), 'Origin X', 0, 800, false, 1, 400);
				flatLayout.origin.y = ui.slider(Id.slider(), 'Origin Y', 0, 600, false, 1, 300);
				flatLayout.size.x = ui.slider(Id.slider(), 'Width', 0, 120, false, 1, 40);
				flatLayout.size.y = ui.slider(Id.slider(), 'Height', 0, 120, false, 1, 40);
			}
			if (ui.node(Id.node(), 'Pointy layout', 0, true)) {
				pointyLayout.origin.x = ui.slider(Id.slider(), 'Origin X', 0, 800, false, 1, 400);
				pointyLayout.origin.y = ui.slider(Id.slider(), 'Origin Y', 0, 600, false, 1, 300);
				pointyLayout.size.x = ui.slider(Id.slider(), 'Width', 0, 120, false, 1, 40);
				pointyLayout.size.y = ui.slider(Id.slider(), 'Height', 0, 120, false, 1, 40);
			}
			if (ui.node(Id.node(), 'Map size', 0, true)) {
				mapSize = ui.slider(Id.slider(), 'Hexes from center', 0, 20, false, 1, 3);
			}
		}
		ui.end();
	}
}
