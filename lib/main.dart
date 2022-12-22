import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providerfile.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Refresher()),
    ],
    child: MaterialApp(home: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Quote = Provider.of<Refresher>(context).Quote;
    //String Author = Provider.of<Refresher>(context).Author;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Refresh Indicator"),
      ),
      body: RefreshIndicator(
        edgeOffset: 0.1,
        backgroundColor: Colors.black,
        color: Colors.white,
        onRefresh: () async {
          Provider.of<Refresher>(context, listen: false).updater();
        },
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(Provider.of<Refresher>(context, listen: false).Quote),
                SizedBox(height: 20),
                Text("-${Provider.of<Refresher>(context, listen: false).Author}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
