import 'package:flutter/material.dart' ;
import 'package:project/secrets.dart';
import 'package:dart_openai/dart_openai.dart';

void main(){
  runApp(const MyApp());
  OpenAI.apiKey = openAiApiKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeCEO',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/Sign In': (context) => const SignIn(),
        '/Shop': (context) => CreateTask(),
        '/Get Information': (context) => const ManageTasks(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeCEO'),
      ), //AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Positioned(
                  top: 5,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: const Image(
                      image: AssetImage('img/Helpful.jpg'),
                      width: 70,
                      height:70,
                    ),
                  ),
                ),
                Positioned(
                  top:20,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 26),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: const Image(
                image: AssetImage('img/task.png'),
                width: 300,
                height: 150,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.redAccent,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => const SignIn()),
                  );
                },
                child: const Text(
                    style: TextStyle(color: Colors.white),
                    'Sign in'
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              color: Colors.blueAccent,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => CreateTask()),
                  );
                },
                child: const Text(
                    style: TextStyle(color: Colors.white),
                    'Create Task'
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40.0),
              color: Colors.purple,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => const ManageTasks()),
                  );
                },
                child: const Text(
                    style: TextStyle(color: Colors.white),
                    'Manage Tasks'
                ),
              ),
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        backgroundColor: Colors.red[600],
//        child: const Text('Done!'),
//        onPressed: () {},
//      ),
    );
  }

}

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Username'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your Username',
                ),
              ),
              const Text('Password'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your Password',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text ('Sign In'),
              ),
            ],
          )
      ),
    );
  }
}

class CreateTask extends StatelessWidget {
  CreateTask({super.key});

  final myController = TextEditingController();
  String s = '';
  Future<void> chat_message(String m) async{
    OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: m,
          role: OpenAIChatMessageRole.user,
        ),
      ],
    );
  }
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
//    super.dispose();
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make a task'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              const Text('Title'),
              TextField(
                controller: myController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'Enter a Title',
                ),
              ),
              const Text('Description'),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Enter a Description',
                ),
              ),
              const Text('Start Time'),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Enter a starting time for the task',
                ),
              ),
              const Text('End Time'),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Enter an ending time for the task',
                ),
              ),
              const Text('Location'),
              TextField(
                controller: myController,
                decoration: InputDecoration(
                  labelText: 'Enter a location for the task',
                ),
              ),


              ElevatedButton(
                onPressed: () {
                  s += myController.text;
                  chat_message(s);
                  Navigator.pop(context);
                },
                child: const Text ('Create your Task!'),
              ),
            ],
          )
      ),
    );
  }
}

class ManageTasks extends StatelessWidget {
  const ManageTasks({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Your Tasks!'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  ''),
              Positioned(
                bottom: 5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text ('Go Back'),
                ),
              )
            ],
          )
      ),
    );
  }
}