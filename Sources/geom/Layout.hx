package geom;

class Layout {
	public var orientation(default, null):Orientation;
	public var size(default, null):Point;
	public var origin(default, null):Point;

	public function new(o:Orientation, size:Point, origin:Point) {
		orientation = o;
		this.size = size;
		this.origin = origin;
	}
}