class DialogCardModel {
  String title;
  String firstTitleOption;
  String secondTitleOption;
  bool firstOptionStatus;
  bool secondOptionStatus;
  List<String> optionsValue;
  String groupValue;

  DialogCardModel({
    required this.title,
    required this.firstTitleOption,
    required this.secondTitleOption,
    required this.firstOptionStatus,
    required this.secondOptionStatus,
    required this.groupValue,
    required this.optionsValue,
  });
}

List<DialogCardModel> dialogCardList = [
  DialogCardModel(
      title: "حالة الاستخدام",
      firstTitleOption: "مستخدمة ",
      secondTitleOption: "غير مستخدمة",
      firstOptionStatus: false,
      secondOptionStatus: false,
      groupValue: "",
      optionsValue: ["used", "notUsed"]),
  DialogCardModel(
      title: "الحالة",
      firstTitleOption: "موجودة",
      secondTitleOption: "غير موجودة",
      firstOptionStatus: false,
      secondOptionStatus: false,
      groupValue: "",
      optionsValue: ["existing", "notExisting"]),
  DialogCardModel(
      title: "عداد الضغط",
      firstTitleOption: "جيد",
      secondTitleOption: "غير جيد",
      firstOptionStatus: false,
      secondOptionStatus: false,
      groupValue: "",
      optionsValue: ["good", "bad"]),
  DialogCardModel(
      title: "مسمار الأمان",
      firstTitleOption: "جيد",
      secondTitleOption: "غير جيد",
      firstOptionStatus: false,
      secondOptionStatus: false,
      groupValue: "",
      optionsValue: ["goodPin", "badPin"]),
  DialogCardModel(
      title: "المقبض",
      firstTitleOption: "جيد",
      secondTitleOption: "غير جيد",
      firstOptionStatus: false,
      secondOptionStatus: false,
      groupValue: "",
      optionsValue: ["GoodHandle", "BadHandle"]),
  DialogCardModel(
      title: "الخرطوم",
      firstTitleOption: "جيد",
      secondTitleOption: "غير جيد",
      firstOptionStatus: false,
      secondOptionStatus: false,
      groupValue: "",
      optionsValue: ["goodNozzle", "badNozzle"]),
];
