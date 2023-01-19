import 'package:flutter/material.dart';
import '../api_helpers/api_helpers.dart';
import '../api_models/api_models.dart';

class healthPage extends StatefulWidget {
  const healthPage({Key? key}) : super(key: key);

  @override
  State<healthPage> createState() => _healthPageState();
}

class _healthPageState extends State<healthPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Health News",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: NewsHelper.newsHelper.fetchAllHealthNewsData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    News? data = snapshot.data;

                    return ListView.builder(
                      itemCount: data!.healthNews.length,
                      itemBuilder: (context, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${data.news[i]['urlToImage']}",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              height: h * 0.4,
                              width: w,
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    "${data.news[i]['source']['name']}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "                            ${data.news[i]['publishedAt']}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Text(
                              "${data.news[i]['title']}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: h * 0.04,
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
