import 'package:get/get.dart';
import 'package:latihan_local_db/db/db_helper.dart';
import 'package:latihan_local_db/models/note.dart';
import 'package:sqflite/sqflite.dart';

class HomeController extends GetxController {
  Database? db = DbHelper.getDb();

  RxBool isLoading = false.obs;
  late List<Note> notes;

  @override
  void onInit() {
    super.onInit();
    getNotes();
  }

  void getNotes() async {
    isLoading.value = true;
    List<Map<String, dynamic>> mapNotes = await db!.query("Notes");
    notes = mapNotes.map((e) => Note.fromMap(map: e)).toList();
    isLoading.value = false;
  }

  void editNote(int index) async {
    Note oldNote = Note.fromMap(map: notes[index]);
    var newNote = await Get.toNamed("/create", arguments: oldNote);
    newNote = newNote as Note?;
    if (newNote != null) {
      await db?.update("Notes", newNote.toMap(),
          where: "id = ?", whereArgs: [newNote.id]);
      getNotes();
    }
  }

  void removeNote(int id) async {
    await db?.delete("Notes", where: "id = ?", whereArgs: [id]);
    getNotes();
  }

  void insertNote() async {
    var newNote = await Get.toNamed("/create");
    newNote = newNote as Note?;
    if (newNote != null) {
      await db?.insert("Notes", newNote.toMap());
      getNotes();
    }
  }
}