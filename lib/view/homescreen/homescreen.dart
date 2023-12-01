import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minto_softronics/utils/seatno_list.dart';
import 'package:minto_softronics/view/menu_screen/menu_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int? selctedseatindex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Minto",
            style: GoogleFonts.poppins(fontSize: 24),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "SELECT YOUR SEAT",
                style: GoogleFonts.bebasNeue(fontSize: 24, color: Colors.white),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                  child: GridView.builder(
                    itemCount: seatno.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selctedseatindex = index;
                          });
                        },
                        child: Card(
                          color: selctedseatindex == index
                              ? Colors.red
                              : Colors.green,
                          child: Center(
                            child: Text(
                              seatno[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MenuScreen(),
                      ));
                    },
                    style: ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(Colors.black),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.grey.shade300)),
                    child: Text(
                      "Confirm",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
