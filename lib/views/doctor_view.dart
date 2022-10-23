import 'package:flutter/material.dart';
import 'package:xencov/services/auth_service.dart';

class DoctorView extends StatelessWidget {
  DoctorView({Key? key}) : super(key: key);

  final List<IconData> icons = [
    Icons.mail,
    Icons.call,
    Icons.videocam
  ];
  final List<Color> colors = const [
    Color.fromARGB(149, 242, 206, 151),
    Color.fromARGB(150, 240, 160, 154),
    Color.fromARGB(126, 224, 218, 218)
  ];
  final List<Color> iconColors = const [
    Color.fromARGB(206, 243, 183, 93),
    Color.fromARGB(198, 244, 88, 77),
    Color.fromARGB(210, 188, 186, 186)
  ];

  Widget btnText(String label){
    return Text(
      label,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          padding: const EdgeInsets.fromLTRB(18, 30, 18, 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: size.height / 4,
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            padding: const EdgeInsets.fromLTRB(12, 30, 12, 0),
                            width: size.width / 3,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              color:Color.fromARGB(197, 239, 155, 103)
                            ),
                            child: Image.asset(
                              fit: BoxFit.cover,
                              "assets/images/doctor.png"
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Dr. Stefeni \nAlbert",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              const Text("Heart Specialist",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: size.height / 18,
                                width: size.width / 2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      padding: const EdgeInsets.all(12),
                                      margin: const EdgeInsets.only(right: 12),
                                      decoration: BoxDecoration(
                                        color: colors[index],
                                        borderRadius: const BorderRadius.all(Radius.circular(15))
                                      ),
                                      child: Icon(icons[index], color: iconColors[index]),  
                                    );
                                  })
                                ),
                              ),
                            ],
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("About",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Wrap(
                      children: const [
                        Text("Dr. Stefeni Albert is a cardiologist in Nashville & affiliated with multiple hospitals in the area. She received her medical degree from Duke University school of medicine and has been in practice for  more than 20 years.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.grey),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Address",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: 6),
                            Text("House # 2, Road # 5, \nGreen Road \nDhanmondi, Dhaka, \nBangladesh",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time_rounded, color: Colors.grey),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Daily Practice",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            SizedBox(height: 6),
                            Text("Monday - Friday, \nOpen till 7 Pm",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Text("Activity",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          height: size.height / 10,
                          width: size.width / 2.28,
                          decoration: const BoxDecoration(
                            color:Color.fromARGB(231, 245, 167, 115),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor:Color.fromARGB(150, 241, 237, 237),
                                  child: Icon(Icons.receipt_long_rounded, color: Colors.white)
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Wrap(
                                    children: [
                                      btnText("List Of Schedule")
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          height: size.height / 10,
                          width: size.width / 2.28,
                          decoration: const BoxDecoration(
                            color:Color.fromARGB(237, 197, 195, 195),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: InkWell(
                            onTap: (){
                              Auth().signOut();
                            },
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor:Color.fromARGB(150, 241, 237, 237),
                                  child: Icon(Icons.receipt_long_rounded, color: Colors.white)
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Wrap(
                                    children: [
                                      btnText("Doctor's Daily Post")
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}