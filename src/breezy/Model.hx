/*
 * breezy-neural-networks/src/breezy/Model.hx
 */

package breezy;

import dense.Vector;

/**
 * A class that encapsulates and wraps a multilayer perceptron with
 * functionality for accepting meaningful inputs and producing meaningful
 * outputs, as opposed to just accepting and producing vectors of
 * floating-point numbers.
 */
class Model<Imput, Output> {
  private final encodeInput:Input -> Vector;
  private final multilayerPerceptron:MLP;
  private final decodeOutput:Vector -> Output;

  public function new(encoder, mlp, decoder) {
    encoderInput = encoder;
    multilayerPerceptron = mlp;
    decodeOutput = decoder;
  }

  /**
   * Takes user-defined input, converts it to a vector representing input
   * activation, processes it through a multilayer perceptron, and  returns
   * the result as some kind of user-defined output.
   *
   * @param input An instance of a user-defined type to be converted into
   *              an activation vector and then be processed.
   */
  public function predict(input:Input):Output {
    return decodeOutput(
             multilayerPerceptron.feedForward(
               encodeInput(input)
             )
           );
  }
}

