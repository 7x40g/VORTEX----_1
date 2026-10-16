
import 'package:flutter/material.dart';

void main() {
  runApp(const GamerCommunityApp());
}

const bg = Color(0xFF08111F);
const panel = Color(0xFF111F33);
const blue = Color(0xFF168BFF);
const cyan = Color(0xFF42D9FF);
const muted = Color(0xFF9CB0C9);

class GamerCommunityApp extends StatelessWidget {
  const GamerCommunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gamer Community',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const CommunityHome(),
    );
  }
}

class CommunityHome extends StatefulWidget {
  const CommunityHome({super.key});

  @override
  State<CommunityHome> createState() => _CommunityHomeState();
}

class _CommunityHomeState extends State<CommunityHome> {
  int selectedTab = 0;
  final searchController = TextEditingController();
  final postController = TextEditingController();

  final games = const [
    {'name': 'PUBG Mobile', 'icon': '🎯'},
    {'name': 'Roblox', 'icon': '🎮'},
    {'name': 'Free Fire', 'icon': '🔥'},
    {'name': 'Minecraft', 'icon': '⛏️'},
    {'name': 'Call of Duty', 'icon': '⚔️'},
    {'name': 'eFootball', 'icon': '⚽'},
  ];

  final List<Map<String, dynamic>> posts = [
    {
      'name': 'Shadow',
      'game': 'PUBG Mobile',
      'text': 'منو يلعب ببجي اليوم؟ خلونا نكوّن فريق قوي 🔥',
      'likes': 24,
      'liked': false,
    },
    {
      'name': 'Dragon',
      'game': 'Minecraft',
      'text': 'شنو أفضل فكرة لبناء عالم جديد؟ شاركونا أفكاركم!',
      'likes': 16,
      'liked': false,
    },
    {
      'name': 'X Gamer',
      'game': 'Roblox',
      'text': 'أهلاً بكل اللاعبين! نورتوا مجتمع الألعاب 🎮',
      'likes': 31,
      'liked': false,
    },
  ];

  final List<Map<String, String>> players = [
    {'name': 'Shadow', 'game': 'PUBG Mobile', 'level': 'محترف'},
    {'name': 'Dragon', 'game': 'Minecraft', 'level': 'مستكشف'},
    {'name': 'Nova', 'game': 'Roblox', 'level': 'لاعب نشط'},
    {'name': 'Falcon', 'game': 'Free Fire', 'level': 'منافس'},
  ];

  @override
  void dispose() {
    searchController.dispose();
    postController.dispose();
    super.dispose();
  }

