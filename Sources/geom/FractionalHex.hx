package geom;

class FractionalHex {
	public var q:Float = 0;
	public var r:Float = 0;
	public var s:Float = 0;

	public function new(_q:Float, _r:Float, _s:Float) {
		q = _q;
		r = _r;
		if (_s == null)
			s = -q - r;
		else
			s = _s;
	}
}
