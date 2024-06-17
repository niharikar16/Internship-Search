import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> internship;

  DetailPage({required this.internship});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Internship Details',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
          centerTitle: false,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.internship['title'] ?? 'N/A',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.internship['company_name'] ?? 'N/A',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.internship['company_logo'] != null &&
                    widget.internship['company_logo'].isNotEmpty)
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(left: 16),
                    child: Image.network(
                      '${widget.internship['company_logo']}',
                      fit: BoxFit.contain,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Icon(Icons.error);
                      },
                    ),
                  ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey.shade600, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${widget.internship['location_names']?.join(', ') ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[900],
                    ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Icon(Icons.work, color: Colors.grey.shade600, size: 20),
                SizedBox(width: 8),
                Text(
                  '${widget.internship['work_from_home'] != false ? 'Work from' : 'On-site'}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Icon(Icons.play_circle, color: Colors.grey.shade600, size: 20),
                SizedBox(width: 8),
                Text(
                  '${widget.internship['start_date'] ?? 'N/A'}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[900],
                  ),
                ),
                SizedBox(width: 40),
                Icon(Icons.calendar_month_outlined,
                    color: Colors.grey.shade600, size: 20),
                SizedBox(width: 8),
                Text(
                  '${widget.internship['duration'] ?? 'N/A'}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Icon(Icons.monetization_on,
                    color: Colors.grey.shade600, size: 20),
                SizedBox(width: 8),
                Text(
                  '${widget.internship['stipend']?['salary'] ?? 'Unpaid'}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Icon(Icons.hourglass_bottom,
                    color: Colors.grey.shade600, size: 20),
                SizedBox(width: 8),
                Text(
                  '${widget.internship['expiring_in'] ?? 'N/A'}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[900],
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                    '${widget.internship['is_ppo'] ? 'Internship with job offer' : 'Internship'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Text(
                    '${widget.internship['part_time'] ? 'Part Time' : 'Full Time'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.timelapse,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${widget.internship['posted_on'] ?? 'N/A'}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[900],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 18),
            Divider(height: 1, color: Colors.grey.shade400),
            SizedBox(height: 18),
            Text(
              'About ${widget.internship['company_name']}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            // Placeholder for company details, replace with actual content
            Text(
              '${widget.internship['company_url'] ?? 'N/A'}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 12),
            // More company details can be added here
          ],
        ),
      ),
    );
  }
}
