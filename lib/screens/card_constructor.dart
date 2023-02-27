import 'package:card_giver/types/divider_element.dart';
import 'package:card_giver/types/link_element.dart';
import 'package:card_giver/types/main_element.dart';
import 'package:card_giver/types/text_element.dart';
import 'package:card_giver/utils/edit_element_state.dart';
import 'package:card_giver/widgets/card_element.dart';
import 'package:card_giver/widgets/card_element_wrapper.dart';
import 'package:card_giver/widgets/dialogs/add_element.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:card_giver/providers/element_view.dart';

class CardConstructor extends StatefulWidget {
  const CardConstructor({Key? key}) : super(key: key);

  @override
  State<CardConstructor> createState() => _CardConstructorState();
}

class _CardConstructorState extends State<CardConstructor> {
  int _selectedIndex = 0;
  List<CardElement> elements = [];
  late ElementsView provider;

  @override
  void initState() {
    super.initState();

    elements = [
      CardElement(
        type: ElementType.main,
        state: MainElementState(name: 'Имя', about: 'О себе'),
      ),
      CardElement(
        type: ElementType.text,
        state: TextElementState(text: ''),
      ),
      CardElement(
        type: ElementType.divider,
        state: DividerElementState(),
      ),
      CardElement(
        type: ElementType.link,
        state: LinkElementState(
            link:
                'https://www.youtube.com/watch?v=YBRkVCRP1Gw&ab_channel=Flutter'),
      ),
    ];
    provider = Provider.of<ElementsView>(context, listen: false);
  }

  onReorder(oldIndex, newIndex) {
    setState(
      () {
        if (newIndex > oldIndex) {
          newIndex = newIndex - 1;
        }
        final element = elements.removeAt(oldIndex);
        elements.insert(newIndex, element);
      },
    );
  }

  Future<void> _onItemTapped(int index) async {
    switch (index) {
      case 0:
        //TODO add settings
        break;
      case 1:
        CardElement? newItem = await AddElementDialog().showDialog(context);
        if (newItem != null) {
          elements.add(newItem);
        }
        break;
      case 2:
        provider.toggleType();
        break;
    }
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  editElement(index) async {
    CardElement element = elements[index];
    var newState = await editElementState(
      context: context,
      type: element.type,
      state: element.state,
    );

    if (newState != null) {
      setState(() {
        elements[index].state = newState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ElementsView>(context);
    ViewTypes type = provider.type;

    _buildElementsList() => ReorderableListView.builder(
          itemCount: elements.length,
          itemBuilder: (context, index) {
            return CardElementWrapper(
              key: ValueKey(elements[index]),
              element: elements[index],
              deleteElement: () {
                setState(() {
                  elements.removeAt(index);
                });
              },
              startEdit: () {
                editElement(index);
              },
            );
          },
          onReorder: onReorder,
          buildDefaultDragHandles: type == ViewTypes.edit,
        );

    BottomNavigationBarItem buildPreviewButton() {
      return BottomNavigationBarItem(
        icon: provider.type == ViewTypes.edit
            ? const Icon(Icons.visibility_outlined)
            : const Icon(Icons.visibility_off_outlined),
        label: 'Preview',
      );
    }

    return SafeArea(
      child: Scaffold(
        body: _buildElementsList(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add new element',
            ),
            buildPreviewButton(),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
