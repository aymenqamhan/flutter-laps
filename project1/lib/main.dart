import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // لازاله العلامهاالحكمراء من الزاويه العلوية
      title: 'first assiment',
      // جعلنا الثيم الأساسي بني ليتناسب مع الألوان التي اخترتها
      theme: ThemeData(primarySwatch: Colors.brown),
      home: const MyHomePage(title: 'First Assigment'), // تم تعديل العنوان
    );
  }
}

// (هذا الكود كما هو - لم يتغير)
class MyStaticCard extends StatelessWidget {
  final String title;
  const MyStaticCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // إضافة ظل خفيف
      child: Container(
        width: double.infinity, // لجعل الكارد يمتد بعرض الشاشة
        padding: const EdgeInsets.all(16.0),
        child: Center(child: Text(title, style: const TextStyle(fontSize: 18))),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown, title: Text(widget.title)),

      // -- التعديل: إضافة Padding حول الجسم كاملاً --
      body: Padding(
        padding: const EdgeInsets.all(20.0), // مسافة 20 من كل الجهات
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Click down to add student:',
                // إضافة تنسيق بسيط للخط
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),

              // -- التعديل: استخدام SizedBox للمسافات --
              const SizedBox(height: 10),

              const Icon(
                Icons.school,
                size: 50.0,
                color: Color.fromARGB(255, 22, 37, 49),
              ),

              const SizedBox(height: 25), // زيادة المسافة

              Text(
                'Hi students: $_counter', // تعديل بسيط للنص
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 20), // مسافة
              // -- التعديل: استخدام الكارد الذي قمت بإنشائه --
              const MyStaticCard(title: "Flutter First Lab"),

              const SizedBox(height: 20), // مسافة

              Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/icon_flutter.0dbfcc7a59cd1cf16282.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),

              // تأكد أن هذا المسار موجود في pubspec.yaml
              Image.asset(
                'image/image1.png',
                gaplessPlayback: true,
                width: 280,
                height: 300,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.brown,
        child: const Icon(Icons.add),
      ),
    );
  }
}
