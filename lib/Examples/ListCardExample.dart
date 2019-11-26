import 'package:flutter/material.dart';

class ListorCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('card or list example'),
        backgroundColor: Colors.red,
      ),
      body: BodyLayout(),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView_7(context);
  }
}

/**
 * for adding or deleting the rows
 */
class BodyLayout_1 extends StatefulWidget {
  @override
  BodyLayoutState createState() => BodyLayoutState();
}








Widget _myListView_1(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Sun'),
      ),
      ListTile(
        title: Text('Moon'),
      ),
      ListTile(
        title: Text('Star'),
      ),
    ],
  );
}



Widget _myListView_2(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: Text('Sun'),
        ),
        ListTile(
          title: Text('Moon'),
        ),
        ListTile(
          title: Text('Star'),
        ),
      ],
    ).toList(),
  );
}

Widget _myListView_3(BuildContext context) {
  // backing data
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(europeanCountries[index]),
      );
    },
  );
}


Widget _myListView_4(BuildContext context) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('row $index'),
      );
    },
  );
}



Widget _myListView_5(BuildContext context) {
  return ListView.separated(
    itemCount: 1000,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('row $index'),
      );
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
}




Widget _myListView_6(BuildContext context) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 1.0),
        color: Colors.tealAccent,
        child: Text('$index'),
      );
    },
  );
}



Widget _myListView_7(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Sun'),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Moon'),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ],
  );
}



Widget _myListView_MIGHTNOtWork(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/sun.jpg'),
        ),
        title: Text('Sun'),
        subtitle: Text('93 million miles away'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/moon.jpg'),
        ),
        title: Text('Moon'),
        subtitle: Text('93 million miles away'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/stars.jpg'),
        ),
        title: Text('Star'),
        subtitle: Text('93 million miles away'),
      ),
    ],
  );
}


Widget _myListView_9(BuildContext context) {

  final titles = ['bike', 'boat', 'bus', 'car',
    'railway', 'run', 'subway', 'transit', 'walk'];

  final icons = [Icons.directions_bike, Icons.directions_boat,
    Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
    Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
    Icons.directions_walk];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card( //                           <-- Card widget
        child: ListTile(
          leading: Icon(icons[index]),
          title: Text(titles[index]),
        ),
      );
    },
  );
}




Widget _myListView_10(BuildContext context) {

  // the Expanded widget lets the columns share the space
  Widget column = Expanded(
    child: Column(
      // align the text to the left instead of centered
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Title', style: TextStyle(fontSize: 16),),
        Text('subtitle'),
      ],
    ),
  );

  return ListView.builder(
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              column,
              column,
            ],
          ),
        ),
      );
    },
  );

}


Widget _myListView_11(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Sun'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('Sun');
        },
      ),
      ListTile(
        title: Text('Moon'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('Moon');
        },
      ),
      ListTile(
        title: Text('Star'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          print('Star');
        },
      ),
    ],
  );
}




/**
 * This is for adding or deleting the row
 */
class BodyLayoutState extends State<BodyLayout_1> {

  // The GlobalKey keeps track of the visible state of the list items
  // while they are being animated.
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  // backing data
  List<String> _data = ['Sun', 'Moon', 'Star'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 300,
          child: AnimatedList(
            // Give the Animated list the global key
            key: _listKey,
            initialItemCount: _data.length,
            // Similar to ListView itemBuilder, but AnimatedList has
            // an additional animation parameter.
            itemBuilder: (context, index, animation) {
              // Breaking the row widget out as a method so that we can
              // share it with the _removeSingleItem() method.
              return _buildItem(_data[index], animation);
            },
          ),
        ),
        RaisedButton(
          child: Text('Insert item', style: TextStyle(fontSize: 20)),
          onPressed: () {
            _insertSingleItem();
          },
        ),
        RaisedButton(
          child: Text('Remove item', style: TextStyle(fontSize: 20)),
          onPressed: () {
            _removeSingleItem();
          },
        )
      ],
    );
  }

  // This is the animated row with the Card.
  Widget _buildItem(String item, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  void _insertSingleItem() {
    String newItem = "Planet";
    // Arbitrary location for demonstration purposes
    int insertIndex = 2;
    // Add the item to the data list.
    _data.insert(insertIndex, newItem);
    // Add the item visually to the AnimatedList.
    _listKey.currentState.insertItem(insertIndex);
  }

  void _removeSingleItem() {
    int removeIndex = 2;
    // Remove item from data list but keep copy to give to the animation.
    String removedItem = _data.removeAt(removeIndex);
    // This builder is just for showing the row while it is still
    // animating away. The item is already gone from the data list.
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(removedItem, animation);
    };
    // Remove the item visually from the AnimatedList.
    _listKey.currentState.removeItem(removeIndex, builder);
  }
}
