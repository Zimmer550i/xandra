import 'package:flutter/material.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:xandra/views/base/custom_tabs.dart';
import 'package:xandra/views/base/look_card.dart';
import 'package:xandra/views/base/product_card.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  String tab = "Looks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Saved Looks & Products"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            CustomTabs(
              options: ['Looks', "Products"],
              selected: tab,
              onChanged: (val) {
                setState(() {
                  tab = val;
                });
              },
            ),
            const SizedBox(height: 4),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: 20,
                  bottom: MediaQuery.of(context).viewPadding.bottom + 4,
                ),
                itemCount: 20,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) => tab == "Looks"
                    ? LookCard()
                    : ProductCard(cardType: CardType.saved),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
