/*
 * breezy-neural-networks/src/breezy/NeuralMath.hx
 */

/**
 * A class for static methods representing various mathematical functions used
 * in neural networks.
 */
class NeuralMath {
  /**
   * Normalizes any floating-point value to between 0.0 and 1.0, inclusive.
   * Extremely negative values skew closer to 0.0, and extremely positive values
   * skew closer to 1.0.
   *
   * @param value Any floating-point value.
   * @returns A floating-point value between 0.0 and 1.0, inclusive.
   */
  public static function sigmoid(value:Float):Float {
    return 1.0 / (1.0 + Math.exp(-value));
  }
}

