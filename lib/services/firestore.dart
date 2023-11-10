import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/model/task.dart';

class FirestoreService {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');
//add
  Future<void> addTask(Task task) {
    return tasks.add({
      'taskTitle': task.title.toString(),
      'taskDesc': task.description.toString(),
      'taskCategory': task.category.toString(),
    });
  }
  //get

  Stream<QuerySnapshot> getTasks() {
    return tasks.snapshots();
  }

//delete
  Future<void> deleteTask(String taskId) {
    return tasks.doc(taskId).delete();
  }
  //update

  Future<void> updateTask(Task updatedTask) {
    return tasks.doc(updatedTask.id).update({
      'taskTitle': updatedTask.title,
      'taskDesc': updatedTask.description,
      'taskCategory': updatedTask.category.toString(),
    });
  }
}
