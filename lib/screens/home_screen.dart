import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/question_screen.dart';
import '../screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5FA),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFFF5F5FA),
            floating: true,
            pinned: false,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);
                  await prefs.remove('username');

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "505",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  List<Map<String, String>> items = [
                    {'image': 'img/mathematics.png', 'label': "Matematika"},
                    {'image': 'img/science.png', 'label': "Sains"},
                    {'image': 'img/book.png', 'label': "Bahasa"},
                    {'image': 'img/musical.png', 'label': "Musik"},
                    {'image': 'img/sport.jpg', 'label': "Olahraga"},
                    {'image': 'img/geo.jpg', 'label': "Geografi"},
                    {'image': 'img/prak.png', 'label': "Prakarya"},
                    {'image': 'img/agama.png', 'label': "Agama"},
                  ];

                  return _buildGridItem(context, items[index]['image']!, items[index]['label']!);
                },
                childCount: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuestionScreen(subject: label),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, size: 60);
              },
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
