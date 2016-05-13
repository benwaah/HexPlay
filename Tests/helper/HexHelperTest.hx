package helper;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import geom.Cube;
import geom.Hex;
import geom.OddQ;
import geom.OddR;
import geom.Point;
import helper.HexHelper;

class HexHelperTest
{


	public function new()
	{

	}

	@BeforeClass
	public function beforeClass():Void
	{
	}

	@AfterClass
	public function afterClass():Void
	{
	}

	@Before
	public function setup():Void
	{
	}

	@After
	public function tearDown():Void
	{
	}

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
	public function testHexToCubeConversion():Void
	{
		var h1:Hex = new Hex(10, 25);
		var c1:Cube = HexHelper.hexToCube(h1);
		var h2:Hex = HexHelper.cubeToHex(c1);
		var h3:Hex = new Hex(1, 1);
		var c2:Cube = HexHelper.hexToCube(h3);
		var h4:Hex = HexHelper.cubeToHex(c2);
		Assert.areEqual(h1.q, h2.q);
		Assert.areEqual(h1.r, h2.r);
		Assert.areEqual(h3.q, h4.q);
		Assert.areEqual(h3.r, h4.r);
	}

	@Test
	public function testCubeToOddRConversion():Void
	{
		var c1:Cube = new Cube(10, -15, 5);
		var o1:OddR = HexHelper.cubeToOddR(c1);
		var c2:Cube = HexHelper.oddRToCube(o1);
		var c3:Cube = new Cube(0, 0, 0);
		var o2:OddR = HexHelper.cubeToOddR(c3);
		var c4:Cube = HexHelper.oddRToCube(o2);
		Assert.areEqual(c1.x, c2.x);
		Assert.areEqual(c1.y, c2.y);
		Assert.areEqual(c1.z, c2.z);
		Assert.areEqual(c3.x, c4.x);
		Assert.areEqual(c3.y, c4.y);
		Assert.areEqual(c3.z, c4.z);
	}

	@Test
	public function testCubeToOddQConversion():Void
	{
		var c1:Cube = new Cube(10, -15, 5);
		var o1:OddQ = HexHelper.cubeToOddQ(c1);
		var c2:Cube = HexHelper.oddQToCube(o1);
		var c3:Cube = new Cube(0, 0, 0);
		var o2:OddQ = HexHelper.cubeToOddQ(c3);
		var c4:Cube = HexHelper.oddQToCube(o2);
		Assert.areEqual(c1.x, c2.x);
		Assert.areEqual(c1.y, c2.y);
		Assert.areEqual(c1.z, c2.z);
		Assert.areEqual(c3.x, c4.x);
		Assert.areEqual(c3.y, c4.y);
		Assert.areEqual(c3.z, c4.z);
	}
}