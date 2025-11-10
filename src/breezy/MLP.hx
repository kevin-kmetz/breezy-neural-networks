/*
 * breezy-neural-networks/src/breezy/MLP.hx
 */

import dense.Vector;

/**
 * Represent a multi-layer perceptron, a feed-forward neural network composed
 * from fully-connected layers of neurons.
 */
class MLP {
  /**
   * Represents the total count of all layers, including an input layer,
   * zero or more hidden layers, and an output layer.
   */
  public final totalLayerCount:Int;

  /**
   * Represents the number of layers that have bias vectors and a weight matrix.
   */
  public final parameterizedLayerCount:Int;

  /**
   * Represents the number of layers that are neither input nor output layers.
   */
  public final hiddenLayerCount:Int;

  private final layers:Array<Vector>;

  private function new(layers:Array<Vector>) {
    this.layers = layers;

    this.totalLayerCount = layers.length;
    this.parameterizedLayerCount = layers.length - 1;
    this.hiddenLayerCount = layers.length - 2;
  }

  public static function randomizedFromLayerSizes(layerSizes:Array<Int>):MLP {
    final layers:Array<Vector> = [];

    for (i in 1...layerSizes) {
      layers.push(
        Layer.uniformlyRandomized(
          layerSize[i].length,
          layerSize[i - 1].length
        )
      );
    }

    return new MLP(layers);
  }
}

