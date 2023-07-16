import 'package:flutter/material.dart' ;

void main(){
  runApp(const MyApp());
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
        '/': (context) => HomePage(),
        '/Sign In': (context) => const SignIn(),
        '/Shop': (context) => const Shop(),
        '/Get Information': (context) => const MoreInfo(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
//    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
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
                    MaterialPageRoute(builder:(context) => const Shop()),
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
                    MaterialPageRoute(builder:(context) => const MoreInfo()),
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

class Shop extends StatelessWidget {
  const Shop({super.key});

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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter a Title',
                ),
              ),
              const Text('Description'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter a Description',
                ),
              ),
              const Text('Start Time'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter a starting time for the task',
                ),
              ),
              const Text('End Time'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter an ending time for the task',
                ),
              ),
              const Text('Location'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter a location for the task',
                ),
              ),
//              ElevatedButton(
//                onPressed: () {},
//                child: const Text ('Create your Task!'),
//              ),
              ElevatedButton(
                onPressed: () {
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

class MoreInfo extends StatelessWidget {
  const MoreInfo({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  'Lorum Ipsum'),
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