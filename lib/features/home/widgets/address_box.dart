import 'package:amazon_clone/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233)
          ],
          stops: [0.5, 1.0],
        ),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'delevaery to ${user.name} - ${user.address}',
                style: TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(
            left: 5,
            top: 2,
            
          ),
          child: Icon(Icons.arrow_drop_down,size: 18,),
          )
        ],
      ),
    );
  }
}
