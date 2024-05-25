import 'package:amazon_clone/constants/globel_variables.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  static const String routeName = '/actual-home';

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;




  void onItemTap(int index){

    setState(() {

      _page = index;
      
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
        ),
        child: BottomNavigationBar(
          currentIndex: _page,
          onTap: onItemTap,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          useLegacyColorScheme: false,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          items: [
            //HOME
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: bottomBarBorderWidth,
                        color: _page == 0
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor),
                  ),
                ),
                child: const Icon(Icons.home_outlined),
              ),
            ),
        
            //ACCOUNT
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: bottomBarBorderWidth,
                        color: _page == 1
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor),
                  ),
                ),
                child: const Icon(Icons.person_outline),
              ),
            ),
        
        
            //SHOPPING CART
        
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: bottomBarBorderWidth,
                        color: _page == 2
                            ? GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backgroundColor),
                  ),
                ),
                child: const Badge(
                    textColor: Colors.white,
                    label: Text('4'),
                    child: Icon(Icons.shopping_cart_outlined)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
