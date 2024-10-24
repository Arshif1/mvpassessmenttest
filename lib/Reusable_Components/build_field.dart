import 'package:flutter/material.dart';

 Widget CustomFieldcontainer(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      // padding: EdgeInsets.symmetric(,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    )
    );
  }



Widget customFieldContainerWithDivider(String title1, String value1, String title2, String value2) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title1, style: TextStyle(fontSize: 16)),
           Divider(height: 1, color: Colors.grey),
          Text(value1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
        
        
      ),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title2, style: TextStyle(fontSize: 16)),
            Divider(height: 1, color: Colors.grey),
          Text(value2, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
        
        
      ),
        ]
    )
      ),
    );
}



Widget customFieldContainerWithMultipleRows({
  required List<Map<String, dynamic>> data, // Accepts dynamic to allow TextStyle
  EdgeInsetsGeometry padding = const EdgeInsets.all(10),
  double borderRadius = 8.0,
  Color borderColor = Colors.grey,
  Color backgroundColor = Colors.white,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        children: data.map((item) {
          // Extracting styles and text from the item map
          String title = item['title'] ?? '';
          String value = item['value'] ?? '';
          TextStyle? titleStyle = item['titleStyle'] ?? const TextStyle(fontSize: 16);
          TextStyle? valueStyle = item['valueStyle'] ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: titleStyle),
                const Divider(height: 1, color: Colors.grey), // Optional divider
                Text(value, style: valueStyle),
              ],
            ),
          );
        }).toList(),
      ),
    ),
  );
}






List<Map<String, String>> sampleData = [
  {'title': 'Name', 'value': 'John Doe'},
  {'title': 'Age', 'value': '29'},
  {'title': 'Country', 'value': 'USA'},
];
