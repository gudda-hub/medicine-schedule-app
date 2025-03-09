import '../../export.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 30))),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            spacing: 14,
            children: [
              SizedBox(
                  height: 90,
                  width: 90,
                  child: ClipOval(
                      child:
                          Image.asset("assets/person.jpg", fit: BoxFit.cover))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Take Care!",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600)),
                  Text("Flutter Dev.",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
