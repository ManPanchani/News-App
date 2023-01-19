import 'package:flutter/material.dart';
import '../api_helpers/api_helpers.dart';
import '../api_models/api_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Breaking News",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 40,
                ),
                title: Text(
                  "WelCome..",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "Breaking News App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Sports News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("SportsPage");
                });
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                "Business News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("BusinessPage");
                });
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                "Entertainment News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("EntertainmentPage");
                });
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                "Health News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("healthPage");
                });
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                "Science News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("SciencePage");
                });
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              title: const Text(
                "Technology News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.of(context).pushNamed("TechnologyPage");
                });
              },
            ),
            const Divider(
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: FutureBuilder(
                future: NewsHelper.newsHelper.fetchAllNewsData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    News? data = snapshot.data;

                    return ListView.builder(
                      itemCount: data!.news.length,
                      itemBuilder: (context, i) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Container(
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
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).pushNamed(
                                    "${data.news[i]['url']}",
                                  );
                                });
                              },
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Text(
                                    "- ${data.news[i]['source']['name']}",
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
