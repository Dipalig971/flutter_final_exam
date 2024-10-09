import 'package:flutter_final_exam/helper/db_helper.dart';
import 'package:flutter_final_exam/modal/contact_modal.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  RxList<ContactModal> contactList = <ContactModal>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      contactList.value=await DataBaseHelper.dbHelper.getItem();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  Future<void> addData(String name) async {
    if (name.isNotEmpty) {
      ContactModal contactModel = ContactModal(name: name);
      await DataBaseHelper.dbHelper.insertData(contactModel);
      await fetchData();
    } else {
    }
  }
  Future<void> updateData(ContactModal contact) async {
    try {
      await DataBaseHelper.dbHelper.updateData(contact);
      await fetchData();
    } catch (e) {
      print("Error updating item: $e");
    }
  }

  Future<void> deleteData(int id) async {
    try {
      await DataBaseHelper.dbHelper.deleteData(id);
      await fetchData();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }
}
