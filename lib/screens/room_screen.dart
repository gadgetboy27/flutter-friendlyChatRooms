import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendlychat/widgets/widgets.dart';
import '../data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    Key? key, 
    required this.room,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        leadingWidth: 120.0,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: ()=> Navigator.of(context).pop(),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text(
            'All rooms'
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
           icon: const Icon(CupertinoIcons.doc, size: 20.0),
           ),
           GestureDetector(
             onTap: (){},
             child: Padding(
               padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
               child:
                  UserProfileImage(imageUrl: initialUser.imageUrl,size: 36.0),
              ),
           )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0), 
        ),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                  '${room.club} 🏠'.toUpperCase(),
                    style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0
                      ),
                    ),
                 GestureDetector(
                   onTap: (){},
                   child: const Icon(
                    CupertinoIcons.ellipsis),
                 ),
                ],
               ),
               Text(room.name, style: Theme.of(context).textTheme.bodyText1!.copyWith(
                 fontSize: 16.0,
                 fontWeight: FontWeight.bold,
                 letterSpacing: 1.0,
                ),
               )
              ],
             ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20.0,
                crossAxisCount: 3,
                children: room.speakers
                .map(
                  (e)=> RoomUserProfile(
                    imageUrl: e.imageUrl,
                    size: 66.0,
                    name: e.givenName,
                    isNew: Random().nextBool(),
                    isMuted: Random().nextBool(),
                    ),
                )
                .toList(),
              ),
            ),
          ],
        ),
      ), 
    );
  }
}
