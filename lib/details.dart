import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget {
  final Map<String, String> data;
  const ItemsDetails({super.key, required this.data});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Photo Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // Add share functionality later
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Main Image
          Container(
            height: 400,
            width: double.infinity,
            child: Image.asset(
              widget.data['image']!,
              fit: BoxFit.cover,
            ),
          ),
          
          // Photo Info
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.data['subtitle']!,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.grey[800]),
                SizedBox(height: 15),
                
                // Photo Details
                Row(
                  children: [
                    DetailItem(icon: Icons.photo_size_select_actual, text: "High Resolution"),
                    SizedBox(width: 20),
                    DetailItem(icon: Icons.color_lens_sharp, text: "Color Graded"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    DetailItem(icon: Icons.star, text: "Premium Quality"),
                    SizedBox(width: 20),
                    DetailItem(icon: Icons.download, text: "Available for Download"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      
      // Download Button
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black,
        child: ElevatedButton(
          onPressed: () {
            // Add download functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          child: Text(
            "Download Photo",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String text;
  
  const DetailItem({super.key, required this.icon, required this.text});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 20),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: Colors.grey[400]),
        ),
      ],
    );
  }
}