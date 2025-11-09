import 'package:flutter/material.dart';

void main() {
  runApp(MoodTrackerApp());
}

class MoodTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MoodHomePage(),
    );
  }
}

class MoodEntry {
  final String mood;
  final String note;
  final DateTime date;

  MoodEntry(this.mood, this.note, this.date);
}

class MoodHomePage extends StatefulWidget {
  @override
  _MoodHomePageState createState() => _MoodHomePageState();
}

class _MoodHomePageState extends State<MoodHomePage> {
  String? _selectedMood;
  final TextEditingController _noteController = TextEditingController();
  final List<MoodEntry> _entries = [];

  void _saveEntry() {
    if (_selectedMood != null && _noteController.text.isNotEmpty) {
      setState(() {
        _entries.add(MoodEntry(
          _selectedMood!,
          _noteController.text,
          DateTime.now(),
        ));
        _selectedMood = null;
        _noteController.clear();
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mood entry saved!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Mood Tracker")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("How are you feeling today?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMoodButton("😊", "Happy"),
                _buildMoodButton("😐", "Neutral"),
                _buildMoodButton("😢", "Sad"),
                _buildMoodButton("😡", "Angry"),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: "Write a short note",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _saveEntry,
                child: Text("Save Entry"),
              ),
            ),
            Divider(),
            Expanded(
              child: _entries.isEmpty
                  ? Center(child: Text("No entries yet"))
                  : ListView.builder(
                      itemCount: _entries.length,
                      itemBuilder: (context, index) {
                        final entry = _entries[index];
                        return ListTile(
                          leading:
                              Text(entry.mood, style: TextStyle(fontSize: 24)),
                          title: Text(entry.note),
                          subtitle: Text(
                              "${entry.date.day}/${entry.date.month}/${entry.date.year}"),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(String emoji, String label) {
    final isSelected = _selectedMood == emoji;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMood = emoji;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(emoji, style: TextStyle(fontSize: 30)),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
