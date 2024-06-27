import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoryPage extends StatelessWidget {
  // Fetch BMI history from local storage
  Future<List<String>> _fetchBMIHistoryFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('bmiHistory') ?? [];
  }

  // Fetch BMI history from the server
  Future<List<String>> _fetchBMIHistoryFromServer() async {
    final response = await http.get(
      Uri.parse('https://yourapi.com/get_bmi_history'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => item.toString()).toList();
    } else {
      throw Exception('Failed to fetch BMI history');
    }
  }

  // Fetch combined BMI history from local and server
  Future<List<String>> _fetchBMIHistory() async {
    List<String> localHistory = await _fetchBMIHistoryFromLocal();
    List<String> serverHistory = await _fetchBMIHistoryFromServer();
    return [...localHistory, ...serverHistory];
  }

  // Clear BMI history from local storage
  Future<void> _clearBMIHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('bmiHistory');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI History'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await _clearBMIHistory();
              // Rebuild to reflect the cleared history
              (context as Element).reassemble();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: _fetchBMIHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No BMI history available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
