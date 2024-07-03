import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:amazon_clone/features/account/widget/account_buttons.dart';
import 'package:amazon_clone/features/account/widget/below_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/orders.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leadingWidth: 120,
          leading: Image.asset(
            'asset/images/amazon_in.png',
            width: 120,
            height: 45,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
        ),
      ),
      
      body: Column(
        children: [
          const BelowAppBar(),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3.5,
                children: [
                  AccountButtons(
                    onTab: () {},
                    text: 'Your order',
                  ),
                  AccountButtons(
                    onTab: () {},
                    text: 'Turn Seller',
                  ),
                  AccountButtons(
                    onTab: () {},
                    text: 'Log out',
                  ),
                  AccountButtons(
                    onTab: () {},
                    text: 'Your wish list',
                  ),
                ],
              ),
            ),
          ),
          const Expanded(flex: 3, child: Orders())
        ],
      ),
    );
  }
}
