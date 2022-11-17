import 'main.dart';
import 'add_budget.dart';
import 'drawer.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/material.dart';

class BudgetData extends StatelessWidget {
    const BudgetData({super.key});

    @override
    Widget build(BuildContext context) {
        const title = 'Budget Data';
        
        return MaterialApp(
            title: title,
            theme: ThemeData(
            primarySwatch: Colors.lime,
            scaffoldBackgroundColor: Colors.grey.shade100,
            ),
            home: Scaffold(
                appBar: AppBar(
                    title: const Text(title),
                ),
                drawer: buildDrawer(context),
                body: SingleChildScrollView(
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: AddBudget.budgetList.map((Item o) {
                                return Card(
                                    child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Row(
                                                    children: [
                                                        Text(
                                                            o.date.toString().substring(0,16),
                                                            style: const TextStyle(fontSize: 14.0),
                                                        ),
                                                    ],
                                                ),
                                                Divider(
                                                    color: Color.fromARGB(255, 106, 106, 106)
                                                ),
                                                const SizedBox(height: 6.0),
                                                Row(
                                                    children: [
                                                        Text(
                                                            o.item,
                                                            style: const TextStyle(fontSize: 24.0),
                                                        ),
                                                    ],
                                                ),
                                                const SizedBox(height: 8.0),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                        Text(
                                                            'Rp ' + o.amount.toString(),
                                                            style: const TextStyle(fontSize: 16.0),
                                                        ),
                                                        if (o.type.toString() == 'Expense')...[
                                                            Text(
                                                                o.type.toString(),
                                                                style: const TextStyle(fontSize: 16.0, color: Colors.redAccent),
                                                            ),
                                                        ] else ... [
                                                            Text(
                                                                o.type.toString(),
                                                                style: const TextStyle(fontSize: 16.0, color: Colors.blueAccent),
                                                            )
                                                        ]
                                                    ],
                                                )
                                            ],
                                        ),
                                    ),
                                );
                            }).toList(),
                    ),
                ),
            ),)
        );
    }
}