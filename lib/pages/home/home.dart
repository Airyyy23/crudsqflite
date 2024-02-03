import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_local_db/pages/home/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.insertNote,
        child: Icon(Icons.edit),
      ),
      body: SafeArea(
        child: Obx(() => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.notes[index].title),
                    subtitle: Text(controller.notes[index].content),
                    trailing: PopupMenuButton(
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          child: Text("Edit"),
                          onTap: () =>
                              controller.editNote(controller.notes[index].id!),
                        ),
                        PopupMenuItem(
                          child: Text("Delete"),
                          onTap: () => controller
                              .removeNote(controller.notes[index].id!),
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}