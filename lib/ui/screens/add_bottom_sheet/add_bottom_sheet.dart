
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/ui/utils/app_style.dart';
import 'package:todo_app2/ui/utils/date_time_extension.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();

  static void show(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: const AddBottomSheet(),
    ));
  }

}
class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate=DateTime.now();
  TextEditingController titleController=TextEditingController();
  TextEditingController describtionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Container(
      height: MediaQuery.of(context).size.height*.4,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Add New Task",textAlign: TextAlign.center,style: AppStyle.bottomSheetTitle,),
           TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: "enter task title"
            ),
          ),
          const SizedBox(height: 12,),
           TextField(
             controller: describtionController,
            decoration: InputDecoration(
                hintText: "enter task describtion"
            ),
          ),
          const SizedBox(height: 12,),
            Text("Select date",style: AppStyle.bottomSheetTitle.copyWith(fontSize:16),),
          const SizedBox(height: 12,),
            InkWell(
              onTap: (){
                ShowMyDatePicker();
              },
                child: Text(selectedDate.toFormattedDate,textAlign: TextAlign.center,style: AppStyle.normalGreyTextStyle,)),
          const Spacer(),
          ElevatedButton(onPressed: (){
            addTodoToFirebase();
          },
              child: const Text("Add"))
        ],
      ),
    );
  }


  void addTodoToFirebase(){
   CollectionReference todosCollection= FirebaseFirestore.instance.collection("todo");
   DocumentReference doc=todosCollection.doc();
   doc.set({
     "id":doc.id,
     "title": titleController.text,
     "describtion":describtionController.text,
     "date":selectedDate,
     "isDone":false
   });
  }

  void ShowMyDatePicker() async{
   selectedDate=await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365))
    ) ?? selectedDate ;
   setState(() {

   });

  }
}


