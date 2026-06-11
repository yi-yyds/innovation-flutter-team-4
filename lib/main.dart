import 'package:flutter/material.dart';

void main() {
  runApp(const InnovationHelloApp());
}

class InnovationHelloApp extends StatelessWidget {
  const InnovationHelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 【修改1】自定义应用标题
      title: '赵杰的Flutter实验',
      debugShowCheckedModeBanner: false, // 去掉右上角的 debug 小红条
      theme: ThemeData(
        // 【修改2】自定义主题色：赛博极客的深靛青色
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: const HelloHomePage(),
    );
  }
}

class HelloHomePage extends StatefulWidget {
  const HelloHomePage({super.key});

  @override
  State<HelloHomePage> createState() => HelloHomePageState();
}

class HelloHomePageState extends State<HelloHomePage> {
  int completedTasks = 0; 

  void finishOneTask() {
    // 核心逻辑：通知页面刷新数字
    setState(() {
      completedTasks += 1; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 【修改3】自定义顶部导航栏文字
        title: const Text('赵杰的创新实验 Flutter 首页'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 【修改4】增加炫酷的火箭发射图标
              const Icon(Icons.rocket_launch, size: 80, color: Colors.indigo),
              const SizedBox(height: 24),
              // 【修改5】修改页面欢迎语
              const Text(
                'Hello Flutter! 我已成功打通本地开发环境！',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // 【修改6】增加个人专属信息（姓名、学号尾号、专业）
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '姓名：赵杰 | 学号末位：0331\n专业：智能科学与技术 (2023级)',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              const SizedBox(height: 40),
              // 【修改7】修改计数器的业务含义
              Text(
                '今日代码测试运行次数：$completedTasks 次',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.indigo),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: finishOneTask,
        icon: const Icon(Icons.check_circle),
        label: const Text('完成一次代码打卡'), // 【修改8】修改按钮文案
      ),
    );
  }
}