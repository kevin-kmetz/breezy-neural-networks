/*
 * breezy-neural-networks/tests/Tests.hx
 */

package tests;

class Tests {
  private static function main():Void {
    trace("\nNow running all tests for the package 'breezy'...");

    runAll();

    trace("...all tests for package 'breezy' passed!\n");
  }

  private static function runAll():Void {
    LayerTest.run();
  }
}

