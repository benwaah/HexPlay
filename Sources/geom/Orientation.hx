package geom;

class Orientation {
	public static var LAYOUT_POINTY:Orientation = new Orientation(
		Math.sqrt(3), Math.sqrt(3) / 2, 0, 3 / 2,
		Math.sqrt(3) / 3, -1 / 3, 0, 2 / 3, 0.5
	);

	public static var LAYOUT_FLAT:Orientation = new Orientation(
		3 / 2, 0, Math.sqrt(3) / 2, Math.sqrt(3),
		2 / 3, 0, -1 / 3, Math.sqrt(3) / 3, 0
	);

	public var f0(default, null):Float;
	public var f1(default, null):Float;
	public var f2(default, null):Float;
	public var f3(default, null):Float;

	public var b0(default, null):Float;
	public var b1(default, null):Float;
	public var b2(default, null):Float;
	public var b3(default, null):Float;

	public var startAngle(default, null):Float;

	public function new(f0:Float, f1:Float, f2:Float, f3:Float,
						b0:Float, b1:Float, b2:Float, b3:Float,
						startAngle:Float) {
		this.f0 = f0;
		this.f1 = f1;
		this.f2 = f2;
		this.f3 = f3;
		this.b0 = b0;
		this.b1 = b1;
		this.b2 = b2;
		this.b3 = b3;
		this.startAngle = startAngle;
	}
}