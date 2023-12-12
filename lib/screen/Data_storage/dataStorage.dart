
// class SecureStorage {
// // Create storage
//   final FlutterSecureStorage storage = new FlutterSecureStorage();

//   // Write value
//   Future<void> writeData(String key, String value) async {
//     await storage.write(key: key, value: value);
//   }

//   // Read value
//   Future<String> readData(String key) async {
//     String? value = await storage.read(key: key);
//     print(value);
//     return value!;
//   }

//   // // Read all values
//   // Map<String, String> allValues = await storage.readAll();

//   // Delete value
//   deleteData(String key) async {
//     await storage.delete(key: key);
//   }

//   // Delete all
//   deleteAllData() async {
//     await storage.deleteAll();
//   }
// }

// class Storage {
//   var box = Hive.box('myData');
// }
