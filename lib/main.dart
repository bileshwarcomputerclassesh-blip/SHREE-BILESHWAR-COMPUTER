import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BileshwarComputerApp());
}

// ============================================================
// APP CONSTANTS
// ============================================================

const String instituteName = 'SHREE BILESHWAR COMPUTER';
const String tagline = 'Learn Today • Build Your Tomorrow';
const String contactNumber = '9558373839';

const Color primaryBlue = Color(0xFF1455D9);
const Color darkBlue = Color(0xFF0B2E73);
const Color lightBlue = Color(0xFFEAF2FF);
const Color orange = Color(0xFFFF8A00);
const Color green = Color(0xFF16A34A);

// ============================================================
// APP
// ============================================================

class BileshwarComputerApp extends StatelessWidget {
  const BileshwarComputerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: instituteName,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color(0xFFD9E0EA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(color: Color(0xFFD9E0EA)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            borderSide: BorderSide(
              color: primaryBlue,
              width: 2,
            ),
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

// ============================================================
// SMS
// ============================================================

Future<void> openSms({
  required String studentName,
  required String mobile,
  required String course,
  required String message,
}) async {
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

  if (await canLaunchUrl(smsUri)) {
    await launchUrl(
      smsUri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw Exception('Could not open SMS app');
  }
}

// ============================================================
// CALL
// ============================================================

Future<void> makeCall() async {
  final Uri phoneUri = Uri.parse('tel:$contactNumber');

  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(
      phoneUri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw Exception('Could not open phone app');
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
          builder: (_) => const HomeScreen(),
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
                width: 165,
                height: 165,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 25,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                instituteName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                tagline,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 45),

              SizedBox(
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const LinearProgressIndicator(
                    minHeight: 5,
                    backgroundColor: Colors.white24,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
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
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 12,
        title: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                instituteName,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ------------------------------------------------
            // HERO BANNER
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [
                    darkBlue,
                    primaryBlue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryBlue.withOpacity(0.25),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Container(
                        width: 78,
                        height: 78,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Image.asset(
                          'assets/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Text(
                          'Build Your\nDigital Future\nWith Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            height: 1.08,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Learn Computer Skills • Grow Your Career',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: _heroButton(
                          context,
                          title: 'View Courses',
                          icon: Icons.menu_book_rounded,
                          color: Colors.white,
                          textColor: primaryBlue,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CoursesScreen(),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: _heroButton(
                          context,
                          title: 'Enquire Now',
                          icon: Icons.edit_note_rounded,
                          color: orange,
                          textColor: Colors.white,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EnquiryScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ------------------------------------------------
            // QUICK ACTIONS
            // ------------------------------------------------

            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _quickAction(
                    context,
                    icon: Icons.school_rounded,
                    title: 'Courses',
                    color: primaryBlue,
                    page: const CoursesScreen(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _quickAction(
                    context,
                    icon: Icons.message_rounded,
                    title: 'Enquiry',
                    color: orange,
                    page: const EnquiryScreen(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _quickAction(
                    context,
                    icon: Icons.phone_rounded,
                    title: 'Contact',
                    color: green,
                    page: const ContactScreen(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ------------------------------------------------
            // POPULAR COURSES
            // ------------------------------------------------

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Courses',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CoursesScreen(),
                      ),
                    );
                  },
                  child: const Text('View All'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.18,
              ),
              itemBuilder: (context, index) {
                final course = courses[index];

                return _courseMiniCard(
                  context,
                  course,
                );
              },
            ),

            const SizedBox(height: 28),

            // ------------------------------------------------
            // ABOUT CARD
            // ------------------------------------------------

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
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
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.verified_rounded,
                      color: primaryBlue,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Learn Today • Build Your Tomorrow',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Practical computer education for students and learners.',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // ------------------------------------------------------
      // BOTTOM NAVIGATION
      // ------------------------------------------------------

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CoursesScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const EnquiryScreen(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ContactScreen(),
              ),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AboutScreen(),
              ),
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.edit_note_outlined),
            selectedIcon: Icon(Icons.edit_note),
            label: 'Enquiry',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone_outlined),
            selectedIcon: Icon(Icons.phone),
            label: 'Contact',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'About',
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // HERO BUTTON
  // ==========================================================

  static Widget _heroButton(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 48,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: textColor,
          size: 21,
        ),
        label: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w800,
            fontSize: 13,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // QUICK ACTION
  // ==========================================================

  static Widget _quickAction(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required Widget page,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 6,
        ),
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
              color: color,
              size: 30,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // COURSE MINI CARD
  // ==========================================================

  static Widget _courseMiniCard(
    BuildContext context,
    Course course,
  ) {
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
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFFE1E7F0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.035),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _courseIcon(course.name),
                color: primaryBlue,
              ),
            ),

            const Spacer(),

            Text(
              course.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              '${course.duration} • ₹${course.fees}',
              style: const TextStyle(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static IconData _courseIcon(String name) {
    if (name.contains('Tally')) {
      return Icons.account_balance_wallet_rounded;
    }

    if (name.contains('Excel')) {
      return Icons.table_chart_rounded;
    }

    if (name.contains('DTP')) {
      return Icons.design_services_rounded;
    }

    if (name.contains('Hardware')) {
      return Icons.memory_rounded;
    }

    if (name.contains('Programming')) {
      return Icons.code_rounded;
    }

    return Icons.computer_rounded;
  }
}

// ============================================================
// COURSE MODEL
// ============================================================

class Course {
  final String name;
  final String duration;
  final int fees;
  final String details;
  final List<String> benefits;

  const Course({
    required this.name,
    required this.duration,
    required this.fees,
    required this.details,
    required this.benefits,
  });
}

// ============================================================
// COURSES
// ============================================================

const List<Course> courses = [
  Course(
    name: 'CCC – Computer Course',
    duration: '3 Months',
    fees: 2500,
    details:
        'Complete basic computer knowledge including computer fundamentals, internet, MS Office and digital skills.',
    benefits: [
      'Basic Computer Knowledge',
      'MS Office',
      'Internet & Email',
      'Digital Skills',
    ],
  ),

  Course(
    name: 'Basic Computer Course',
    duration: '2 Months',
    fees: 1999,
    details:
        'A beginner-friendly course for students who want to learn essential computer operations.',
    benefits: [
      'Computer Fundamentals',
      'Typing',
      'MS Word',
      'Internet Basics',
    ],
  ),

  Course(
    name: 'Tally Prime',
    duration: '3 Months',
    fees: 3500,
    details:
        'Learn accounting and business management using Tally Prime.',
    benefits: [
      'Accounting Basics',
      'Tally Prime',
      'GST Basics',
      'Business Accounting',
    ],
  ),

  Course(
    name: 'Advanced Excel',
    duration: '2 Months',
    fees: 2500,
    details:
        'Learn advanced Excel functions, formulas, data management and professional spreadsheets.',
    benefits: [
      'Advanced Formulas',
      'Data Management',
      'Charts',
      'Professional Reports',
    ],
  ),

  Course(
    name: 'DTP Course',
    duration: '3 Months',
    fees: 3000,
    details:
        'Learn desktop publishing and professional document and graphic designing basics.',
    benefits: [
      'Page Designing',
      'Document Designing',
      'Printing Basics',
      'Graphic Work',
    ],
  ),

  Course(
    name: 'Computer Hardware',
    duration: '3 Months',
    fees: 4000,
    details:
        'Learn computer hardware components, installation, troubleshooting and maintenance.',
    benefits: [
      'Hardware Components',
      'Computer Assembly',
      'Troubleshooting',
      'Maintenance',
    ],
  ),

  Course(
    name: 'Programming Course',
    duration: '6 Months',
    fees: 5999,
    details:
        'Learn programming fundamentals and build a strong foundation for software development.',
    benefits: [
      'Programming Fundamentals',
      'Problem Solving',
      'Coding Practice',
      'Software Development Basics',
    ],
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
          'Our Courses',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: const Color(0xFFE1E7F0),
              ),
            ),
            child: InkWell(
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
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        _courseIcon(course.name),
                        color: primaryBlue,
                        size: 29,
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
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 7),

                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                size: 15,
                                color: Colors.black54,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                course.duration,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.currency_rupee,
                                size: 15,
                                color: Colors.black54,
                              ),
                              Text(
                                '${course.fees}',
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: primaryBlue,
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

  static IconData _courseIcon(String name) {
    if (name.contains('Tally')) {
      return Icons.account_balance_wallet_rounded;
    }

    if (name.contains('Excel')) {
      return Icons.table_chart_rounded;
    }

    if (name.contains('DTP')) {
      return Icons.design_services_rounded;
    }

    if (name.contains('Hardware')) {
      return Icons.memory_rounded;
    }

    if (name.contains('Programming')) {
      return Icons.code_rounded;
    }

    return Icons.computer_rounded;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Course Header

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    darkBlue,
                    primaryBlue,
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Icon(
                      _courseIcon(course.name),
                      color: primaryBlue,
                      size: 34,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      course.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Duration / Fees

            Row(
              children: [
                Expanded(
                  child: _infoBox(
                    Icons.access_time_rounded,
                    'Duration',
                    course.duration,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _infoBox(
                    Icons.currency_rupee_rounded,
                    'Fees',
                    '₹${course.fees}',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Course Overview',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              course.details,
              style: const TextStyle(
                fontSize: 15,
                height: 1.55,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Key Benefits',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 10),

            ...course.benefits.map(
              (benefit) => Container(
                margin: const EdgeInsets.only(bottom: 9),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: green,
                      size: 21,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        benefit,
                        style: const TextStyle(
                          fontSize: 15,
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
              height: 55,
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
                icon: const Icon(Icons.edit_note_rounded),
                label: const Text(
                  'ENQUIRY NOW',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoBox(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: const Color(0xFFE1E7F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: primaryBlue,
            size: 25,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  static IconData _courseIcon(String name) {
    if (name.contains('Tally')) {
      return Icons.account_balance_wallet_rounded;
    }

    if (name.contains('Excel')) {
      return Icons.table_chart_rounded;
    }

    if (name.contains('DTP')) {
      return Icons.design_services_rounded;
    }

    if (name.contains('Hardware')) {
      return Icons.memory_rounded;
    }

    if (name.contains('Programming')) {
      return Icons.code_rounded;
    }

    return Icons.computer_rounded;
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
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final messageController = TextEditingController();

  String? selectedCourse;

  @override
  void initState() {
    super.initState();
    selectedCourse = widget.selectedCourse;
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    messageController.dispose();
    super.dispose();
  }

  Future<void> sendEnquiry() async {
    if (nameController.text.trim().isEmpty ||
        mobileController.text.trim().isEmpty ||
        selectedCourse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please fill Name, Mobile Number and Course.',
          ),
        ),
      );
      return;
    }

    try {
      await openSms(
        studentName: nameController.text.trim(),
        mobile: mobileController.text.trim(),
        course: selectedCourse!,
        message: messageController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'SMS app opened. Please press Send.',
          ),
        ),
      );
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'SMS app could not be opened.',
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
          'Course Enquiry',
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Header

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.edit_note_rounded,
                    color: primaryBlue,
                    size: 35,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Send your course enquiry',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                hintText: 'Enter your name',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),

            const SizedBox(height: 14),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                hintText: 'Enter mobile number',
                prefixIcon: Icon(Icons.phone_outlined),
                counterText: '',
              ),
            ),

            const SizedBox(height: 14),

            DropdownButtonFormField<String>(
              initialValue: selectedCourse,
              decoration: const InputDecoration(
                labelText: 'Select Course',
                prefixIcon: Icon(Icons.school_outlined),
              ),
              items: courses
                  .map(
                    (course) => DropdownMenuItem<String>(
                      value: course.name,
                      child: Text(
                        course.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),

            const SizedBox(height: 14),

            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message / Query',
                hintText: 'Type your message or query...',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.chat_bubble_outline),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: sendEnquiry,
                icon: const Icon(Icons.send_rounded),
                label: const Text(
                  'SEND ENQUIRY',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Your phone Messages app will open with the enquiry prepared.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
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

            // Logo

            Container(
              width: 145,
              height: 145,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: const Color(0xFFE1E7F0),
                ),
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
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 7),

            const Text(
              tagline,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 25),

            // Call

            _contactButton(
              icon: Icons.call_rounded,
              title: 'Call Now',
              subtitle: contactNumber,
              color: green,
              onTap: () async {
                try {
                  await makeCall();
                } catch (_) {}
              },
            ),

            const SizedBox(height: 12),

            // SMS

            _contactButton(
              icon: Icons.sms_rounded,
              title: 'SMS Enquiry',
              subtitle: 'Open Messages App',
              color: primaryBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EnquiryScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // Location

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
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: orange,
                    size: 32,
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Location',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Mahuva, Gujarat',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _contactButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(17),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.18),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                icon,
                size: 27,
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ABOUT SCREEN
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
                    width: 125,
                    height: 125,
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

            const SizedBox(height: 22),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Shree Bileshwar Computer',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Shree Bileshwar Computer provides computer education '
              'and skill-based courses for students and learners. '
              'Our goal is to provide practical computer knowledge '
              'that helps students build their skills and career.',
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 22),

            _aboutFeature(
              Icons.school_rounded,
              'Professional Computer Education',
            ),

            _aboutFeature(
              Icons.computer_rounded,
              'Practical Computer Skills',
            ),

            _aboutFeature(
              Icons.menu_book_rounded,
              'Multiple Computer Courses',
            ),

            _aboutFeature(
              Icons.trending_up_rounded,
              'Skills for Future Growth',
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Text(
                '"Learn Today • Build Your Tomorrow"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkBlue,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _aboutFeature(
    IconData icon,
    String title,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE1E7F0),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: primaryBlue,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          const Icon(
            Icons.check_circle_rounded,
            color: green,
            size: 21,
          ),
        ],
      ),
    );
  }
}
