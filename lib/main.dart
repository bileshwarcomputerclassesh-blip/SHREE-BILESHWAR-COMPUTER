import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const BileshwarComputerApp());
}

class BileshwarComputerApp extends StatelessWidget {
  const BileshwarComputerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shree Bileshwar Computer',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const SplashScreen(),
    );
  }
}

// ================= CONSTANTS =================

const String instituteName = 'SHREE BILESHWAR COMPUTER';
const String tagline = 'Learn Today • Build Your Tomorrow';
const String contactNumber = '9558373839';

// ================= SMS FUNCTION =================

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

// ================= CALL FUNCTION =================

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

// ================= SPLASH =================

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
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      }
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
              Color(0xFF283593),
              Color(0xFF5C6BC0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
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

            const SizedBox(height: 25),

            const Text(
              instituteName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              tagline,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HOME =================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(instituteName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF283593),
                    Color(0xFF5C6BC0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 110,
                    height: 110,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
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
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    tagline,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            _homeButton(
              context,
              Icons.school,
              'View Courses',
              const CoursesScreen(),
            ),

            _homeButton(
              context,
              Icons.message,
              'Enquire Now',
              const EnquiryScreen(),
            ),

            _homeButton(
              context,
              Icons.phone,
              'Contact Us',
              const ContactScreen(),
            ),

            _homeButton(
              context,
              Icons.info,
              'About Us',
              const AboutScreen(),
            ),

            const SizedBox(height: 25),

            const Text(
              'Popular Courses',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            ...courses.take(3).map(
              (course) => Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.computer),
                  ),
                  title: Text(course.name),
                  subtitle: Text(
                    '${course.duration} • ₹${course.fees}',
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _homeButton(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 5,
        ),
        leading: Icon(
          icon,
          size: 30,
          color: Colors.indigo,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => page,
            ),
          );
        },
      ),
    );
  }
}

// ================= COURSE MODEL =================

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

// ================= COURSES =================

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Courses'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: const CircleAvatar(
                radius: 27,
                child: Icon(Icons.school),
              ),
              title: Text(
                course.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  '${course.duration} • ₹${course.fees}',
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
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
            ),
          );
        },
      ),
    );
  }
}

// ================= COURSE DETAILS =================

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
        title: const Text('Course Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            _infoCard(
              Icons.access_time,
              'Duration',
              course.duration,
            ),

            _infoCard(
              Icons.currency_rupee,
              'Course Fees',
              '₹${course.fees}',
            ),

            const SizedBox(height: 15),

            const Text(
              'Course Details',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              course.details,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Benefits',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            ...course.benefits.map(
              (benefit) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        benefit,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.message),
                label: const Text(
                  'ENQUIRY NOW',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.indigo,
        ),
        title: Text(title),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// ================= ENQUIRY =================

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
    } catch (e) {
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
        title: const Text('Course Enquiry'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            DropdownButtonFormField<String>(
              value: selectedCourse,
              decoration: const InputDecoration(
                labelText: 'Select Course',
                prefixIcon: Icon(Icons.school),
                border: OutlineInputBorder(),
              ),
              items: courses
                  .map(
                    (course) => DropdownMenuItem(
                      value: course.name,
                      child: Text(course.name),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCourse = value;
                });
              },
            ),

            const SizedBox(height: 15),

            TextField(
              controller: messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message / Query',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.edit),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text(
                  'SEND ENQUIRY',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: sendEnquiry,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= CONTACT =================

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Colors.indigo,
                  width: 2,
                ),
              ),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              instituteName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Call Us'),
                subtitle: const Text(contactNumber),
                trailing: const Icon(Icons.call),
                onTap: () async {
                  try {
                    await makeCall();
                  } catch (_) {}
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.message),
                title: const Text('SMS Enquiry'),
                subtitle: const Text(contactNumber),
                trailing: const Icon(Icons.sms),
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

            Card(
              child: const ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Location'),
                subtitle: Text('Mahuva, Gujarat'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= ABOUT =================

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.indigo,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                instituteName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                tagline,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'About Shree Bileshwar Computer',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Shree Bileshwar Computer provides computer education '
              'and skill-based courses for students and learners. '
              'Our goal is to provide practical computer knowledge '
              'that helps students build their skills and career.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Courses include CCC, Basic Computer, Tally Prime, '
              'Advanced Excel, DTP, Computer Hardware and Programming.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
