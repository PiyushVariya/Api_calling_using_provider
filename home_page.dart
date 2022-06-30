import 'package:flutter/material.dart';
import 'package:pagination/provider.dart';
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
          if (value.customApiProvider.statusCode != 200) {
            return circulerProgress();
          } else if (value.customApiProvider.data == null) {
            return circulerProgress();
          } else if (value.customApiProvider.data!.results!.isEmpty) {
            return circulerProgress();
          } else {
            return Center(
              child: ListView.builder(
                itemCount: value.customApiProvider.data?.results?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text('${value.customApiProvider.data?.page}'),
                    title: Text(
                        '${value.customApiProvider.data?.results?[index].title}'),
                    subtitle: Text(
                        '${value.customApiProvider.data?.results?[index].backdeopPath}'),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Center circulerProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

