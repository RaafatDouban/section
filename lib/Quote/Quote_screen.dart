import 'package:flutter/material.dart';
import 'package:section_1/Quote/quote.dart';
import 'package:section_1/Quote/service.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  late Future<List<Quote>> future;
  @override
  void initState() {
    future = fetchQuote();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quote")),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background.jpg"),
          ),
        ),
        child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(snapshot.data![index].quote),
                          Text(snapshot.data![index].author),
                          Text(snapshot.data![index].category),
                        ],
                      ),
                    ),
              );
            } else if (snapshot.hasError) {
              return Icon(
                Icons.wifi_off_rounded,
                color: Colors.green.shade100,
                size: 200,
              );
            }
            return Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
