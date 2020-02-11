import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegan = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile("Gluten Free",
                    "Only include gluten free meals", _glutenFree, (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchListTile("Lactose Free",
                    "Only include lactose free meals", _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include vegan meals", _vegan, (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include vegetarian meals", _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