  void addPost() {
    final text = postController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      posts.insert(0, {
        'name': 'لاعب جديد',
        'game': 'مجتمع الألعاب',
        'text': text,
        'likes': 0,
        'liked': false,
      });
      selectedTab = 0;
      postController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('تمت إضافة منشورك على هذا الجهاز')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedTab,
          children: [
            buildHome(),
            buildGames(),
            buildPlayers(),
            buildProfile(),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: panel,
        indicatorColor: blue.withValues(alpha: 0.25),
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() => selectedTab = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: cyan),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.sports_esports_outlined),
            selectedIcon: Icon(Icons.sports_esports, color: cyan),
            label: 'الألعاب',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups, color: cyan),
            label: 'اللاعبون',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: cyan),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [blue, cyan],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Icon(
            Icons.sports_esports,
            color: Colors.white,
            size: 27,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GAMER COMMUNITY',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                'عالمك، لعبتك، مجتمعك',
                style: TextStyle(color: muted, fontSize: 12),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => setState(() => selectedTab = 3),
          icon: const Icon(Icons.account_circle_outlined, size: 29),
        ),
      ],
    );
  }

  Widget buildHome() {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        header(),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF124D91), Color(0xFF10243E)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: cyan.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'مستعد تدخل عالم الألعاب؟',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 9),
              const Text(
                'اكتشف الألعاب، تعرّف على لاعبين، وشارك لحظاتك.',
                style: TextStyle(color: Colors.white70, height: 1.5),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () => setState(() => selectedTab = 1),
                icon: const Icon(Icons.explore),
                label: const Text('اكتشف الألعاب'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 26),
        sectionTitle('الألعاب الشائعة', 'عرض الكل', () {
          setState(() => selectedTab = 1);
        }),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: games.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final game = games[index];
              return InkWell(
                borderRadius: BorderRadius.circular(17),
                onTap: () {
                  setState(() {
                    searchController.text = game['name']!;
                    selectedTab = 1;
                  });
                },
                child: Container(
                  width: 105,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: panel,
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(game['icon']!, style: const TextStyle(fontSize: 27)),
                      const SizedBox(height: 8),
                      Text(
                        game['name']!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 26),
        sectionTitle('آخر المنشورات', 'إنشاء منشور', () {
          showCreatePost();
        }),
        const SizedBox(height: 12),
        ...posts.map((post) => postCard(post)),
      ],
    );
  }

  Widget sectionTitle(String title, String action, VoidCallback onTap) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(onPressed: onTap, child: Text(action)),
      ],
    );
  }

  Widget postCard(Map<String, dynamic> post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: blue.withValues(alpha: 0.2),
                child: const Icon(Icons.person, color: cyan),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post['name'].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post['game'].toString(),
                      style: const TextStyle(color: muted, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: muted),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            post['text'].toString(),
            style: const TextStyle(height: 1.6, fontSize: 14),
          ),
          const Divider(height: 26, color: Colors.white12),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    final liked = post['liked'] as bool;
                    post['liked'] = !liked;
                    post['likes'] =
                        (post['likes'] as int) + (liked ? -1 : 1);
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      post['liked'] == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: post['liked'] == true ? Colors.pinkAccent : muted,
                    ),
                    const SizedBox(width: 6),
                    Text('${post['likes']}'),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              const Icon(Icons.chat_bubble_outline, color: muted, size: 20),
              const SizedBox(width: 6),
              const Text('تعليقات', style: TextStyle(color: muted)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildGames() {
    final query = searchController.text.trim().toLowerCase();
    final filtered = games.where((game) {
      return game['name']!.toLowerCase().contains(query);
    }).toList();

    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        header(),
        const SizedBox(height: 24),
        const Text(
          'اكتشف الألعاب',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 7),
        const Text('اختر لعبتك المفضلة', style: TextStyle(color: muted)),
        const SizedBox(height: 18),
        TextField(
          controller: searchController,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            hintText: 'ابحث عن لعبة...',
            prefixIcon: const Icon(Icons.search, color: cyan),
            filled: true,
            fillColor: panel,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 18),
        ...filtered.map(
          (game) => Card(
            color: panel,
            child: ListTile(
              leading: Text(
                game['icon']!,
                style: const TextStyle(fontSize: 29),
              ),
              title: Text(game['name']!),
              subtitle: const Text('اكتشف مجتمع هذه اللعبة'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('اخترت ${game['name']}'),
                  ),
                );
              },
            ),
          ),
        ),
        if (filtered.isEmpty)
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'ما لقينا لعبة بهذا الاسم ضمن القائمة التجريبية.',
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }

  Widget buildPlayers() {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        header(),
        const SizedBox(height: 24),
        const Text(
          'اكتشف اللاعبين',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'تعرّف على لاعبين من مجتمعات مختلفة.',
          style: TextStyle(color: muted),
        ),
        const SizedBox(height: 15),
        ...players.map(
          (player) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: panel,
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xFF164D7B),
                child: Icon(Icons.person, color: cyan),
              ),
              title: Text(
                player['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${player['game']} • ${player['level']}'),
              trailing: IconButton(
                tooltip: 'عرض اللاعب',
                icon: const Icon(Icons.person_add_alt_1, color: cyan),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('ملفات اللاعبين تجريبية حالياً'),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProfile() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        header(),
        const SizedBox(height: 35),
        const Center(
          child: CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFF164D7B),
            child: Icon(Icons.person, size: 55, color: cyan),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'لاعب جديد',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Text(
            'عضو في مجتمع الألعاب',
            style: TextStyle(color: muted),
          ),
        ),
        const SizedBox(height: 28),
        profileTile(Icons.edit_outlined, 'تعديل الملف الشخصي', () {
          showEditName();
        }),
        profileTile(Icons.favorite_border, 'منشوراتي المفضلة', () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('المفضلة ستضاف في مرحلة لاحقة')),
          );
        }),
        profileTile(Icons.settings_outlined, 'الإعدادات', () {
          showAbout();
        }),
        profileTile(Icons.info_outline, 'حول التطبيق', showAbout),
      ],
    );
  }

  Widget profileTile(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Card(
      color: panel,
      child: ListTile(
        leading: Icon(icon, color: cyan),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void showCreatePost() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: panel,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            20,
            22,
            20,
            MediaQuery.of(context).viewInsets.bottom + 22,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'إنشاء منشور',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: postController,
                maxLines: 4,
                maxLength: 500,
                decoration: const InputDecoration(
                  hintText: 'شارك اللاعبين أفكارك...',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context);
                    addPost();
                  },
                  child: const Text('نشر'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showEditName() {
    final controller = TextEditingController(text: 'لاعب جديد');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: panel,
        title: const Text('تعديل الاسم'),
        content: TextField(
          controller: controller,
          maxLength: 30,
          decoration: const InputDecoration(
            hintText: 'اكتب اسمك',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          FilledButton(
            onPressed: () {
              final name = controller.text.trim();
              Navigator.pop(context);
              ScaffoldMessenger.of(this.context).showSnackBar(
                SnackBar(
                  content: Text(
                    name.isEmpty
                        ? 'لم يتغير الاسم'
                        : 'تم إدخال الاسم: $name (تجريبي)',
                  ),
                ),
              );
            },
            child: const Text('حفظ'),
          ),
        ],
      ),
    );
  }

  void showAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'Gamer Community',
      applicationVersion: '0.1.0',
      applicationLegalese: 'نسخة أولية تجريبية لمجتمع اللاعبين.',
    );
  }
}
