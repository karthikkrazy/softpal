import 'package:flutter/material.dart';
import 'package:sampleproject/screens/capture_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: FutureBuilder(
        future: getDataLocally(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data;
            return Column(children: [
              Text("______________Summary______________\n",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,),),
              Row(
                children: [
                    Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        color: Colors.greenAccent.withOpacity(0.5),
                        child: ListTile(
                          title: Text('Total Distance'),
                          subtitle: Text(
                            '200 kms',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                 Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        color: Colors.pinkAccent.withOpacity(0.1),
                        child: ListTile(
                          title: Text('Time'),
                          subtitle: Text(
                            '15h : 10m ',
                            style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,)
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: Card(
                  color: Color.fromARGB(255, 223, 223, 223),
                  child: ListTile(
                    trailing: Text(
                      "150 KM",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    title: Text(
                      'Mahindra Thar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '08 Aug 2023',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Card(
                  color: Color.fromARGB(255, 223, 223, 223),
                  child: ListTile(
                    trailing: Text(
                      "150 KM",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    title: Text(
                      'Mahindra Thar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '08 Aug 2023',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),SizedBox(height: 250,), Center(
                child: Row(
                  children: [
                    Icon(Icons.recycling),Text(
                            '  Trip Started',
                            style:
                                TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),Column(
                children: [
                    
                  Row(
                    children: [
                        Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 100,
                          child: Card(
                              elevation: 10,
                            child: ListTile(
                              title: Text('Mahindra Thar '),
                              subtitle: Text(
                                'TS20393',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                     Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 100,
                          child: Card(
                            elevation: 10,
            
                            child: ListTile(
                              leading:Icon(Icons.watch_later_outlined),
                              title: Text('Time'),
                              subtitle: Text(
                                '15 MINUTES ',
                                style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),SizedBox(
                height: 60,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: ListTile(
                    trailing: Text(
                      "Hyderabad",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    title: Text(
                      'Started Location ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                   
                  ),
                ),
              ),
            ]);
          }
        },
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                child: Image(image: AssetImage("assets/images/logo.jpeg")),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              
              },
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
              Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CaptureDetailsScreen(),
      ),
    );
           },
          child: Text('Start Trip'),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Future<String?> getDataLocally() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userData');
  }
}
