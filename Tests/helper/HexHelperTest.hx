package helper;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import geom.Hex;
import geom.Offset;
import helper.HexHelper;

using helper.HexHelper;

class HexHelperTest
{
	public function new() {}

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

	@Test
	public function testLength():Void {
		var h1 = new Hex(0, 0);
		Assert.areEqual(0, HexHelper.length(h1));
		var h2 = new Hex(1, -1);
		Assert.areEqual(1, HexHelper.length(h2));
		var h3 = new Hex(1, 1);
		Assert.areEqual(2, HexHelper.length(h3));
	}

	@Test
	public function testLengthUsing():Void {
		var h1 = new Hex(0, 0);
		Assert.areEqual(0, h1.length());
		var h2 = new Hex(4, -2);
		Assert.areEqual(4, h2.length());
		var h3 = new Hex(-1, -5);
		Assert.areEqual(6, h3.length());
	}

	@Test
	public function testDistance():Void {
		var h1 = new Hex(0, 0);
		var h2 = new Hex(1, -1);
		var h3 = new Hex(1, 1);
		Assert.areEqual(1, HexHelper.distance(h1, h2));
		Assert.areEqual(2, HexHelper.distance(h1, h3));
		Assert.areEqual(2, HexHelper.distance(h2, h3));
		Assert.areEqual(HexHelper.distance(h1, h2), HexHelper.distance(h2, h1));
		Assert.areEqual(HexHelper.distance(h1, h3), HexHelper.distance(h3, h1));
		Assert.areEqual(HexHelper.distance(h2, h3), HexHelper.distance(h3, h2));
	}

	@Test
	public function testDistanceUsing():Void {
		var h1 = new Hex(0, 0);
		var h2 = new Hex(4, -2);
		var h3 = new Hex(-1, -5);
		Assert.areEqual(4, h1.distance(h2));
		Assert.areEqual(6, h1.distance(h3));
		Assert.areEqual(8, h2.distance(h3));
		Assert.areEqual(h1.distance(h2), h2.distance(h1));
		Assert.areEqual(h1.distance(h3), h3.distance(h1));
		Assert.areEqual(h2.distance(h3), h3.distance(h2));
	}

	@Test
	public function testNeighbouring():Void {
		var h = new Hex(2, 3);
		var h0 = HexHelper.neighbour(h, 0);
		Assert.areEqual(3, h0.q);
		Assert.areEqual(3, h0.r);
		Assert.areEqual(-6, h0.s);
		var h1 = HexHelper.neighbour(h, 1);
		Assert.areEqual(3, h1.q);
		Assert.areEqual(2, h1.r);
		Assert.areEqual(-5, h1.s);
		var h2 = HexHelper.neighbour(h, 2);
		Assert.areEqual(2, h2.q);
		Assert.areEqual(2, h2.r);
		Assert.areEqual(-4, h2.s);
		var h3 = HexHelper.neighbour(h, 3);
		Assert.areEqual(1, h3.q);
		Assert.areEqual(3, h3.r);
		Assert.areEqual(-4, h3.s);
		var h4 = HexHelper.neighbour(h, 4);
		Assert.areEqual(1, h4.q);
		Assert.areEqual(4, h4.r);
		Assert.areEqual(-5, h4.s);
		var h5 = HexHelper.neighbour(h, 5);
		Assert.areEqual(2, h5.q);
		Assert.areEqual(4, h5.r);
		Assert.areEqual(-6, h5.s);
	}


	@Test
	public function testNeighbourReciprocityUsing():Void {
		var h = new Hex(2, 3);
		var h0 = h.neighbour(0);
		var h1 = h.neighbour(1);
		var h2 = h.neighbour(2);
		var h3 = h.neighbour(3);
		var h4 = h.neighbour(4);
		var h5 = h.neighbour(5);
		Assert.areEqual(h.q, h0.neighbour(3).q);
		Assert.areEqual(h.r, h0.neighbour(3).r);
		Assert.areEqual(h.s, h0.neighbour(3).s);
		Assert.areEqual(h.q, h1.neighbour(4).q);
		Assert.areEqual(h.r, h1.neighbour(4).r);
		Assert.areEqual(h.s, h1.neighbour(4).s);
		Assert.areEqual(h.q, h2.neighbour(5).q);
		Assert.areEqual(h.r, h2.neighbour(5).r);
		Assert.areEqual(h.s, h2.neighbour(5).s);
		Assert.areEqual(h.q, h3.neighbour(0).q);
		Assert.areEqual(h.r, h3.neighbour(0).r);
		Assert.areEqual(h.s, h3.neighbour(0).s);
		Assert.areEqual(h.q, h4.neighbour(1).q);
		Assert.areEqual(h.r, h4.neighbour(1).r);
		Assert.areEqual(h.s, h4.neighbour(1).s);
		Assert.areEqual(h.q, h5.neighbour(2).q);
		Assert.areEqual(h.r, h5.neighbour(2).r);
		Assert.areEqual(h.s, h5.neighbour(2).s);
	}
}