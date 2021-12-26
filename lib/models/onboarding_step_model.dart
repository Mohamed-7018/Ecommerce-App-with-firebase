class StepModel {
  final int id;
  final String text;

  StepModel({this.id, this.text});

  static List<StepModel> list = [
    StepModel(
      id: 5,
      text: "Browse the menu\nand order directly from\nthe application",
    ),
    StepModel(
      id: 2,
      text:
      "Your order will be\nimmediately collected and\nsent by our courier",
    ),
    StepModel(
      id: 3,
      text: "Pick update delivery\nat your door and enjoy\ngroceries",
    ),
  ];
}