import 'package:flutter/material.dart';
import 'package:internship_search/AppBar/Menu/header_icons.dart';
import 'package:internship_search/AppBar/Menu/explore_items.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.only(top: 40),
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Niharika Rathore',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 10,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            '4.3',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  'rathoreniharika16@gmail.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconWithLabel(
                      icon: Icons.equalizer,
                      label: 'Preference',
                      onPressed: () {},
                    ),
                    IconWithLabel(
                      icon: Icons.assignment,
                      label: 'Resume',
                      onPressed: () {},
                    ),
                    IconWithLabel(
                      icon: Icons.file_copy,
                      label: 'Applications',
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'EXPLORE',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 18,
                ),
                ExploreItems(icon: Icons.telegram_outlined, title: 'Intership'),
                SizedBox(
                  height: 22,
                ),
                ExploreItems(icon: Icons.work_outline, title: 'Jobs'),
                SizedBox(
                  height: 22,
                ),
                ExploreItems(icon: Icons.monitor, title: 'Courses'),
                SizedBox(
                  height: 22,
                ),
                ExploreItems(
                    icon: Icons.shopping_bag_outlined,
                    title: 'Placement Guarantee Courses'),
                SizedBox(
                  height: 22,
                ),
                ExploreItems(icon: Icons.school_outlined, title: 'Intership'),
                SizedBox(
                  height: 22,
                ),
                Text(
                  'HELP & SUPPORT',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 22,
                ),
                ExploreItems(icon: Icons.help_outline, title: 'Help Center'),
                SizedBox(
                  height: 22,
                ),
                ExploreItems(
                    icon: Icons.report_gmailerrorred_sharp,
                    title: 'Report a Complaint'),
                SizedBox(
                  height: 22,
                ),
                ExploreItems(icon: Icons.add_circle_outline, title: 'More'),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
