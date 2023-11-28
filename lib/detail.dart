import 'package:flutter/material.dart';
import 'package:project/content.dart';
import 'package:provider/provider.dart';
import 'finished_provider.dart';

class DetailScreen extends StatelessWidget {
  final Content content;

  const DetailScreen({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = FinishedProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 36),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 300, // Adjust the height as desired
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  content.image,
                ),
              ),
            ),
          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        content.title.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => provider.toggleFinished(content),
                      child: Icon(
                        provider.isExist(content)
                            ? Icons.check_circle
                            : Icons.check_circle_outlined,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  content.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}