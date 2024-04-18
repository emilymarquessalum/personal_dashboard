



class WheelObjectiveRecord {

  final Map<String, double> values;
  final bool documented;

  WheelObjectiveRecord({
    required this.values,
    required this.documented,
  });


  WheelObjectiveRecord copyWith({
    Map<String, double>? values,
    bool? documented,
  }) {
    return WheelObjectiveRecord(
      values: values ?? this.values,
      documented: documented ?? this.documented,
    );
  }


  double getValue(String key) {
    return values[key] ?? 1;
  }

  toJson() {
    return {
      "values": values,
      "documented": documented,
    };
  }

  static WheelObjectiveRecord fromJson(data) {
    return WheelObjectiveRecord(
      values: data["values"].cast<String, double>(),
      documented: data["documented"],
    );
  }
}