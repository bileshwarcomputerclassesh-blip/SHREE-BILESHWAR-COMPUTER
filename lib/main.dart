import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const String instituteName = 'SHREE BILESHWAR COMPUTER';
const String tagline = 'Learn Today • Build Your Tomorrow';
const String contactNumber = '9558373839';

const Color primaryBlue = Color(0xFF1455D9);
const Color darkBlue = Color(0xFF0B2E73);
const Color lightBlue = Color(0xFFEAF2FF);
const Color orange = Color(0xFFFF8A00);
const Color green = Color(0xFF16A34A);

void main() {
  runApp(const ShreeBileshwarComputerApp());
}

class ShreeBileshwarComputerApp extends StatefulWidget {
  const ShreeBileshwarComputerApp({super.key});

  @override
  State<ShreeBileshwarComputerApp> createState() =>
      _ShreeBileshwarComputerAppState();
}

class _ShreeBileshwarComputerAppState
    extends State<ShreeBileshwarComputerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: instituteName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: darkBlue,
          elevation: 0,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// SPLASH SCREEN
// ============================================================

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainNavigationScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              darkBlue,
              primaryBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 145,
                height: 145,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                instituteName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                tagline,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  minHeight: 5,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: Colors.white24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    CoursesScreen(),
    EnquiryScreen(),
    ContactScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book_rounded),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.message_outlined),
            selectedIcon: Icon(Icons.message_rounded),
            label: 'Enquiry',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone_outlined),
            selectedIcon: Icon(Icons.phone_rounded),
            label: 'Contact',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info_rounded),
            label: 'About',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openCourses(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CoursesScreen(),
      ),
    );
  }

  void _openEnquiry(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const EnquiryScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10,
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 42,
              height: 42,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                instituteName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HERO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    darkBlue,
                    primaryBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    'Build Your Digital Future With Us',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    tagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _openCourses(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: darkBlue,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                          ),
                          child: const Text(
                            'View Courses',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            _openEnquiry(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                          ),
                          child: const Text(
                            'Enquire Now',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _quickCard(
                    context,
                    Icons.menu_book_rounded,
                    'Courses',
                    () {
                      _openCourses(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _quickCard(
                    context,
                    Icons.message_rounded,
                    'Enquiry',
                    () {
                      _openEnquiry(context);
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _quickCard(
                    context,
                    Icons.phone_rounded,
                    'Contact',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ContactScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Popular Courses',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              itemBuilder: (context, index) {
                final course = courses[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CourseDetailsScreen(
                          course: course,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFE1E7F0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Icon(
                          course.icon,
                          color: primaryBlue,
                          size: 32,
                        ),
                        const Spacer(),
                        Text(
                          course.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          course.duration,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          course.fees,
                          style: const TextStyle(
                            color: primaryBlue,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // ABOUT CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.school_rounded,
                    color: primaryBlue,
                    size: 40,
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          instituteName,
                          style: TextStyle(
                            color: darkBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          tagline,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget _quickCard(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE1E7F0),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: primaryBlue,
              size: 28,
            ),
            const SizedBox(height: 7),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// COURSE MODEL
// ============================================================

class Course {
  final String name;
  final String duration;
  final String fees;
  final String overview;
  final List<String> benefits;
  final IconData icon;

  const Course({
    required this.name,
    required this.duration,
    required this.fees,
    required this.overview,
    required this.benefits,
    required this.icon,
  });
}

// ============================================================
// COURSES
// ============================================================

const List<Course> courses = [
  Course(
    name: 'CCC – Computer Course',
    duration: '3 Months',
    fees: '₹2,500',
    overview:
        'Computer fundamentals and essential computer knowledge for students and learners.',
    benefits: [
      'Computer basics',
      'Internet knowledge',
      'Essential digital skills',
    ],
    icon: Icons.computer_rounded,
  ),
  Course(
    name: 'Basic Computer Course',
    duration: '2 Months',
    fees: '₹1,999',
    overview:
        'A basic course for learning everyday computer operations and digital skills.',
    benefits: [
      'Computer fundamentals',
      'Basic applications',
      'Practical computer skills',
    ],
    icon: Icons.desktop_windows_rounded,
  ),
  Course(
    name: 'Tally Prime',
    duration: '3 Months',
    fees: '₹3,500',
    overview:
        'Learn accounting and business-related computer operations using Tally Prime.',
    benefits: [
      'Tally Prime basics',
      'Accounting knowledge',
      'Business computer skills',
    ],
    icon: Icons.calculate_rounded,
  ),
  Course(
    name: 'Advanced Excel',
    duration: '2 Months',
    fees: '₹2,500',
    overview:
        'Learn spreadsheet tools and advanced Excel skills for practical work.',
    benefits: [
      'Advanced Excel skills',
      'Data handling',
      'Spreadsheet knowledge',
    ],
    icon: Icons.table_chart_rounded,
  ),
  Course(
    name: 'DTP Course',
    duration: '3 Months',
    fees: '₹3,000',
    overview:
        'Learn desktop publishing and computer-based design related skills.',
    benefits: [
      'DTP fundamentals',
      'Design knowledge',
      'Practical computer work',
    ],
    icon: Icons.design_services_rounded,
  ),
  Course(
    name: 'Computer Hardware',
    duration: '3 Months',
    fees: '₹4,000',
    overview:
        'Learn computer hardware fundamentals, maintenance and troubleshooting.',
    benefits: [
      'Hardware basics',
      'Computer maintenance',
      'Troubleshooting knowledge',
    ],
    icon: Icons.memory_rounded,
  ),
  Course(
    name: 'Programming Course',
    duration: '6 Months',
    fees: '₹5,999',
    overview:
        'Learn programming fundamentals and build a foundation in computer programming.',
    benefits: [
      'Programming fundamentals',
      'Logical thinking',
      'Practical coding knowledge',
    ],
    icon: Icons.code_rounded,
  ),
];

// ============================================================
// COURSES SCREEN
// ============================================================

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Courses',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CourseDetailsScreen(
                      course: course,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFE1E7F0),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        course.icon,
                        color: primaryBlue,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            course.duration,
                            style: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            course.fees,
                            style: const TextStyle(
                              color: primaryBlue,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ============================================================
// COURSE DETAILS
// ============================================================

class CourseDetailsScreen extends StatelessWidget {
  final Course course;

  const CourseDetailsScreen({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Course Details',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    darkBlue,
                    primaryBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Icon(
                    course.icon,
                    color: Colors.white,
                    size: 55,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    course.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _infoBox(
                    'Duration',
                    course.duration,
                    Icons.schedule_rounded,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _infoBox(
                    'Fees',
                    course.fees,
                    Icons.currency_rupee_rounded,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Course Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              course.overview,
              style: const TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Key Benefits',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: darkBlue,
              ),
            ),

            const SizedBox(height: 12),

            ...course.benefits.map(
              (benefit) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: green,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        benefit,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EnquiryScreen(
                        selectedCourse: course.name,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.message_rounded,
                ),
                label: const Text(
                  'ENQUIRY NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget _infoBox(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE1E7F0),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: primaryBlue,
          ),
          const SizedBox(height: 7),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              color: darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ENQUIRY SCREEN
// ============================================================

class EnquiryScreen extends StatefulWidget {
  final String? selectedCourse;

  const EnquiryScreen({
    super.key,
    this.selectedCourse,
  });

  @override
  State<EnquiryScreen> createState() => _EnquiryScreenState();
}

class _EnquiryScreenState extends State<EnquiryScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController studentNameController =
      TextEditingController();

  final TextEditingController mobileController =
      TextEditingController();

  final TextEditingController messageController =
      TextEditingController();

  String? selectedCourse;

  @override
  void initState() {
    super.initState();
    selectedCourse = widget.selectedCourse;
  }

  @override
  void dispose() {
    studentNameController.dispose();
    mobileController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> _sendEnquiry() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final studentName =
        studentNameController.text.trim();

    final mobile =
        mobileController.text.trim();

    final course =
        selectedCourse ?? 'Not Selected';

    final message =
        messageController.text.trim();

    final smsMessage =
        'Shree Bileshwar Computer – New Enquiry\n\n'
        'Student Name: $studentName\n'
        'Mobile Number: $mobile\n'
        'Course: $course\n'
        'Message: $message\n\n'
        'Please contact the student.';

    final Uri smsUri = Uri.parse(
      'sms:$contactNumber?body=${Uri.encodeComponent(smsMessage)}',
    );

    try {
      final launched = await launchUrl(
        smsUri,
        mode: LaunchMode.externalApplication,
      );

      if (!mounted) return;

      if (launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'SMS app opened. Please press Send.',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Unable to open SMS app.',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to open SMS app.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enquiry',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.message_rounded,
                      color: primaryBlue,
                      size: 42,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Course Enquiry',
                      style: TextStyle(
                        color: darkBlue,
                        fontSize: 21,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Fill the details and send your enquiry.',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              TextFormField(
                controller: studentNameController,
                decoration: const InputDecoration(
                  labelText: 'Student Name',
                  prefixIcon:
                      Icon(Icons.person_rounded),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty) {
                    return 'Please enter student name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 14),

              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  prefixIcon:
                      Icon(Icons.phone_rounded),
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                validator: (value) {
                  final text = value?.trim() ?? '';

                  if (text.isEmpty) {
                    return 'Please enter mobile number';
                  }

                  if (text.length != 10) {
                    return 'Enter valid 10 digit mobile number';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 14),

              DropdownButtonFormField<String>(
                value: selectedCourse,
                decoration: const InputDecoration(
                  labelText: 'Course',
                  prefixIcon:
                      Icon(Icons.menu_book_rounded),
                  border: OutlineInputBorder(),
                ),
                items: courses
                    .map(
                      (course) =>
                          DropdownMenuItem<String>(
                        value: course.name,
                        child: Text(
                          course.name,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value;
                  });
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'Please select course';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 14),

              TextFormField(
                controller: messageController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Message / Query',
                  alignLabelWithHint: true,
                  prefixIcon:
                      Icon(Icons.edit_note_rounded),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _sendEnquiry,
                  icon: const Icon(
                    Icons.send_rounded,
                  ),
                  label: const Text(
                    'SEND ENQUIRY',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryBlue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'After tapping SEND ENQUIRY, the SMS app will open with the enquiry message. Please press Send.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// CONTACT SCREEN
// ============================================================

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  Future<void> _call() async {
    final Uri uri =
        Uri.parse('tel:$contactNumber');

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> _sms() async {
    final smsMessage =
        'Hello Shree Bileshwar Computer, I would like to enquire about your courses.';

    final Uri uri = Uri.parse(
      'sms:$contactNumber?body=${Uri.encodeComponent(smsMessage)}',
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    darkBlue,
                    primaryBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    width: 115,
                    height: 115,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    instituteName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    tagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _call,
                icon: const Icon(
                  Icons.call_rounded,
                ),
                label: const Text(
                  'CALL NOW',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _sms,
                icon: const Icon(
                  Icons.sms_rounded,
                ),
                label: const Text(
                  'SMS ENQUIRY',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 22),

            _contactInfoCard(
              Icons.phone_rounded,
              'Contact Number',
              contactNumber,
            ),

            const SizedBox(height: 12),

            _contactInfoCard(
              Icons.location_on_rounded,
              'Location',
              'Mahuva, Gujarat',
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget _contactInfoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFE1E7F0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: primaryBlue,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ABOUT SCREEN
// PDF INFORMATION
// ============================================================

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    darkBlue,
                    primaryBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 18),

                  const Text(
                    instituteName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 7),

                  const Text(
                    tagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'SHREE BILESHWAR COMPUTER PROVIDES THE FOLLOWING SERVICES.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                height: 1.35,
              ),
            ),

            const SizedBox(height: 20),

            // COMPUTER EDUCATION
            _aboutSection(
              icon: Icons.school_rounded,
              title: 'COMPUTER EDUCATION',
              items: const [
                'CERTIFICATE IN VISUAL BASIC',
                'CERTIFICATE IN ASP',
                'CERTIFICATE IN PHOTOSHOP',
                'CERTIFICATE IN JAVA',
                'CERTIFICATE IN TALLY EXPERT',
                'CERTIFICATE IN CORELDRAW',
                'CERTIFICATE IN SPOKEN ENGLISH',
                'CERTIFICATE IN TALLY.ERP9 + GST',
                'CERTIFICATE IN GUJARATI TYPING',
                'CERTIFICATE IN PHP',
                'CERTIFICATE IN COMPUTER APPLICATION',
                'CERTIFICATE COURSE IN WEB MULTIMEDIA',
                'CERTIFICATE IN BASIC OF COMPUTER',
                'CERTIFICATE DATA ENTRY OPERATOR',
                'CERTIFICATE IN TALLY MASTER',
                'CERTIFICATE COURSE IN ASP. NET',
                'CERTIFICATE IN MOBILE REPAIRING',
                'CERTIFICATE IN COMPUTER NETWORKING',
                'CERTIFICATE IN ENGLISH TYPING',
                'CERTIFICATE COURSE IN INTERNET',
                'COURSE ON COMPUTER CONCEPT (C.C.C)',
                'BASIC COMPUTER COURSE',
              ],
            ),

            // ONLINE FORMS
            _aboutSection(
              icon: Icons.assignment_rounded,
              title: 'ALL TYPES OF ONLINE FORMS',
              items: const [
                'Government Online Forms',
                'Scholarship Forms',
                'College & University Admission Forms',
                'School Admission Forms',
                'Job & Recruitment Forms',
                'Competitive Exam Forms',
                'SSC / UPSC / GPSC Forms',
                'Banking & Insurance Forms',
                'Railway Online Forms',
                'Police & Defence Recruitment Forms',
                'GDS / Post Office Forms',
                'PAN Card Online Form',
                'Passport Online Form',
                'Aadhaar Related Online Services',
                'Driving Licence / RTO Forms',
                'Income Certificate Form',
                'Caste Certificate Form',
                'EWS Certificate Form',
                'Non-Creamy Layer Certificate Form',
                'Digital Gujarat Forms',
                'E-Dhara / Land Related Forms',
                'Birth & Death Certificate Forms',
                'PM-Kisan Related Forms',
                'Government Scheme Forms',
                'Ayushman Card / Health Scheme Forms',
                'Voter ID Online Form',
                'Election Card Correction Form',
                'Electricity Bill / Connection Forms',
                'Gas Connection Forms',
                'GST / Business Registration Forms',
                'MSME / Udyam Registration',
                'Income Tax / ITR Forms',
                'PF / ESIC Related Forms',
                'Company / Firm Registration Forms',
                'Tender / Government Portal Forms',
                'Exam Registration & Hall Ticket',
                'Result / Marksheet Download',
                'Online Payment & Challan Services',
                'Data Entry & Document Upload',
                'Resume / CV Online Preparation',
                'Other All Online Application Forms',
              ],
            ),

            // COMPUTER SALES & SERVICE
            _aboutSection(
              icon: Icons.computer_rounded,
              title: 'COMPUTER SALES & SERVICE',
              items: const [
                'New Computers',
                'New Laptops',
                'Refurbished Computers',
                'Refurbished Laptops',
                'New & Used Printers',
                'Computer Accessories',
                'Computer & Laptop Repairing',
                'Printer Repairing & Servicing',
                'Networking Solutions',
              ],
            ),

            // CCTV
            _aboutSection(
              icon: Icons.videocam_rounded,
              title: 'CCTV SERVICES',
              items: const [
                'CCTV Camera Sales',
                'New & Used CCTV Cameras',
                'HD / IP CCTV Cameras',
                'CCTV Installation',
                'DVR / NVR Installation',
                'CCTV Wiring & Networking',
                'Mobile Remote Viewing Setup',
                'CCTV Maintenance & Repairing',
                'Hard Disk Installation & Backup',
                'Home, Office & Shop CCTV Setup',
                'Complete CCTV Security Solutions',
              ],
            ),

            // LEGAL & DOCUMENT
            _aboutSection(
              icon: Icons.description_rounded,
              title: 'LEGAL & DOCUMENT SERVICES',
              items: const [
                'Legal Documents Typing & Printing',
                'Affidavit',
                'Agreement',
                'Rent Agreement',
                'Undertaking',
                'Legal Notice',
                'Stamp Paper',
                'PDF',
                'Court Documents Upload',
                'e-Court',
                'Case Status / Case Search',
                'Court Hearing / Next Date',
                'Order / Judgment Download',
                'Document Printing, Scanning & Xerox',
                'PDF Merge / Split / Compress',
                'Digital Signature',
                'Email Legal Documents',
                'PAN / Aadhaar / KYC Document',
                'Government Portal',
                'RTI Application Typing',
                'Property / Land',
                'Income / Caste / EWS / NCL',
                'GST / ITR / Business',
                'WhatsApp / Email Document Sharing',
              ],
            ),

            const SizedBox(height: 20),

            // CONTACT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.phone_in_talk_rounded,
                    color: primaryBlue,
                    size: 32,
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'For More Information',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    contactNumber,
                    style: TextStyle(
                      color: darkBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: const Color(0xFFE1E7F0),
                ),
              ),
              child: const Text(
                'Learn Today • Build Your Tomorrow',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget _aboutSection({
    required IconData icon,
    required String title,
    required List<String> items,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE1E7F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.035),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: primaryBlue,
                  size: 26,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: darkBlue,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(
                bottom: 9,
              ),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.check_circle_rounded,
                    color: green,
                    size: 19,
                  ),

                  const SizedBox(width: 9),

                  Expanded(
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 1.35,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
