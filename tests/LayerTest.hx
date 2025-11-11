/*
 * breezy-neural-networks/tests/LayerTest.hx
 */

package tests;

import breezy.Layer;

private final assert = Assert.assert;

@:access(breezy.Layer)
class LayerTest {
  public static function run():Void {
    trace("Now running all tests for the class breezy.Layer...");

    uniformlyRandomizedTest();

    trace("...all tests passed!");
  }

  private static function uniformlyRandomizedTest():Void {
    final layer = Layer.uniformlyRandomized(5, 7);

    assert(layer.neuronCount == 5);
    assert(layer.inputNeuronCount == 7);

    assert(
      layer.weights.rows * layer.weights.columns
      == layer.neuronCount * layer.inputNeuronCount
    );

    assert(layer.biases.length == layer.neuronCount);
  }
}

