package geom;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

class HexTest
{
	public function new() {}

	@Test
	public function testConstructorWithAllParams():Void
	{
		var h:Hex = new Hex(1, 0, -1);
		Assert.areEqual(1, h.q);
		Assert.areEqual(0, h.r);
		Assert.areEqual(-1, h.s);

		h = new Hex(2, 2, -4);
		Assert.areEqual(2, h.q);
		Assert.areEqual(2, h.r);
		Assert.areEqual(-4, h.s);
	}

	@Test
	public function testConstructorWithoutAllParams():Void
	{
		var h:Hex = new Hex(1, 0);
		Assert.areEqual(1, h.q);
		Assert.areEqual(0, h.r);
		Assert.areEqual(-1, h.s);

		h = new Hex(2, 2);
		Assert.areEqual(2, h.q);
		Assert.areEqual(2, h.r);
		Assert.areEqual(-4, h.s);
	}

	@Test
	public function testDirections():Void {
		Assert.areEqual(1, Hex.direction(0).q);
		Assert.areEqual(0, Hex.direction(0).r);
		Assert.areEqual(-1, Hex.direction(0).s);
		Assert.areEqual(1, Hex.direction(1).q);
		Assert.areEqual(-1, Hex.direction(1).r);
		Assert.areEqual(0, Hex.direction(1).s);
		Assert.areEqual(0, Hex.direction(2).q);
		Assert.areEqual(-1, Hex.direction(2).r);
		Assert.areEqual(1, Hex.direction(2).s);
		Assert.areEqual(-1, Hex.direction(3).q);
		Assert.areEqual(0, Hex.direction(3).r);
		Assert.areEqual(1, Hex.direction(3).s);
		Assert.areEqual(-1, Hex.direction(4).q);
		Assert.areEqual(1, Hex.direction(4).r);
		Assert.areEqual(0, Hex.direction(4).s);
		Assert.areEqual(0, Hex.direction(5).q);
		Assert.areEqual(1, Hex.direction(5).r);
		Assert.areEqual(-1, Hex.direction(5).s);
	}

	@Test
	public function testDirectionsAreCyclic() {
		Assert.areEqual(Hex.direction(0), Hex.direction(6));
		Assert.areEqual(Hex.direction(0), Hex.direction(-6));
		Assert.areEqual(Hex.direction(1), Hex.direction(7));
		Assert.areEqual(Hex.direction(1), Hex.direction(-5));
		Assert.areEqual(Hex.direction(2), Hex.direction(8));
		Assert.areEqual(Hex.direction(2), Hex.direction(-4));
		Assert.areEqual(Hex.direction(3), Hex.direction(9));
		Assert.areEqual(Hex.direction(3), Hex.direction(-3));
		Assert.areEqual(Hex.direction(4), Hex.direction(10));
		Assert.areEqual(Hex.direction(4), Hex.direction(-2));
		Assert.areEqual(Hex.direction(5), Hex.direction(11));
		Assert.areEqual(Hex.direction(5), Hex.direction(-1));
	}
}
