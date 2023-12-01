import 'package:flutter/material.dart';
import 'package:minto_softronics/utils/menulist.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<bool> selectedValues = List.generate(menuItems.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Menu"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      title: Text(
                        menuItems[index],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Checkbox(
                        value: selectedValues[index],
                        onChanged: (value) {
                          setState(() {
                            selectedValues[index] = value!;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: ElevatedButton(
              onPressed: () {
                for (int i = 0; i < selectedValues.length; i++) {
                  if (selectedValues[i]) {
                    print(menuItems[i]);
                  }
                }
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade300),
              ),
              child: Text(
                "Confirm",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
