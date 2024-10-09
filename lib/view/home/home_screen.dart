import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/contact_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    final nameController = TextEditingController();
    final contactController = TextEditingController();
    final editNameController = TextEditingController();
    final editContactController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: const Text('Contact'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.person_add_alt_1_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.search,color: Colors.grey,),
                  Text('  Search',style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: controller.contactList.length,
                itemBuilder: (context, index) {
                  final contact = controller.contactList[index];

                  return ListTile(
                    title: Text(contact.name ?? ''),
                    trailing: SizedBox(
                      width: 100,  // Ensure the trailing widget doesn't consume entire width
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              // Edit the item
                              editNameController.text = contact.name ?? '';
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Edit item'),
                                    content: Column(
                                      children: [
                                        TextField(
                                          controller: editNameController,
                                          decoration: const InputDecoration(
                                              hintText: 'Enter new item'),
                                        ),
                                        TextField(
                                          // controller: editDesController,
                                          decoration: const InputDecoration(
                                              hintText: 'Enter new description'),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {

                                        },
                                        child: const Text('Save'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title:Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),

              ],
            ) ,
            actions: [
              TextButton(onPressed: () {

              }, child: Text('Save')),
              TextButton(onPressed: () {

              }, child: Text('Cancel'))
            ],
          );
        },);
      },child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}
