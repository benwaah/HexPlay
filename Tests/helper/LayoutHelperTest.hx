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
	private var layout:Layout;
	private var hex:Hex;

	public function new() {}

	@Before
	public function setup():Void
	{
		var origin = new Point(100, 100);
		var size = new Point(64, 32);
		layout = new Layout(Orientation.LAYOUT_FLAT, size, origin);
		hex = new Hex(2, 2);
	}

	@After
	public function tearDown():Void
	{
		layout = null;
		hex = null;
	}

	@Test
	public function testHexToPixel():Void
	{
		var pt = layout.hexToPixel(hex);
		Assert.areEqual(292, pt.x);
		Assert.areEqual(266, Math.round(pt.y));
	}

	@Test
	public function testPixelToHex():Void {
		var pt = new Point(292, 266);
		var h = layout.pixelToHex(pt);
		Assert.areEqual(2, h.q);
		Assert.areEqual(2, h.r);
	}
}