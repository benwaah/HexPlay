import massive.munit.TestSuite;

import geom.HexTest;
import helper.HexHelperTest;
import helper.LayoutHelperTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(geom.HexTest);
		add(helper.HexHelperTest);
		add(helper.LayoutHelperTest);
	}
}
