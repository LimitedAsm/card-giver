import 'dart:io';

import 'package:card_giver/types/main_element.dart';
import 'package:card_giver/ui_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainElement extends StatelessWidget {
  const MainElement({
    Key? key,
    required this.state,
  }) : super(key: key);
  final MainElementState state;

  Widget _buildName() {
    return Text(
      state.name,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildAbout() {
    return Text(
      state.about,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildAvatar() {
    ImageProvider? avatarProvider;
    if (state.avatar != null) {
      XFile avatar = state.avatar as XFile;
      if (kIsWeb) {
        avatarProvider = NetworkImage(avatar.path);
      } else {
        avatarProvider = FileImage(File(avatar.path));
      }
    }

    return CircleAvatar(
      radius: 40,
      backgroundImage: avatarProvider,
      backgroundColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.bottomEnd,
            child: Card(
              color: elementCardColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListTile(
                  title: _buildName(),
                  subtitle: _buildAbout(),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: _buildAvatar(),
          ),
        ],
      ),
    );
  }
}
