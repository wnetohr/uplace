class Test {
  String testId;
  String name;
  double qtd;
  DateTime date;

  Test({
    required this.name,
    required this.testId,
    required this.qtd,
    required this.date,
  });

  factory Test.fSTests(Map<String, dynamic> json, String testId) {
    return Test(
      testId: testId,
      name: json["name"],
      date: json["dateof"].toDate(),
      qtd: json["qtdof"],
    );
  }

  factory Test.fSTests2(Map<String, dynamic> json, String testId) {
    return Test(
      testId: testId,
      name: json["namelocal"] + json["namesublocal"],
      date: json["datefrom"].toDate(),
      qtd: json["quantity"],
    );
  }
}
