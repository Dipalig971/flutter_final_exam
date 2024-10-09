class ContactModal {
  int? id;
  String? contactNumber;
  String? name;

  ContactModal(
      { this.id,  this.contactNumber, required this.name});

  factory ContactModal.fromMap(Map m1) {
    return ContactModal(
        id: m1['id'],
        contactNumber: m1['contactNumber'],
        name: m1['name']);
  }

  Map<String, dynamic> fromMap() {
    return {
      'id': id,
      'name': name,
      'contactNumber': contactNumber,
    };
  }
}
