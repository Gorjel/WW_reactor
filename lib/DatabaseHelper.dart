import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:http/http.dart';
import 'dart:math';




class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE answers (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        answer_feel TEXT,
        answer_want TEXT,
        sentiment DOUBLE,
        category TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<String> get_sentiment_and_category(answer_feel, answer_want) async {
    String body = "";
    print("sending requets to Dinstance matrix");
    var url = Uri.https('junction2022.bropro.systems');
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"text": "$answer_feel"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(response.body);
    if (statusCode == 200){
      body = response.body;
      print(body);
    }else{
      print("Request failed");
    }
    return body;
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'ww_reactor2.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createAnswer(String answer_feel, String  answer_want) async {
    final db = await SQLHelper.db();

    List<String> categories = ['Relationship', 'Family', 'Work', 'Hobby', 'Health'];
    Random random = Random();
    int i = max(0, random.nextInt(5));

    String category = categories[i];
    var sentiment = random.nextDouble() - 0.5;

    //// HERE GET category from database

    final data = {'answer_feel': answer_feel, 'answer_want': answer_want, 'sentiment': sentiment, 'category' : category};
    final id = await db.insert('answers', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // count items per category (journals)
  static Future<List<Map<String, dynamic>>> countPerCategory() async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT category, SUM(sentiment) AS sentiment, COUNT(*) AS answer_count FROM answers GROUP BY 1 ORDER BY answer_count DESC ');
  }

  // count all items
  static Future<List<Map<String, dynamic>>> countAllItems() async {
    final db = await SQLHelper.db();
    return db.rawQuery('SELECT COUNT(*) AS total FROM answers');
  }


  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getAnswers() async {
    final db = await SQLHelper.db();
    return db.query('answers', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getAnswer(int id) async {
    final db = await SQLHelper.db();
    return db.query('answers', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // // Update an item by id
  // static Future<int> updateItem(
  //     int id, String title, String? descrption) async {
  //   final db = await SQLHelper.db();

  //   final data = {
  //     'title': title,
  //     'description': descrption,
  //     'createdAt': DateTime.now().toString()
  //   };

  //   final result =
  //       await db.update('items', data, where: "id = ?", whereArgs: [id]);
  //   return result;
  // }

  // // Delete
  // static Future<void> deleteItem(int id) async {
  //   final db = await SQLHelper.db();
  //   try {
  //     await db.delete("items", where: "id = ?", whereArgs: [id]);
  //   } catch (err) {
  //     debugPrint("Something went wrong when deleting an item: $err");
  //   }
  // }
}