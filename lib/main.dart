import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _tic = <String>['', '', '', '', '', '', '', '', ''];
  TextStyle text = const TextStyle(
    fontSize: 20.0,
    color: Colors.black,
    fontWeight: FontWeight.w800,
  );
  Color p1 = Colors.yellow;
  Color p2 = Colors.green;
  bool _player1 = true;
  bool isPressed = false;
  int _fill = 0;
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        _tic[i] = '';
      }
      p1 = Colors.yellow;
      p2 = Colors.green;
    });
    isPressed = false;
    _fill = 0;
  }

  void _tapped(int index) {
    setState(() {
      if (_player1 && _tic[index] == '') {
        _tic[index] = 'o';
        _fill += 1;
      } else if (!_player1 && _tic[index] == '') {
        _tic[index] = 'x';
        _fill += 1;
      }
      _player1 = !_player1;
      _verify();
    });
  }

  void _verify() {
    if (_tic[0] == _tic[1] && _tic[0] == _tic[2] && _tic[0] != '') {
      isPressed = true;
      setState(() {
        if (_tic[0] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_tic[3] == _tic[4] && _tic[3] == _tic[5] && _tic[3] != '') {
      isPressed = true;
      setState(() {
        if (_tic[3] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_tic[6] == _tic[7] && _tic[6] == _tic[8] && _tic[6] != '') {
      isPressed = true;
      setState(() {
        if (_tic[6] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_tic[0] == _tic[3] && _tic[0] == _tic[6] && _tic[0] != '') {
      isPressed = true;
      setState(() {
        if (_tic[0] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_tic[1] == _tic[4] && _tic[1] == _tic[7] && _tic[1] != '') {
      isPressed = true;
      setState(() {
        if (_tic[1] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_tic[2] == _tic[5] && _tic[2] == _tic[8] && _tic[2] != '') {
      isPressed = true;
      setState(() {
        if (_tic[2] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_tic[0] == _tic[4] && _tic[0] == _tic[8] && _tic[0] != '') {
      isPressed = true;
      setState(() {
        if (_tic[0] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_tic[2] == _tic[4] && _tic[2] == _tic[6] && _tic[2] != '') {
      isPressed = true;
      setState(() {
        if (_tic[2] == 'x') {
          p2 = Colors.black;
        } else {
          p1 = Colors.black;
        }
      });
    }
    if (_fill == 9) {
      isPressed = true;
      setState(() {
        p1 = Colors.black;
        p2 = Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Tic Tac Toe',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _table(),
          if (isPressed)
            ElevatedButton(
              onPressed: _clearBoard,
              child: const Text('Main Lagi..'),
            ),
        ],
      ),
    );
  }

  Expanded _table() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _tapped(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: Colors.yellow),
                  color: _tic[index] == ''
                      ? Colors.black
                      : _tic[index] == 'x'
                          ? p1
                          : p2,
                ),
                child: const Center(
                  child: Text(''),
                ),
              ),
            );
          }),
    );
  }
}
