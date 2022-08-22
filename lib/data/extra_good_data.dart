class ExtraGoodData {
  // class name UpperCamelCase
  int count = 0; // class properties lowerCamelCase

  // Use verb phrases when functions have side effects, or when they are
  // doing a lot of work
  void addToCount(int addValue) {
    count += addValue;
  }

  void resetCount() {
    count = 0;
  }

  // Noun phrases for functions with no side effects
  // NOTE - I didn't name the function "getAverageTemperature()"
  double averageTemperature(List<double> temperatures) {
    return temperatures.reduce((a, b) => a + b) / temperatures.length;
  }
}

enum ExtraAmazingEnum {
  // enum names UpperCamelCase
  enumValue1, // enum values lowerCamelCase
  enumValue2,
  enumValue3,
}
