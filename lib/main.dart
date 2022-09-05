import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

List<Device> devices = [
  Device('Light Bulbs', 'Philips hue 2', Icons.light, true),
  Device('Smart TV', 'LG UHD-65', Icons.connected_tv, false),
  Device('Refrigaretor', 'Mitsubishi', Icons.severe_cold, false),
  Device('Wi-Fi Router', 'Tp Link', Icons.router, true),
  Device('Smart TV', 'LG UHD-65', Icons.connected_tv, false),
  Device('Refrigaretor', 'Mitsubishi', Icons.severe_cold, false),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFe6e8eb),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                            height: 70,
                          ),
                          const Icon(Icons.cloudy_snowing,
                              color: Colors.yellow),
                          const SizedBox(
                            width: 15,
                            height: 70,
                          ),
                          Column(
                            children: const [
                              Text('12 July'),
                              Text(
                                'Cloudy',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          decoration:  BoxDecoration(color: Colors.blue,
                              boxShadow: [BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: const Offset(0, 3)
                              ),],
                              borderRadius: const BorderRadius.all(Radius.circular(15))
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  )
                ],
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 16.0, 0, 20.0),
                  child: Text(
                    'General Information',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.water_drop),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Rainy',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        '25 °C',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Indoor Temp.',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Text(
                        '20 °C',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Outdoor Temp.',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ]),
          ),
          Expanded(
              child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(devices.length, (index) {
                return createElement(devices[index].icon, devices[index].isActive,
                    devices[index].name, devices[index].model,index);
              })
          )
        )
        ]));
  }

  Container createElement(IconData icon, bool isActive, String device, String model,int index) {
      return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.fromLTRB(16, 16, 10, 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: InkResponse(
          onTap: (){
            setState(() {});
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(icon),
                  const SizedBox(width: 40,),
                  Switch(value: isActive, onChanged: (bool value) {
                    setState(() {
                      devices[index].isActive = value;
                    });
                  },
                  ),
                ],
              ),
              const SizedBox(height: 25,),
              Text(device,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
              const SizedBox(height: 10,),
              Text(model),
            ],
          ),
        ),
      );
  }
}


class Device {
  Device(this.name, this.model, this.icon, this.isActive);

  late String name;
  late String model;
  late IconData icon;
  late bool isActive;
}
