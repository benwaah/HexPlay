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
}
