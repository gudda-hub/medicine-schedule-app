import '../export.dart';

class MedicineModel {
  final String name;
  final String type;
  final String timing;
  final String daysTaken;
  final String status;

  MedicineModel(
      {required this.name,
      required this.type,
      required this.timing,
      required this.daysTaken,
      required this.status});

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      name: json['name'],
      type: json['type'],
      timing: json['timing'],
      daysTaken: json['daysTaken'],
      status: json['status'],
    );
  }
}

class DrawerItemModel {
  final IconData icon;
  final String title;
  final String caption;

  DrawerItemModel(
      {required this.icon, required this.title, required this.caption});
}

class CaretakersModel {
  final String img;
  final String name;

  CaretakersModel({required this.img, required this.name});
}

List<CaretakersModel> caretakersList = [
  CaretakersModel(img: "assets/person.jpg", name: "Dipa Luna"),
  CaretakersModel(img: "assets/person.jpg", name: "Roz Sod"),
  CaretakersModel(img: "assets/person.jpg", name: "Sunny Tuzan"),
];

List<String> weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

List<DrawerItemModel> drawerItemList = [
  DrawerItemModel(
      icon: Icons.notifications_outlined,
      title: "Notification",
      caption: "Check your medicine notification"),
  DrawerItemModel(
      icon: Icons.volume_down_outlined,
      title: "Sound",
      caption: "Ring, Silent, Vibrate"),
  DrawerItemModel(
      icon: Icons.person_outline,
      title: "Manage Your Account",
      caption: "Password, Email ID, Phone Number"),
  DrawerItemModel(
      icon: Icons.notifications_outlined,
      title: "Notification",
      caption: "Check your medicine notification"),
  DrawerItemModel(
      icon: Icons.notifications_outlined,
      title: "Notification",
      caption: "Check your medicine notification"),
];
List<String> timingList = ["Before Breakfast", "After Food", "Before Sleep"];
List<MedicineModel> medicineList = [
  MedicineModel(
      name: "Paracetamol",
      type: "Tablet",
      timing: "Before Breakfast",
      daysTaken: "day 01",
      status: "Taken"),
  MedicineModel(
      name: "Cough Syrup",
      type: "Syrup",
      timing: "After Food",
      daysTaken: "day 01",
      status: "Missed"),
  MedicineModel(
      name: "Vitamin D",
      type: "Capsule",
      timing: "Before Breakfast",
      daysTaken: "day 02",
      status: "Skipped"),
  MedicineModel(
      name: "Insulin",
      type: "Injection",
      timing: "Before Sleep",
      daysTaken: "day 05",
      status: "Left"),
  MedicineModel(
      name: "Painkiller",
      type: "Tablet",
      timing: "After Food",
      daysTaken: "day 03",
      status: "Snoozed"),
  MedicineModel(
      name: "Antibiotic",
      type: "Capsule",
      timing: "Before Sleep",
      daysTaken: "day 04",
      status: "Taken"),
  MedicineModel(
      name: "Eye Drops",
      type: "Drops",
      timing: "Before Sleep",
      daysTaken: "day 07",
      status: "Missed"),
  MedicineModel(
      name: "Inhaler",
      type: "Inhaler",
      timing: "Before Breakfast",
      daysTaken: "day 10",
      status: "Skipped"),
  MedicineModel(
      name: "Vitamin B12",
      type: "Tablet",
      timing: "After Food",
      daysTaken: "day 06",
      status: "Left"),
  MedicineModel(
      name: "Ointment",
      type: "Ointment",
      timing: "Before Sleep",
      daysTaken: "day 08",
      status: "Snoozed"),
];

Map<String, Color> statusColors = {
  "Taken": Colors.green,
  "Missed": Colors.red,
  "Skipped": Colors.orange,
  "Left": Colors.blueGrey,
  "Snoozed": Colors.blue,
};

Map<String, IconData> typeIcons = {
  "Tablet": FontAwesomeIcons.pills,
  "Syrup": FontAwesomeIcons.prescriptionBottle,
  "Capsule": FontAwesomeIcons.capsules,
  "Injection": FontAwesomeIcons.syringe,
  "Drops": FontAwesomeIcons.eyeDropper,
  "Ointment": FontAwesomeIcons.bandAid,
  "Inhaler": FontAwesomeIcons.lungs
};

Map<String, Color> typeColors = {
  "Tablet": Colors.blue.shade200,
  "Syrup": Colors.purple.shade200,
  "Capsule": Colors.orange.shade200,
  "Injection": Colors.red.shade200,
  "Drops": Colors.teal.shade200,
  "Ointment": Colors.brown.shade200,
  "Inhaler": Colors.indigo.shade200,
};
