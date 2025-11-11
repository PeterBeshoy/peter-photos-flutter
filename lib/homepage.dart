import 'package:e_commerce_test/details.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Map<String, String>> items = [
    {
      "image": "images/peter_1.jpg",
      "title": "Golden Hour Portrait",
      "subtitle": "Natural light photography at sunset",
    },
    {
      "image": "images/peter_2.jpg", 
      "title": "Urban Exploration",
      "subtitle": "Cityscapes and architecture",
    },
    {
      "image": "images/peter_3.jpg",
      "title": "Black & White Art", 
      "subtitle": "Monochromatic artistic shots",
    },
    {
      "image": "images/peter_4.jpg",
      "title": "Creative Composition",
      "subtitle": "Unique perspectives and angles",
    },
     {
      "image": "images/peter_5.jpg",
      "title": "Creative Composition",
      "subtitle": "Unique perspectives and angles",
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed BottomNavigationBar since it's not needed for portfolio
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_camera, color: Colors.orange),
            SizedBox(width: 8),
            Text("Peter ", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Photos", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black,
        child: ListView(
          children: [
            // Welcome Message
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Collections",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "A collection of my favorite shots",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            
            // Search Bar Only (removed menu icon)
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[900],
                  filled: true,
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  hintText: "Search photos...",
                  hintStyle: TextStyle(color: Colors.grey[500]),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            
            // Gallery Grid
            GridView.builder(
              itemCount: items.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 250,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ItemsDetails(data: items[i]),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              child: Image.asset(
                                items[i]['image']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[i]['title']!,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  items[i]['subtitle']!,
                                  style: TextStyle(
                                    fontSize: 11, 
                                    color: Colors.grey[400],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}