import 'package:health/export.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: _currentPageIndex == 0 ? HomeBodyScreen() : ReportScreen()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddMedicineScreen()));
              },
              shape: CircleBorder(),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Icon(Icons.add, size: 30))),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (value) {
            setState(() {
              _currentPageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_rounded), label: "Report")
          ]),
    );
  }
}

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisSize: MainAxisSize.max, spacing: 20, children: [
          appBar(context),
          DateSliderScreen(),
          medicineList.isEmpty
              ? noMedicineUi()
              : Expanded(
                  child: LandingBodySection(
                      physics: AlwaysScrollableScrollPhysics()))
        ]));
  }

  Widget noMedicineUi() {
    return Expanded(
        child: Align(
            alignment: Alignment.center,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: Image.asset("assets/noitem.png")),
                  Text("Nothing Is Here, Add a Medicine")
                ])));
  }

  Row appBar(BuildContext context) {
    return Row(spacing: 14, children: [
      Column(children: [
        Text("Hi Harry!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Text("5 Medicines Left")
      ]),
      Spacer(),
      IconButton(
          icon: Icon(Icons.network_check_sharp),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                children: [
                                  const Text("Your Device is not connected",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                      height: 180,
                                      child: Icon(Icons.broken_image,
                                          size: 120, color: Colors.grey)),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Connect your device with",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              spacing: 2,
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle Bluetooth action
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColor.primary,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(25)),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.bluetooth,
                                      color: Colors.white60,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {
                                      // Handle Bluetooth action
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: AppColor.primary,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(25)),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.wifi,
                                      color: Colors.white60,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ));
          },
          color: AppColor.primary),
      Icon(Icons.medical_services_rounded, color: AppColor.primary),
      InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen())),
          child: SizedBox(
              height: 40,
              width: 40,
              child: ClipOval(
                  child: Image.asset("assets/person.jpg", fit: BoxFit.cover))))
    ]);
  }
}
