import 'main.dart';
import 'budget_data.dart';
import 'drawer.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter/material.dart';

class AddBudget extends StatefulWidget {
  const AddBudget({super.key});
  static List<Item> budgetList = [];

  static void add({
    required item,
    required amount,
    required type,
    required date,
  }) {
    budgetList.add(
        Item(item: item, amount: amount, type: type, date: date));
  }

  @override
  State<AddBudget> createState() => _AddBudgetState();
}

class Item {
  String item;
  String amount;
  String type;
  DateTime date;

  Item({
    required this.item,
    required this.amount,
    required this.type,
    required this.date,
  });
}

class _AddBudgetState extends State<AddBudget> {
  final _formKey = GlobalKey<FormState>();
  String _itemTitle = "";
  String _itemAmount = "";
  String _itemType = "";
  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Budget'),
      ),
      drawer: buildDrawer(context),
      body: Form(
        key: _formKey,
        child: Container(
            decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                    Colors.grey,
                                    Colors.lime,
                                ],
                            ),
                        ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // item Budget
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Example: Buy Groceries",
                    labelText: "Title",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.text_fields),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _itemTitle = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _itemTitle = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Title can't be empty!";
                    }
                    return null;
                  },
                ),
              ),
              // amount Budget
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Currency: Indonesian Rupiah",
                    labelText: "Amount",
                    // Menambahkan icon agar lebih intuitif
                    icon: const Icon(Icons.attach_money),
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _itemAmount = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _itemAmount = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount can't be empty!";
                    }
                    return null;
                  },
                ),
              ),
              // type Budget
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  value: null,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  underline: Container(
                    // ignore: prefer_const_constructors
                    decoration: ShapeDecoration(
                      // ignore: prefer_const_constructors
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
                  hint: Text(_itemType == '' ? 'Type' : _itemType),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'Expense',
                      child: Text('Expense'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Income',
                      child: Text('Income'),
                    ),
                  ],
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _itemType = value!;
                    });
                  },
                ),
              ),
              // Date Picker
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 5.0),
                    TextButton(
                      onPressed: (() {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2030),
                        );
                      }),
                      child: Text(_date.toString().split(' ')[0]),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container()),
              // Button Simpan
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),

                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AddBudget.add(
                              item: _itemTitle,
                              amount: _itemAmount,
                              type: _itemType,
                              date: _date);
                        }
                        _formKey.currentState!.reset();
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}