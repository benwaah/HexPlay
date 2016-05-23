package geom;

class Hex {
	public var q(get, null):Int = 0;
	public var r(get, null):Int = 0;
	public var s(get, null):Int;

	public function new(_q:Int, _r:Int, ?_s:Int) {
		q = _q;
		r = _r;
		if (_s == null)
			s = -q - r;
		else
			s = _s;
		if (q + r + s != 0) {
			throw("Invalid coordinates for Hex");
		}
	}

	public function get_q():Int {
		return q;
	}

	public function get_r():Int {
		return r;
	}

	public function get_s():Int {
		return -q - r;
	}
}
