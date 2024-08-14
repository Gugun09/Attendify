import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text('Dashboard'),
        centerTitle: true,
        titleTextStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Andrew Garfield"),
              accountEmail: const Text("capek@ngoding.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              otherAccountsPictures: const [
                // CircleAvatar(
                //   backgroundColor: Colors.white,
                //   backgroundImage: NetworkImage(
                //       "https://randomuser.me/api/portraits/women/74.jpg"),
                // ),
                // CircleAvatar(
                //   backgroundColor: Colors.white,
                //   backgroundImage: NetworkImage(
                //       "https://randomuser.me/api/portraits/men/47.jpg"),
                // ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.code),
              title: const Text("About"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.rule),
              title: const Text("TOS"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text("Privacy Policy"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text("Logout"),
              onTap: () => controller.logout(),
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xff7a52f4),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 50,
                    height: 50,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return Text(
                              controller.formattedTime.value,
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 30,
                    height: 30,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now().toLocal())}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 230,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
