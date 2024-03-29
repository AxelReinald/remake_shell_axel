import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  static const double _defaultLat = -6.225871622158405;
  static const double _defaultLng = 107.00104421092891;

  static const CameraPosition _defaultlocation =
      CameraPosition(target: LatLng(_defaultLat, _defaultLng), zoom: 15);
  int _currentindex = 0;

  final tabs = [
    //Home
    SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi Axel',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              const Text(
                'Nice to see you again!',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                splashColor: Colors.black,
                child: Ink(
                  height: 70,
                  decoration: BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("images/party.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('0 points',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                          SizedBox(
                            height: 10,
                          ),
                          Text('How do I win big?')
                        ],
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                splashColor: Colors.black,
                child: Ink(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_basket_rounded,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Shop with your points',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '''WHAT'S NEW''',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 130,
                      child: Image(
                          image: AssetImage('images/main.jpg'),
                          fit: BoxFit.cover),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '''Let's Go to Shell, New Price!''',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Valid until 30/11/2022')
                          ],
                        ),
                      ),
                      onTap: () {},
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    //Stations
    Stack(
      children: [const GoogleMap(initialCameraPosition: _defaultlocation)],
    ),
    //My Card
    SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Shell Go+ card',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'View your member benefits',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline,
                                color: Colors.black),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffFFD500),
                      border: Border.all(color: Colors.grey)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        height: 130,
                        width: 100,
                        child: Image(
                            image: AssetImage('images/qr.png'),
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 30,
            color: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Your Rewards'),
                IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
              ],
            ),
          ),
          InkWell(
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Row(
                  children: [
                    const Icon(
                      Icons.card_giftcard,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Redeem Shell Go+ Points\n for Coffee Discount',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue.shade900,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            'Selected',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {}),
          const Divider(
            thickness: 1,
          ),
          InkWell(
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Row(
                  children: [
                    const Icon(Icons.card_giftcard, color: Colors.red),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Free Nitrogen Refill',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue.shade900,
                      child: Row(
                        children: [
                          const Icon(Icons.check, color: Colors.white),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text('Selected',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {}),
          const Divider(
            thickness: 1,
          ),
          InkWell(
              child: Ink(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Row(
                  children: [
                    const Icon(Icons.card_giftcard, color: Colors.red),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      'Monday is Coffee Day',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.blue.shade900,
                      child: Row(
                        children: [
                          const Icon(Icons.check, color: Colors.white),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text('Selected',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {}),
          const Divider()
        ],
      ),
    )),
    //Rewards
    SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Offers',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'SHELL GO+ OFFERS',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Ink(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(children: [
                const SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: Image(
                      image: AssetImage('images/coffee.jpg'),
                      fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '''10% off Costa Express Drink''',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Ink(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(children: [
                const SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: Image(
                      image: AssetImage('images/fuel.jpg'), fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '''10% off Shell fuel''',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ]),
            ),
          )
        ],
      ),
    )),
    //Profile
    SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              child: Ink(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Axel',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red)),
                      SizedBox(
                        height: 10,
                      ),
                      Text('View and edit profile')
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
                child: Ink(
                  height: 50,
                  child: Row(
                    children: const [
                      Icon(Icons.note_alt),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Transactions')
                    ],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 50,
                  child: Row(
                    children: const [
                      Icon(Icons.wallet_giftcard),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Redemptions')
                    ],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 50,
                  child: Row(
                    children: const [
                      Icon(Icons.money),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Other Activities')
                    ],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 50,
                  child: Row(
                    children: const [
                      Icon(Icons.traffic),
                      SizedBox(
                        width: 15,
                      ),
                      Text('App tour')
                    ],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 50,
                  child: Row(
                    children: const [
                      Icon(Icons.help),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Help')
                    ],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 50,
                  child: Row(
                    children: const [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Settings')
                    ],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 30,
                  child: Row(
                    children: const [Text('Legal')],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 30,
                  child: Row(
                    children: const [Text('Software Version')],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
            InkWell(
                child: Ink(
                  height: 30,
                  child: Row(
                    children: const [Text('Sign out')],
                  ),
                ),
                onTap: () {}),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        iconSize: 18,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(
              Icons.map,
              color: Colors.grey,
            ),
            label: 'Stations',
          ),
          BottomNavigationBarItem(
            icon: Image(
              height: 20,
              width: 20,
              image: AssetImage('images/shell.png'),
            ),
            label: 'My Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            activeIcon: Icon(
              Icons.wallet_giftcard,
              color: Colors.green,
            ),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(
              Icons.person,
              color: Color(0xff77b5fe),
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}
