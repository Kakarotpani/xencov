import 'package:flutter/material.dart';
import 'package:xencov/views/doctor_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  bool isSelected = false;
  final List<String> categories = ["Adults", "Childrens", "Womens", "Mens"];
  final List<String> specialities = ["Cough & Cold", "Heart Specialist", "Diabetes & Cancer"];
  final List<String> noOfDoctors = ["10", "17", "27"];
  final List<String> relatedImages = [
    "assets/images/cough.png",
    "assets/images/heart.png",
    "assets/images/diabetese.png",
  ];
  final List<Color> cardColors = const [
    Color.fromARGB(189, 239, 158, 107),
    Color.fromARGB(211, 255, 152, 152),
    Color.fromARGB(141, 228, 145, 243)
  ];
  List<bool> indexChecked = [true, false, false, false];  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30),
                height: size.height / 8,
                alignment: Alignment.centerLeft,
                child: const Text("Find Your \nConsultation",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height / 16 ,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(138, 224, 216, 216),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: InkWell(
                  onTap: (){},
                  child: ListTile(
                    minLeadingWidth: 4.0,
                    leading: const Icon(Icons.search, color: Colors.black),
                    title: Form(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none
                        ),
                      ),
                    )
                  ),
                )
              ),
              const Text("Categories",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 32,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: (){
                        for (int i=0;i<indexChecked.length;i++){
                          indexChecked[i] = false;
                        }
                        setState(() {
                          indexChecked[index] = true;
                        });
                      },
                      child: Container(
                        width: 82,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: indexChecked[index]
                          ?const Color.fromARGB(187, 245, 168, 121)
                          :Colors.transparent,
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Center(
                          child: Text(categories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: indexChecked[index]
                              ?Colors.orange
                              :Colors.grey
                            ),
                          )
                        ),
                      ),
                    );
                  }),
                )
              ),
              SizedBox(
                height: size.height / 3.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(14, 14, 16, 4),
                      width: 148,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: cardColors[index],
                        borderRadius: const BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children :[
                              Text(specialities[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ]
                          ),
                          const SizedBox(height: 6),
                          Text("${noOfDoctors[index]} Doctors",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 140,
                            width: double.infinity,
                            child: Image.asset(
                              relatedImages[index],
                              fit: BoxFit.cover,
                            )
                          )
                        ],
                      )
                    );
                  }),
                )
              ),
              const Text("Doctors",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                width: double.infinity,
                height: size.height / 11 ,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(127, 244, 186, 186),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DoctorView()
                    ));
                  } ,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(205, 239, 151, 107),
                                borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              child: Image.asset('assets/images/doctor.png')
                            ),
                            const SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Dr. Stefeni Albert",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                                Text("Heart Specialist",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: (){},
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height / 26,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(205, 239, 155, 107),
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Text("call",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}
