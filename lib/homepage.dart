import 'package:fludget/Models/widgetModel.dart';
import 'package:fludget/flexible.dart';
import 'package:fludget/routes/AnimatedBuilderWidget.dart';
import 'package:fludget/routes/Card.dart';
import 'package:fludget/routes/DataTable.dart';
import 'package:fludget/routes/Root/rootScreen.dart';
import 'package:fludget/routes/button.dart';
import 'package:fludget/routes/checkboxListTile.dart';
import 'package:fludget/routes/circularProgressIndicator.dart';
import 'package:fludget/routes/column.dart';
import 'package:fludget/routes/container.dart';
import 'package:fludget/routes/dialogBox.dart';
import 'package:fludget/routes/dismissible_widget.dart';
import 'package:fludget/routes/draggableWidget.dart';
import 'package:fludget/routes/draggable_scrollable_sheet.dart';
import 'package:fludget/routes/dropDownButton.dart';
import 'package:fludget/routes/expanded.dart';
import 'package:fludget/routes/gridList.dart';
import 'package:fludget/routes/hero.dart';
import 'package:fludget/routes/icon.dart';
import 'package:fludget/routes/image.dart';
import 'package:fludget/routes/indexedStack.dart';
import 'package:fludget/routes/linearProgressIndicator.dart';
import 'package:fludget/routes/listtile.dart';
import 'package:fludget/routes/opacity.dart';
import 'package:fludget/routes/pageview.dart';
import 'package:fludget/routes/reorderableListView.dart';
import 'package:fludget/routes/richText.dart';
import 'package:fludget/routes/row.dart';
import 'package:fludget/routes/settings.dart';
import 'package:fludget/routes/slider.dart';
import 'package:fludget/routes/snackbar.dart';
import 'package:fludget/routes/stack.dart';
import 'package:fludget/routes/switch.dart';
import 'package:fludget/routes/table.dart';
import 'package:fludget/routes/text.dart';
import 'package:fludget/routes/textfield.dart';
import 'package:fludget/routes/transform.dart';
import 'package:fludget/routes/togglebutton.dart';
import 'package:fludget/routes/wrap.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool searching = false;
  String searchString = '';

  AppBar showSearchBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: TextField(
        keyboardType: TextInputType.text,
        cursorColor: Colors.white,
        autofocus: true,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              setState(() {
                searching = false;
                searchString = '';
              });
            },
          ),
          hintText: 'Search....',
          border: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        style: TextStyle(
          color: Colors.white,
          decorationColor: Colors.white,
        ),
        onSubmitted: (String text) {
          setState(() {
            searchString = text;
          });
        },
        onChanged: (String text) {
          setState(() {
            searchString = text;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searching
          ? showSearchBar()
          : AppBar(
              backgroundColor: Colors.orange[900],
              title: Text("Widget Catalog"),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      searching = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                )
              ],
              centerTitle: true,
            ),
      backgroundColor: Colors.grey[900],
      drawer: SettingsWidget(),
      body: getWidgetList(searchString),
    );
  }

  ListView getWidgetList(String filter) {
    const List<WidgetModel> widgets = [
      WidgetModel(
        name: "Container",
        implementation: ContainerImplementation(),
        description: ContainerDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Container-class.html",
      ),
      WidgetModel(
        name: "Column",
        implementation: ColumnImplementation(),
        description: ColumnDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Column-class.html",
      ),
      WidgetModel(
        name: "Row",
        implementation: RowImplementation(),
        description: RowDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Row-class.html",
      ),
      WidgetModel(
        name: "Stack",
        implementation: StackImplementation(),
        description: StackDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Stack-class.html",
      ),
      WidgetModel(
        name: "Text",
        implementation: TextImplementation(),
        description: TextDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Text-class.html",
      ),
      WidgetModel(
        name: "Icon",
        implementation: IconImplementation(),
        description: IconDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Icon-class.html",
      ),
      WidgetModel(
        name: "Image",
        subtitle: "Asset Image, Network Image, File Image and Memory Image",
        implementation: ImageImplementation(),
        description: ImageDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Image-class.html",
      ),
      WidgetModel(
        name: "Button",
        subtitle:
            "Outlined Button, Elevated Button, Text Button, Floating Action Button",
        implementation: ButtonImplementation(),
        description: ButtonDescription(),
        link:
            "https://api.flutter.dev/flutter/material/ElevatedButton-class.html",
      ),
      WidgetModel(
        name: "Toggle Button",
        implementation: ToggleButtonImplementation(),
        description: ToggleButtonDescription(),
        link:
            "https://api.flutter.dev/flutter/material/ToggleButtons-class.html",
      ),
      WidgetModel(
        name: "DialogBox",
        subtitle: "shows Dialog",
        implementation: DialogBoxImplementation(),
        description: DialogBoxDescription(),
        link: "https://api.flutter.dev/flutter/material/AlertDialog-class.html",
      ),
      WidgetModel(
        name: "GridList",
        implementation: GridListImplementation(),
        description: GridListDescription(),
        link: "https://api.flutter.dev/flutter/widgets/GridView-class.html",
      ),
      WidgetModel(
        name: "Switch",
        subtitle: "Toggle Switch",
        implementation: SwitchImplementation(),
        description: SwitchDescription(),
        link: "https://api.flutter.dev/flutter/material/Switch-class.html",
      ),
      WidgetModel(
        name: "TextField",
        subtitle: "Input field for username and password",
        implementation: TextFieldImplementation(),
        description: TextFielDescription(),
        link: "https://api.flutter.dev/flutter/material/TextField-class.html",
      ),
      WidgetModel(
        name: "Card",
        implementation: CardImplementation(),
        description: CardDescription(),
        link: "https://api.flutter.dev/flutter/material/Card-class.html",
      ),
      WidgetModel(
        name: "Opacity",
        implementation: OpacityImplementation(),
        description: OpacityDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Opacity-class.html",
      ),
      WidgetModel(
        name: "Table",
        implementation: TableImplementation(),
        description: TableDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Table-class.html",
      ),
      WidgetModel(
        name: "Expanded",
        implementation: ExpandedImplementation(),
        description: ExpandedDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Expanded-class.html",
      ),
      WidgetModel(
        name: "ReOrderableListView",
        subtitle: "A Reorderable List",
        implementation: ReOrderableListViewImplementation(),
        description: ReOrderableListViewDescription(),
        link:
            "https://api.flutter.dev/flutter/material/ReorderableListView-class.html",
      ),
      WidgetModel(
        name: "DropDownButton",
        implementation: DropDownButtonSample(),
        description: DropDownButtonDescription(),
        link:
            "https://api.flutter.dev/flutter/material/DropdownButton -class.html",
      ),
      WidgetModel(
        name: "Wrap",
        subtitle: "Wrap Widget",
        implementation: WrapWidget(),
        description: WrapWidgetDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Wrap-class.html",
      ),
      WidgetModel(
        name: "Hero",
        subtitle: "Hero Animation between widgets",
        implementation: HeroWidget(),
        description: HeroWidgetDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Hero-class.html",
      ),
      WidgetModel(
        name: "SnackBar",
        subtitle: "SnackBar Widget",
        implementation: SnackBarImplementation(),
        description: SnackBarDescription(),
        link: "https://api.flutter.dev/flutter/material/SnackBar-class.html",
      ),
      WidgetModel(
        name: "DataTable",
        subtitle: "Data Table  widgets",
        implementation: DatatableWidget(),
        description: DataTableWidgetDescription(),
        link: "https://api.flutter.dev/flutter/material/DataTable-class.html",
      ),
      WidgetModel(
        name: "CheckboxListTile",
        subtitle: "A ListTile with a Checkbox",
        implementation: CheckboxListTileWidget(),
        description: CheckboxListTileWidgetDescription(),
        link:
            "https://api.flutter.dev/flutter/material/CheckboxListTile-class.html",
      ),
      WidgetModel(
        name: "List Tile",
        implementation: ListTileSample(),
        description: ListTileDescription(),
        link: "https://api.flutter.dev/flutter/material/ListTile-class.html",
      ),
      WidgetModel(
        name: "RichText",
        subtitle: "Rich Text widget",
        implementation: RichTextWidget(),
        description: RichTextWidgetDescription(),
        link: "https://api.flutter.dev/flutter/widgets/RichText-class.html",
      ),
      WidgetModel(
        name: "Slider",
        implementation: SliderSample(),
        description: SliderDescription(),
        link: "https://api.flutter.dev/flutter/material/Slider-class.html",
      ),
      WidgetModel(
        name: "AnimatedBuilder Widget",
        subtitle: "Implement Animations",
        implementation: AnimatedBuilderWidget(),
        description: AnimatedBuilderDescription(),
        link:
            "https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html",
      ),
      WidgetModel(
        name: "Transform",
        link: "https://api.flutter.dev/flutter/widgets/Transform-class.html",
        implementation: TransformImplementation(),
        description: TransformDescription(),
      ),
      WidgetModel(
        name: "DraggableScrollableSheet Widget",
        subtitle: "Implementation for DraggableScrollableSheet in flutter",
        implementation: DraggableScrollSheet(),
        description: DraggableScrollSheetDesc(),
        link:
            "https://api.flutter.dev/flutter/widgets/DraggableScrollableSheet-class.html",
      ),
      WidgetModel(
        name: "Dismissible",
        subtitle: "Remove any List Item",
        implementation: DismissibleSample(),
        description: DismissibleDescription(),
        link: "https://api.flutter.dev/flutter/widgets/Dismissible-class.html",
      ),
      WidgetModel(
        name: "Page View",
        implementation: pageViewSample(),
        description: PageViewDescription(),
        link: "https://api.flutter.dev/flutter/widgets/PageView-class.html",
      ),
      WidgetModel(
          name: "Linear Progress Indicator",
          link:
              "https://api.flutter.dev/flutter/material/LinearProgressIndicator-class.html",
          implementation: LinearProgressIndicatorSample(),
          description: LinearProgressIndicatorDescription()),
      WidgetModel(
        name: "Circular Progress Indicator",
        link:
            "https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html",
        implementation: CircularProgressIndicatorSample(),
        description: CircularProgressIndicatorDescription(),
      ),
      WidgetModel(
        name: "Draggable Widget",
        link: "https://api.flutter.dev/flutter/widgets/Draggable-class.html",
        implementation: DraggableSample(),
        description: DraggableDescription(),
      ),
      WidgetModel(
        name: "Flexible",
        link: "https://api.flutter.dev/flutter/widgets/Flexible-class.html",
        implementation: FlexibleWidget(),
        description: FlexibleDescription(),
      ),
      WidgetModel(
        name: "IndexedStack",
        link: "https://api.flutter.dev/flutter/widgets/IndexedStack-class.html",
        implementation: IndexedStackImplemention(),
        description: IndexedStackDescription(),
      ),
    ];

    return ListView(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      children: filterWidgets(widgets, filter),
    );
  }

  List<Widget> filterWidgets(List<WidgetModel> widgets, String filter) {
    List<WidgetModel> filtered = [];

    widgets.forEach((item) {
      String itemName = item.name.toLowerCase();
      String subtitle = item.subtitle.toLowerCase();
      if (itemName.contains(filter.toLowerCase()))
        filtered.add(item);
      else if (subtitle.contains(filter.toLowerCase())) filtered.add(item);
    });

    if (filtered.isEmpty) {
      return [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
            child: Text('No widget found with name:\n' + filter,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                )),
          ),
        ),
      ];
    }

    return filtered.map((item) => buildListItem(item)).toList();
  }

  ListTile buildListItem(WidgetModel item) {
    CircleAvatar arrow = CircleAvatar(
      child: Icon(
        Icons.keyboard_arrow_right,
        color: Colors.white,
      ),
      backgroundColor: Colors.orange[900],
    );

    TextStyle titleStyle = TextStyle(
      color: Colors.white,
    );

    TextStyle subtitleStyle = TextStyle(color: Colors.white70);

    return ListTile(
      leading: arrow,
      title: Text(
        item.name + " Widget",
        style: titleStyle,
      ),
      subtitle: item.subtitle.isEmpty
          ? null
          : Text(
              item.subtitle,
              style: subtitleStyle,
            ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RootScreen(item),
          ),
        );
      },
    );
  }
}
