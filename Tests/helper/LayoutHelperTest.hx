package helper;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;

import geom.Hex;
import geom.Layout;
import geom.Orientation;
import geom.Point;
import helper.LayoutHelper;

using helper.LayoutHelper;

class LayoutHelperTest {
	private var flatLayout:Layout;
	private var pointyLayout:Layout;
	private var hex:Hex;

	public function new() {}

	@Before
	public function setup():Void
	{
		var origin = new Point(100, 100);
		var size = new Point(64, 32);
		flatLayout = new Layout(Orientation.LAYOUT_FLAT, size, origin);
		pointyLayout = new Layout(Orientation.LAYOUT_POINTY, size, origin);
		hex = new Hex(2, 2);
	}

	@After
	public function tearDown():Void
	{
		flatLayout = null;
		pointyLayout = null;
		hex = null;
	}

	@Test
	public function testHexToPixelWithFlatLayout():Void
	{
		var pt = flatLayout.hexToPixel(hex);
		assertAreAlmostEqual(292, pt.x);
		assertAreAlmostEqual(266, pt.y);
	}

	@Test
	public function testHexToPixelWithPointyLayout():Void
	{
		var pt = pointyLayout.hexToPixel(hex);
		assertAreAlmostEqual(433, pt.x);
		assertAreAlmostEqual(196, pt.y);
	}

	@Test
	public function testPixelToHexWithFlatLayout():Void {
		var pt = new Point(292, 266);
		var h = flatLayout.pixelToHex(pt);
		Assert.areEqual(2, h.q);
		Assert.areEqual(2, h.r);
	}

	@Test
	public function testPixelToHexWithPointyLayout():Void {
		var pt = new Point(433, 196);
		var h = pointyLayout.pixelToHex(pt);
		Assert.areEqual(2, h.q);
		Assert.areEqual(2, h.r);
	}

	@Test
	public function testCornerWithFlatLayout():Void {
		assertAreAlmostEqual(64, flatLayout.corner(0).x);
		assertAreAlmostEqual(0, flatLayout.corner(0).y);
		assertAreAlmostEqual(32, flatLayout.corner(1).x);
		assertAreAlmostEqual(28, flatLayout.corner(1).y);
		assertAreAlmostEqual(-32, flatLayout.corner(2).x);
		assertAreAlmostEqual(28, flatLayout.corner(2).y);
		assertAreAlmostEqual(-64, flatLayout.corner(3).x);
		assertAreAlmostEqual(0, flatLayout.corner(3).y);
		assertAreAlmostEqual(-32, flatLayout.corner(4).x);
		assertAreAlmostEqual(-28, flatLayout.corner(4).y);
		assertAreAlmostEqual(32, flatLayout.corner(5).x);
		assertAreAlmostEqual(-28, flatLayout.corner(5).y);
	}

	@Test
	public function testCornerWithPointyLayout():Void {
		assertAreAlmostEqual(55, pointyLayout.corner(0).x);
		assertAreAlmostEqual(16, pointyLayout.corner(0).y);
		assertAreAlmostEqual(0, pointyLayout.corner(1).x);
		assertAreAlmostEqual(32, pointyLayout.corner(1).y);
		assertAreAlmostEqual(-55, pointyLayout.corner(2).x);
		assertAreAlmostEqual(16, pointyLayout.corner(2).y);
		assertAreAlmostEqual(-55, pointyLayout.corner(3).x);
		assertAreAlmostEqual(-16, pointyLayout.corner(3).y);
		assertAreAlmostEqual(0, pointyLayout.corner(4).x);
		assertAreAlmostEqual(-32, pointyLayout.corner(4).y);
		assertAreAlmostEqual(55, pointyLayout.corner(5).x);
		assertAreAlmostEqual(-16, pointyLayout.corner(5).y);
	}

	@Test
	public function testCornersWithFlatLayout():Void {
		var corners = flatLayout.hexCorners(hex);
		Assert.areEqual(6, corners.length);
		assertAreAlmostEqual(356, corners[0].x);
		assertAreAlmostEqual(266, corners[0].y);
		assertAreAlmostEqual(324, corners[1].x);
		assertAreAlmostEqual(294, corners[1].y);
		assertAreAlmostEqual(260, corners[2].x);
		assertAreAlmostEqual(294, corners[2].y);
		assertAreAlmostEqual(228, corners[3].x);
		assertAreAlmostEqual(266, corners[3].y);
		assertAreAlmostEqual(260, corners[4].x);
		assertAreAlmostEqual(239, corners[4].y);
		assertAreAlmostEqual(324, corners[5].x);
		assertAreAlmostEqual(239, corners[5].y);
	}

	@Test
	public function testCornersWithPointyLayout():Void {
		var corners = pointyLayout.hexCorners(hex);
		Assert.areEqual(6, corners.length);
		assertAreAlmostEqual(488, corners[0].x);
		assertAreAlmostEqual(212, corners[0].y);
		assertAreAlmostEqual(433, corners[1].x);
		assertAreAlmostEqual(228, corners[1].y);
		assertAreAlmostEqual(377, corners[2].x);
		assertAreAlmostEqual(212, corners[2].y);
		assertAreAlmostEqual(377, corners[3].x);
		assertAreAlmostEqual(180, corners[3].y);
		assertAreAlmostEqual(433, corners[4].x);
		assertAreAlmostEqual(164, corners[4].y);
		assertAreAlmostEqual(488, corners[5].x);
		assertAreAlmostEqual(180, corners[5].y);
	}

	public function assertAreAlmostEqual(expected:Int, value:Float) {
		Assert.areEqual(expected, Math.round(value));
	}
}