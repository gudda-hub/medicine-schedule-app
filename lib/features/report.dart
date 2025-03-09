import 'package:health/export.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        children: [
          Text("Report",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black)),
          SizedBox(height: 10.0),
          todayReportSection(),
          SizedBox(height: 10.0),
          checkDashboardSection(),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("  Check History",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87)),
              TextButton(
                  onPressed: () {},
                  child: Icon(Icons.arrow_forward_ios_rounded,
                      size: 30, color: AppColor.primary))
            ],
          ),
          historySection(),
          SizedBox(height: 15.0),
          LandingBodySection(physics: NeverScrollableScrollPhysics())
        ],
      ),
    );
  }

  SizedBox historySection() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: weekdays
            .asMap()
            .entries
            .map<Widget>((entry) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Column(
                    spacing: 3,
                    children: [
                      Text(entry.value,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45)),
                      Container(
                        height: 55,
                        width: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: entry.key == 0
                                ? AppColor.primary
                                : AppColor.secondary),
                        child: Text((entry.key + 1).toString()),
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Card checkDashboardSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Check Dashboard",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87)),
                  Text(
                      "Here you will find everything related to your active and past medicines.",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45))
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColor.secondary,
                    shape: BoxShape.circle,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Card todayReportSection() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Text("Today's Report",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("5",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary)),
                    Text("Total",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45)),
                  ],
                ),
                Column(
                  children: [
                    Text("3",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary)),
                    Text("Taken",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45)),
                  ],
                ),
                Column(
                  children: [
                    Text("1",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary)),
                    Text("Missed",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45)),
                  ],
                ),
                Column(
                  children: [
                    Text("1",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary)),
                    Text("Snoozed",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black45)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
