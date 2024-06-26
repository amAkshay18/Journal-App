import 'package:flutter/material.dart';
import 'package:journal/provider/notes/notes_provider.dart';
import 'package:journal/screens/add_note/add_note_screen.dart';
import 'package:journal/screens/home/widgets/item_note.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Dairy',
        ),
        centerTitle: true,
      ),
      body: Consumer<NotesProvider>(
        builder: (context, provider, child) {
          return provider.notes.isEmpty
              ? const Center(
                  child: Text('Empty'),
                )
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children:
                      provider.notes.map((e) => ItemNote(note: e)).toList(),
                );
        },
      ),

      //  FutureBuilder(
      //   future: NotesRepository.getNotes(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.data == null || snapshot.data!.isEmpty) {
      //         return const Center(
      //           child: Text('Empty'),
      //         );
      //       }
      //       return ListView(
      //         padding: const EdgeInsets.all(15),
      //         children: [
      //           for (var note in snapshot.data!)
      //             ItemNote(
      //               note: note,
      //             ),
      //         ],
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNoteScreen(),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
