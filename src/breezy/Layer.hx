/*
 * breezy-neural-networks/src/breezy/Layer.hx
 */

import dense.Vector;
import dense.Matrix;

/**
 * Represents a single fully-connected (non-input) layer of neurons in a
 * multi-layer perceptron.
 */
class Layer {
  public final inputNeuronCount:Int;
  public final neuronCount:Int;

  private final weights:Matrix;
  private final biases:Vector;

  private function new(weights:Matrix, biases:Vector) {
    this.neuronCount = weights.rows;
    this.inputNeuronCount = weights.columns;

    this.weights = weights;
    this.biases = biases;
  }

  public static function uniformlyRandomized(
    neuronCount:Int, inputNeuronCount:Int
  ):Layer {
    final weights = Matrix.randomized(neuronCount, inputNeuronCount, -1.0, 1.0);
    final biases = Vector.randomized(neuronCount, -1.0, 1.0);

    return new Layer(weights, biases);
  }
}
