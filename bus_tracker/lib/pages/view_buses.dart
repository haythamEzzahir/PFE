import 'package:flutter/material.dart';

class ViewBuses extends StatelessWidget {
  const ViewBuses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 40, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'mohamed ourhouch',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View Profile',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Nearby bus stops'),
                    onTap: () {},
                  ),
                  _customDivider(),
                  ListTile(
                    leading: const Icon(Icons.map_outlined),
                    title: const Text('View lines'),
                    onTap: () {},
                  ),
                  _customDivider(),
                  ListTile(
                    leading: const Icon(Icons.add_road),
                    title: const Text('Create route'),
                    onTap: () {},
                  ),
                  _customDivider(),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Change Language'),
                    onTap: () {},
                  ),
                  _customDivider(),
                  ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share app'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/bus.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center, // This centers the button
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(255, 223, 0, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: Image.asset(
                          'assets/images/menu.png',
                          width: 30,
                          height: 30,
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                    const Text(
                      'Nearby Bus Stops',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tap to add destination',
                    prefixIcon: const Icon(Icons.location_on,
                        color: Color.fromRGBO(255, 223, 0, 1)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 223, 0, 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/images/distance.png',
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/plus.png',
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/images/partager.png',
                        width: 30,
                        height: 30,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _customDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 250, // Adjust the width as needed
          height: 1,
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
