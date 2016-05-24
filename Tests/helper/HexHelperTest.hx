package helper;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import geom.Hex;
import geom.Offset;
import geom.Point;
import helper.HexHelper;

using helper.HexHelper;

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
	public function testHexCornerReturnsNonNullPointUsing():Void
	{
		var center = new Point();
		for (i in 0 ... 6) {
			var corner = center.hexCorner(32, i);
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
	public function testHexCornerisCyclingUsing():Void
	{
		var center = new Point();
		for (i in 0 ... 6) {
			var corner1 = center.hexCorner(32, i);
			var corner2 = center.hexCorner(32, i + 6);
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
	public function testHexToOddRConversionUsing():Void
	{
		var c1:Hex = new Hex(10, -15, 5);
		var o1:Offset = c1.toOddR();
		var c2:Hex = o1.hexFromOddR();
		var c3:Hex = new Hex(0, 0, 0);
		var o2:Offset = c3.toOddR();
		var c4:Hex = o2.hexFromOddR();
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

	@Test
	public function testHexToOddQConversionUsing():Void
	{
		var c1:Hex = new Hex(10, -15, 5);
		var o1:Offset = c1.toOddQ();
		var c2:Hex = o1.hexFromOddQ();
		var c3:Hex = new Hex(0, 0, 0);
		var o2:Offset = c3.toOddQ();
		var c4:Hex = o2.hexFromOddQ();
		Assert.areEqual(c1.q, c2.q);
		Assert.areEqual(c1.r, c2.r);
		Assert.areEqual(c1.s, c2.s);
		Assert.areEqual(c3.q, c4.q);
		Assert.areEqual(c3.r, c4.r);
		Assert.areEqual(c3.s, c4.s);
	}

	@Test
	public function testAddition():Void {
		var h1:Hex = new Hex(4, 1);
		var h2:Hex = new Hex(-3, 2);
		var h3 = HexHelper.add(h1, h2);
		Assert.areEqual(1, h3.q);
		Assert.areEqual(3, h3.r);
		Assert.areEqual(-4, h3.s);
	}

	@Test
	public function testAdditionUsing() {
		var h1:Hex = new Hex(4, 1);
		var h2:Hex = new Hex(-3, 2);
		var h3 = h1.add(h2);
		Assert.areEqual(1, h3.q);
		Assert.areEqual(3, h3.r);
		Assert.areEqual(-4, h3.s);
	}

	@Test
	public function testSubstraction():Void {
		var h1:Hex = new Hex(4, 1);
		var h2:Hex = new Hex(-3, 2);
		var h3 = HexHelper.substract(h1, h2);
		Assert.areEqual(7, h3.q);
		Assert.areEqual(-1, h3.r);
		Assert.areEqual(-6, h3.s);
	}

	@Test
	public function testSubstractionUsing():Void {
		var h1:Hex = new Hex(4, 1);
		var h2:Hex = new Hex(-3, 2);
		var h3 = h1.substract(h2);
		var h4 = h2.substract(h1);
		Assert.areEqual(7, h3.q);
		Assert.areEqual(-1, h3.r);
		Assert.areEqual(-6, h3.s);
		Assert.areEqual(-7, h4.q);
		Assert.areEqual(1, h4.r);
		Assert.areEqual(6, h4.s);
	}

	@Test
	public function testMultiplication():Void {
		var h1:Hex = new Hex(4, 1);
		var h2 = HexHelper.multiply(h1, 3);
		Assert.areEqual(12, h2.q);
		Assert.areEqual(3, h2.r);
		Assert.areEqual(-15, h2.s);
	}

	@Test
	public function testMultiplicationUsing():Void {
		var h1:Hex = new Hex(4, 1);
		var h2 = h1.multiply(3);
		Assert.areEqual(12, h2.q);
		Assert.areEqual(3, h2.r);
		Assert.areEqual(-15, h2.s);
	}
}