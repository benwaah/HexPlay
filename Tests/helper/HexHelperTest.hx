package helper;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import geom.Hex;
import geom.Offset;
import geom.Point;
import helper.HexHelper;

class HexHelperTest
{
	public function new() {}

	@Test
	public function testHexCornerReturnsNonNullPoint():Void
	{
		var center = new Point();
		for (i in 0 ... 6) {
			var corner = HexHelper.hexCorner(center, 32, i);
			Assert.isNotNull(corner);
		}
	}

	@Test
	public function testHexCornerisCycling():Void
	{
		var center = new Point();
		for (i in 0 ... 6) {
			var corner1 = HexHelper.hexCorner(center, 32, i);
			var corner2 = HexHelper.hexCorner(center, 32, i + 6);
			Assert.areEqual(corner1.x, corner2.x);
			Assert.areEqual(corner1.y, corner2.y);
		}
	}

	@Test
	public function testHexToOddRConversion():Void
	{
		var c1:Hex = new Hex(10, -15, 5);
		var o1:Offset = HexHelper.toOddR(c1);
		var c2:Hex = HexHelper.hexFromOddR(o1);
		var c3:Hex = new Hex(0, 0, 0);
		var o2:Offset = HexHelper.toOddR(c3);
		var c4:Hex = HexHelper.hexFromOddR(o2);
		Assert.areEqual(c1.q, c2.q);
		Assert.areEqual(c1.r, c2.r);
		Assert.areEqual(c1.s, c2.s);
		Assert.areEqual(c3.q, c4.q);
		Assert.areEqual(c3.r, c4.r);
		Assert.areEqual(c3.s, c4.s);
	}

	@Test
	public function testHexToOddQConversion():Void
	{
		var c1:Hex = new Hex(10, -15, 5);
		var o1:Offset = HexHelper.toOddQ(c1);
		var c2:Hex = HexHelper.hexFromOddQ(o1);
		var c3:Hex = new Hex(0, 0, 0);
		var o2:Offset = HexHelper.toOddQ(c3);
		var c4:Hex = HexHelper.hexFromOddQ(o2);
		Assert.areEqual(c1.q, c2.q);
		Assert.areEqual(c1.r, c2.r);
		Assert.areEqual(c1.s, c2.s);
		Assert.areEqual(c3.q, c4.q);
		Assert.areEqual(c3.r, c4.r);
		Assert.areEqual(c3.s, c4.s);
	}
}