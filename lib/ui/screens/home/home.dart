import 'package:flutter/material.dart';
import 'package:todo_app2/ui/screens/add_bottom_sheet/add_bottom_sheet.dart';
import 'package:todo_app2/ui/screens/home/tabs/list/list_tab.dart';
import 'package:todo_app2/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:todo_app2/ui/utils/app_color.dart';

class Home extends StatefulWidget {
  static const String routeName='home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex=0;
  List<Widget>tabs=[const ListTab(),const SettingsTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
       body: tabs[currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }

 Widget buildBottomNavigationBar()=>BottomAppBar(
   shape: const CircularNotchedRectangle(),
   notchMargin: 8,
   clipBehavior: Clip.hardEdge,
   child: BottomNavigationBar(
     showSelectedLabels: false,
       showUnselectedLabels: false,
       currentIndex: currentIndex,
       onTap: (tappedIndex){
       currentIndex=tappedIndex;
       setState(() {

       });
       },
       items:const [
         BottomNavigationBarItem(icon: Icon(Icons.list),label: "list"),
         BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings")
       ]),
 );

  Widget buildFab()=>FloatingActionButton(
    backgroundColor: AppColors.primary,
    shape: const StadiumBorder(side: BorderSide(color: AppColors.white,width: 4)),
    onPressed: (){
      AddBottomSheet.show(context);
    },
    child: const Icon(Icons.add),
  );
}
