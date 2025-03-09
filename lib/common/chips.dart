import 'package:health/export.dart';

class MedicineChip extends StatelessWidget {
  final MedicineModel medicineModel;
  const MedicineChip({super.key, required this.medicineModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColor.secondary, borderRadius: BorderRadius.circular(10.0)),
      child: ListTile(
        leading: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              color: typeColors[medicineModel.type],
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            typeIcons[medicineModel.type],
            color: Colors.white,
          ),
        ),
        title: Text(
          medicineModel.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: [
            Text(medicineModel.timing,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(medicineModel.daysTaken,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
        trailing: Column(
          spacing: 5,
          children: [
            Icon(Icons.notifications_none,
                size: 35, color: statusColors[medicineModel.status]),
            Text(medicineModel.status),
          ],
        ),
      ),
    );
  }
}
