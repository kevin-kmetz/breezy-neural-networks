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

  private final activationFunc:Float -> Float;

  private function new(
    weights:Matrix, biases:Vector, activationFunc:Float -> Float
  ) {
    this.neuronCount = weights.rows;
    this.inputNeuronCount = weights.columns;

    this.weights = weights;
    this.biases = biases;
  }

  /**
   * Creates a fully-connected layer for a multi-layer perceptron that has
   * values for its weight matrix and bias vector that are randomly generated
   * from a uniform distribution spanning -1.0 to 1.0 (inclusive and
   * exclusive, respectively).
   *
   * @param neuronCount The number of neurons in the actual layer itself.
   * @param inputNeuronCount The number of neurons in the preceding layer.
   * @param activationFunc An activation function that takes a floating-point
   *                       number and returns a floating-point number.
   */
  public static function uniformlyRandomized(
    neuronCount:Int, inputNeuronCount:Int,
    activationFunc:Float -> Float = breezy.NeuralMath.sigmoid
  ):Layer {
    final weights = Matrix.randomized(neuronCount, inputNeuronCount, -1.0, 1.0);
    final biases = Vector.randomized(neuronCount, -1.0, 1.0);

    return new Layer(weights, biases);
  }

  public function feedForward(inputActivation:Vector):Vector {
    return applyActivation(
             sumEdgesAddBias(
               calculateEdges(inputActivation)
             )
           );
  }

  private function calculateEdges(inputActivation:Vector):Matrix {
    return weights.multiplyVector(inputActivation);
  }

  private function sumEdgesAddBias(preActivation:Matrix):Vector {
  }

  private function applyActivation(preActivation:Vector):Vector {
  }
}
