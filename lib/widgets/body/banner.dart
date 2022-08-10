import 'package:flutter/material.dart';

class Banners extends StatelessWidget {
  const Banners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/green_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "ভিন্ন চিন্তার ৫ বছর",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "দেশের প্রথম ও সর্ববৃহৎ অল্টারনেটিভ মিডিয়া রোর বাংলার ৫ বছর পূর্তিতে শুভেচ্ছা",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: TextButton(
                child: Text(
                  'ঘুরে আসুন রোর লাইব্রেরি থেকে',
                  style: TextStyle(fontSize: 12),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(12)),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.white)
                        )
                    )
                ),
                onPressed: () => null
            ),
          ),
        ],
      ),
    );
  }
}
