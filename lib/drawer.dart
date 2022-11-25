import '../main.dart';
import '../page/add_budget.dart';
import '../page/budget_data.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/material.dart';
import '../page/watchlist_page.dart';

Drawer buildDrawer(BuildContext context) {
    String ? route = ModalRoute.of(context)?.settings.name;
    return Drawer(
        child: Column(
            children: [
                SizedBox(
                    height: 30,
                ),
                DrawerHeader(
                    child: Container(
                        height:MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                    Colors.lime,
                                    Colors.grey,
                                ],
                            ),
                        ),
                    ),
                ),
                SizedBox(
                    height: 20,
                ),
                ListTile(
                    title: const Text(
                        'Counter',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,

                        ),
                        textAlign: TextAlign.center,
                        ),
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );
                    },
                ),
                ListTile(
                    title: const Text(
                        'Add Budget',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            
                        ),
                        textAlign: TextAlign.center,
                    ),
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const AddBudget()),
                        );
                    },
                ),
                ListTile(
                    title: const Text(
                        'Data Budget',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            
                        ),
                        textAlign: TextAlign.center,
                    ),
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const BudgetData()),
                        );
                    },
                ),
                ListTile(
                    title: const Text(
                        'My Watchlist',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            
                        ),
                        textAlign: TextAlign.center,
                    ),
                    onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const WatchListPage()),
                        );
                    },
                ),
                SizedBox(
                height: 45,
                ),
                Material(
                    borderRadius: BorderRadius.circular(500),
                    child: InkWell(
                    borderRadius: BorderRadius.circular(500),
                    splashColor: Colors.black45,
                    onTap: () {
                        Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                        child: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    ),
                ),
            ],
        ),
    );
}