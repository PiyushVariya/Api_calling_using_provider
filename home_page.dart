
import 'package:api_provider/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Provides pro = Provides();

  @override
  void initState() {
    pro = Provider.of<Provides>(context, listen: false);
    pro.getProvider();
    // pro.customApiProvider;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Provides>(
        builder: (context, value, child) {
          return Center(
            child: ListView.builder(
              itemCount: value.customApiProvider.data?.results?.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${value.customApiProvider.data?.totalResults}'),
                  Text(
                      '$index  ${value.customApiProvider.data?.results?[index].title}'),
                Text('${value.customApiProvider.data?.results?[index].overview}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
