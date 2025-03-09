import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:health/export.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  int _selectedCompartment = 1;
  Color _selectedColor = typeColors.values.toList().first;
  List<int> compartments = List.generate(10, (index) => index + 1);
  bool _quantity = true; //true - 1/2 pill
  double _totalCount = 1;
  String _selectedTime = timingList.first;

  String _selectedFrequency = "Everyday";
  String _selectedTimesPerDay = "Three Time";

  void _updateTiming(String value) {
    setState(() {
      _selectedTime = value;
    });
  }

  void _updateTotalCount(double value) {
    setState(() {
      _totalCount = value;
    });
  }

  void _updateQuantity(bool value) {
    setState(() {
      _quantity = value;
    });
  }

  void _updateCompartment(int value) {
    setState(() {
      _selectedCompartment = value;
    });
  }

  void _updateColor(Color value) {
    setState(() {
      _selectedColor = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add Medicines",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            TextField(
                decoration: InputDecoration(
                    hintText: "Search Medicine Name",
                    prefixIcon: Icon(Icons.search_rounded),
                    suffixIcon: Icon(Icons.mic),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)))),
            SizedBox(height: 18),
            Text("Compartment",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            compartmentSection(),
            SizedBox(height: 18),
            Text("Color",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            colorSection(),
            SizedBox(height: 18),
            Text("Type",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            typeSection(),
            SizedBox(height: 18),
            Text("Quantity",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            SizedBox(height: 10),
            quantitySection(),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Count",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87)),
                Container(
                    height: 35,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black38),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(_totalCount.round().toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87))),
              ],
            ),
            Slider(
                value: _totalCount,
                max: 100,
                min: 1,
                divisions: 100,
                onChanged: (value) => _updateTotalCount(value)),
            SizedBox(height: 18),
            Text("Set Date",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            SizedBox(height: 10),
            Row(
              spacing: 10,
              children: [
                _buildSetDate("Today", () {}),
                _buildSetDate("End Date", () {})
              ],
            ),
            SizedBox(height: 18),
            Text("Frequency of Days",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            SizedBox(height: 10),
            _buildDropDown(
                ["Everyday", "Alternate Days", "Custom"], _selectedFrequency,
                (value) {
              setState(() {
                _selectedFrequency = value!;
              });
            }),
            SizedBox(height: 18),
            Text("How many times a Day",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87)),
            SizedBox(height: 10),
            _buildDropDown(
                ["One Time", "Two Time", "Three Time"], _selectedTimesPerDay,
                (value) {
              setState(() {
                _selectedTimesPerDay = value!;
              });
            }),
            SizedBox(height: 18),
            _buildDoseTile("Dose 1"),
            _buildDoseTile("Dose 2"),
            _buildDoseTile("Dose 3"),
            SizedBox(height: 18),
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: timingList
                    .map((timing) => GestureDetector(
                          onTap: () {
                            _updateTiming(timing);
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: timing == _selectedTime
                                    ? AppColor.primary
                                    : AppColor.secondary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(timing,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 30),
            CupertinoButton(
                color: AppColor.primary,
                onPressed: () {},
                borderRadius: BorderRadius.circular(20),
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildDoseTile(String doseName) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.access_time, color: Colors.grey),
          title: Text(doseName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          trailing:
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black45),
          onTap: () {},
        ),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }

  Widget _buildDropDown(List<String> items, String selectedValue,
      ValueChanged<String?> onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField(
          value: selectedValue,
          items: items
              .map((String item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(border: InputBorder.none)),
    );
  }

  Expanded _buildSetDate(String text, Function()? onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black38),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87)),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.black45, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Row quantitySection() {
    return Row(
      spacing: 7,
      children: [
        Expanded(
            child: Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black38),
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Take ${_quantity ? '1/2' : 1} Pill",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87)))),
        GestureDetector(
          onTap: () {
            _updateQuantity(true);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                // color: AppColor.secondary,
                // : Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: AppColor.primary
                    // : Colors.grey.shade400
                    )),
            child: Icon(
              Icons.remove,
              size: 30,
              color: AppColor.primary,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _updateQuantity(false);
          },
          child: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: AppColor.primary
                    // : Colors.grey.shade400
                    )),
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox typeSection() {
    return SizedBox(
      height: 110,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: typeIcons.entries
            .map((entry) => Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    spacing: 8,
                    children: [
                      Icon(entry.value, size: 40, color: _selectedColor),
                      Text(entry.key,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54))
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  SizedBox colorSection() {
    return SizedBox(
      height: 75,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: typeColors.values
            .toList()
            .map((color) => GestureDetector(
                  onTap: () {
                    _updateColor(color);
                  },
                  child: Container(
                    width: 60,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 2,
                            color: _selectedColor == color
                                ? AppColor.primary
                                : Colors.white)),
                  ),
                ))
            .toList(),
      ),
    );
  }

  SizedBox compartmentSection() {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: compartments
            .map((compartment) => GestureDetector(
                  onTap: () {
                    _updateCompartment(compartment);
                  },
                  child: Container(
                    width: 60,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: _selectedCompartment == compartment
                            ? AppColor.secondary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2,
                            color: _selectedCompartment == compartment
                                ? AppColor.primary
                                : Colors.grey.shade400)),
                    child: Text(compartment.toString(),
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Colors.black54)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
