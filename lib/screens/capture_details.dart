import 'package:flutter/material.dart';

class CaptureDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle'),
      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 100,
                child: Card(
                  color: Colors.greenAccent.withOpacity(0.5),
                  child: ListTile(
                    title: Text('Mahindra Thar'),
                    subtitle: Text(
                      'TS20178',
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  color: Colors.black.withOpacity(0.5),
                  child: ListTile(
                    title: Center(
                        child: Text(
                      '40 KMS',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
            height: 200,
            child: Card(
              color: Color.fromARGB(255, 223, 223, 223),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the radius as needed
                child: Image.asset(
                  'assets/images/bike.jpeg',
                  width: MediaQuery.of(context).size.width,
                  height: 100, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SizedBox(height: 20,),
        Text("Captured Date Time : 09 Aug 2023"),
       SizedBox(
                height: 60,
                child: Card(
                  elevation: 10,
                  color: Colors.white,
                  child: ListTile(
                    // trailing: Text(
                    //   "",
                    //   style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    // ),
                    title: Center(
                      child: Text(
                        'Enter End Reading',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                   
                  ),
                ),
              ),
      ]),
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
          child: Text('Submit and End'),
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
}
