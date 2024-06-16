import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:
            Colors.white, // Set your primary color (white in this case)
        scaffoldBackgroundColor: Colors.white, // Set scaffold background color
        appBarTheme: AppBarTheme(
          backgroundColor:
              Colors.white, // Ensure app bar background color is white
          elevation: 0, // Remove app bar shadow
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use your custom AppBar
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(
          title: Text('Item $index'),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Internships',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: false,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {
            // Handle search button press
          },
        ),
        IconButton(
          icon: Icon(Icons.bookmark_outline, color: Colors.black),
          onPressed: () {
            // Handle bookmark button press
          },
        ),
        IconButton(
          icon: Icon(Icons.message_outlined, color: Colors.black),
          onPressed: () {
            // Handle message button press
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.blue),
            ),
            onPressed: () {
              // Handle filter button press
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Text(
                  'Filters',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 80.0);
}
