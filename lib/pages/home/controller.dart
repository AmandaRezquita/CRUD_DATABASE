import 'package:crud_batabase/db/db_helper.dart';
import 'package:crud_batabase/models/note.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  late Database db;
  RxBool isLoading = false.obs;
  List<Note> notes = [];

  @override
  void onInit() {
    super.onInit();
    db = DbHelper.getDb();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    try {
      List<Map<String, dynamic>> mapNotes = await db.query("Notes");
      notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    } finally {
      isLoading.value = false;
    }
  }

  void createNote() async {
    var newNote = await Get.toNamed("/create");
    newNote = newNote as Note?;

    if (newNote != null) {
      await db.insert("Notes", newNote.toMap());
      getNotes();
    }
  }

  void deleteNote(int id) async {
    db.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void updateNote(int index)async{
    var newNote = await Get.toNamed("/create",arguments: notes[index]);
    newNote =newNote as Note?;

    if(newNote != null){
      await db.update("Notes", newNote.toMap(),
          where: "id = ?",whereArgs: [newNote.id]);
      getNotes();

    }
  }
}
