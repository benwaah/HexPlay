package geom;

class Cube {
	public var x:Int;
	public var y:Int;
	public var z:Int;

	public function new(?x:Int = 0, ?y:Int = 0, ?z:Int = 0) {
		if (x + y + z != 0)
			throw "Cube coordinates should sum up to 0";
		this.x = x;
		this.y = y;
		this.z = z;
	}
}
