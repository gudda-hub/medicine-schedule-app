import 'package:flutter/cupertino.dart';
import 'package:health/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            ProfileHeaderSection(),
            Divider(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  // *-------------- Settings-----------
                  Text("Settings",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: drawerItemList.length,
                      itemBuilder: (context, index) {
                        DrawerItemModel drawerItem = drawerItemList[index];
                        return _settingsCard(drawerItem);
                      }),
                  // * --------------------- Device --------------------
                  Text("Device",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  deviceSection(),
                  //* ---------------------- Caretakers -----------------------
                  Text("Caretakers: 03",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  caretakersSection(),
                  //* ---------------------- Doctor ---------------------------
                  Text("Doctor",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                  doctorSection(),
                  // * ----------------------Extra ---------------------
                  extraServiceSection(),
                  SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()),
                                (route) => false);
                          },
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: AppColor.primary, width: 1))),
                          child: Text("Log Out",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)))),
                  SizedBox(height: 10)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding extraServiceSection() {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 35,
            children: [
              Text("Privacy Policy",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87)),
              Text("Terms of Use",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87)),
              Text("Rate Us",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87)),
              Text("Share",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87))
            ]));
  }

  Card doctorSection() {
    return Card(
        color: AppColor.secondary,
        child: SizedBox(
            width: double.infinity,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 2,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColor.primary,
                              child: Icon(Icons.add,
                                  size: 50, color: Colors.white))),
                      Text("Add Your Doctor",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            Text("Or Use",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87)),
                            Text("invite link",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.orange))
                          ])
                    ]))));
  }

  Card caretakersSection() {
    return Card(
        color: AppColor.secondary,
        child: SizedBox(
            height: 160,
            child: ListView(
                padding: EdgeInsets.all(6),
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  ...caretakersList.map((caretaker) => Padding(
                      padding:
                          const EdgeInsets.only(left: 10.0, top: 44, right: 10),
                      child: Column(spacing: 10, children: [
                        SizedBox(
                            height: 60,
                            width: 60,
                            child: ClipOval(
                                child: Image.asset(caretaker.img,
                                    fit: BoxFit.cover))),
                        Text(caretaker.name,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black87))
                      ]))),
                  Padding(
                      padding: const EdgeInsets.only(top: 44, right: 10),
                      child: Column(spacing: 10, children: [
                        SizedBox(
                            height: 60,
                            width: 60,
                            child: InkWell(
                                onTap: () {},
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.add)))),
                        Text("Add",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black87))
                      ]))
                ])));
  }

  Card deviceSection() {
    return Card(
        color: AppColor.secondary,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              CupertinoButton(
                  child: ListTile(
                      leading: Icon(Icons.volume_down_outlined,
                          size: 33, color: Colors.black45),
                      title: Text("Connect",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87)),
                      subtitle: Text("Bluetooth, Wi-Fi",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54))),
                  onPressed: () {}),
              CupertinoButton(
                  color: Colors.white,
                  child: ListTile(
                      minTileHeight: 0,
                      leading: Icon(Icons.volume_down_outlined,
                          size: 33, color: Colors.black45),
                      title: Text("Connect",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87)),
                      subtitle: Text("Bluetooth, Wi-Fi",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black54))),
                  onPressed: () {})
            ])));
  }

  ListTile _settingsCard(DrawerItemModel drawerItem) {
    return ListTile(
        leading: Icon(drawerItem.icon, size: 33, color: Colors.black45),
        title: Text(drawerItem.title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87)),
        subtitle: Text(drawerItem.caption,
            style:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black54)));
  }
}
