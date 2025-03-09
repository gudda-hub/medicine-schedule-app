import 'package:intl/intl.dart';

import '../../export.dart';

class LandingBodySection extends StatelessWidget {
  final ScrollPhysics physics;
  const LandingBodySection({super.key, required this.physics});

  @override
  Widget build(BuildContext context) {
    List<MedicineModel> morningMedicine = medicineList
        .where((medicine) => medicine.timing == 'Before Breakfast')
        .toList();
    List<MedicineModel> afternoonMedicine = medicineList
        .where((medicine) => medicine.timing == 'After Food')
        .toList();
    List<MedicineModel> nightMedicine = medicineList
        .where((medicine) => medicine.timing == 'Before Sleep')
        .toList();
    return ListView(shrinkWrap: true, physics: physics, children: [
      Text("Morning 08:00 am",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ...morningMedicine
          .map((medicine) => MedicineChip(medicineModel: medicine)),
      SizedBox(height: 10.0),
      Text("Afternoon 02:00 pm",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ...afternoonMedicine
          .map((medicine) => MedicineChip(medicineModel: medicine)),
      SizedBox(height: 10.0),
      Text("Night 09:00 pm",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ...nightMedicine.map((medicine) => MedicineChip(medicineModel: medicine)),
    ]);
  }
}

class DateSliderScreen extends StatefulWidget {
  const DateSliderScreen({super.key});

  @override
  _DateSliderScreenState createState() => _DateSliderScreenState();
}

class _DateSliderScreenState extends State<DateSliderScreen> {
  late int selectedIndex;
  late List<DateTime> dates;

  @override
  void initState() {
    super.initState();
    dates = List.generate(2000, (index) {
      return DateTime.now().subtract(Duration(days: 1000 - index));
    });

    selectedIndex = dates.indexWhere((date) =>
        date.year == DateTime.now().year &&
        date.month == DateTime.now().month &&
        date.day == DateTime.now().day);
  }

  void updateDate(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          // Previous Button
          Row(
              children: List.generate(2, (index) {
            int priviousIndex = selectedIndex - index;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Opacity(
                  opacity: 0.5,
                  child: Text(DateFormat('E').format(dates[priviousIndex]),
                      style: TextStyle(fontSize: 16, color: Colors.black))),
            );
          })),
          IconButton(
              icon:
                  const Icon(Icons.chevron_left, size: 35, color: Colors.blue),
              onPressed: selectedIndex > 0
                  ? () => updateDate(selectedIndex - 1)
                  : null),

          // two button
          // selected today date
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(DateFormat('E, MMM d').format(dates[selectedIndex]),
                  style: TextStyle(fontSize: 18, color: Colors.white70))),
          // fade dates outside buttons

          // Next Button
          IconButton(
            icon: const Icon(Icons.chevron_right, size: 30, color: Colors.blue),
            onPressed: selectedIndex < dates.length - 1
                ? () => updateDate(selectedIndex + 1)
                : null,
          ),
          Row(
              children: List.generate(2, (index) {
            int priviousIndex = selectedIndex + index;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Opacity(
                  opacity: 0.5,
                  child: Text(DateFormat('E').format(dates[priviousIndex]),
                      style: TextStyle(fontSize: 16, color: Colors.black))),
            );
          })),
        ],
      ),
    );
  }
}
