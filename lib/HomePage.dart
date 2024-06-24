import 'package:flutter/material.dart';
import 'package:habittracker/components/heatmap.dart';
import 'package:habittracker/drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'components/alert.dart';
import 'components/tile.dart';
import 'database/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _box = Hive.box("Habits");

  @override
  void initState() {
    if (_box.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }
    else {
      db.loadData();
    }
    db.updateDatabase();
    super.initState();
  }

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: 'Enter habit name',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }
  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
   _newHabitNameController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }
  void cancelDialogBox() {
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
        appBar: AppBar(
          title: const Text(
            'Habit Tracker',
            style: TextStyle(
              wordSpacing: 2,
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[700],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      drawer: TheDrawer(),
      body: ListView(
        children: [
          TheHeatMap(
            datasets: db.heatMapDataSet,
            startDate: _box.get("START_DATE"),
          ),
          Divider(thickness: 5,),

          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: db.todaysHabitList.length,
            itemBuilder: (context, index) {
              return Tile(
                habitName: db.todaysHabitList[index][0],
                habitCompleted: db.todaysHabitList[index][1],
                onChanged: (value) => checkBoxTapped(value, index),
                settingsTapped: (context) => openHabitSettings(index),
                deleteTapped: (context) => deleteHabit(index),
              );
            },
          )
        ],
      ),
      floatingActionButton:FloatingActionButton(onPressed: createNewHabit,child: Icon(Icons.add),)
    );
  }
}