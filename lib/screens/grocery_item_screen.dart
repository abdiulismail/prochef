import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prochef/models/models.dart';
import 'package:uuid/uuid.dart';

import '../widgets/components.dart';

class GroceryItemScreen extends StatefulWidget {
  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;

  final GroceryItem? originalItem;

  final bool isUpdating;

  GroceryItemScreen(
      {super.key,
      required this.onCreate,
      required this.onUpdate,
      this.originalItem})
      : isUpdating = (originalItem != null);

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  //add grocery item screen state properties
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  //add initState()
  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  //add dispose()
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                //add callback handler
                final groceryitem = GroceryItem(
                    id: widget.originalItem?.id ?? Uuid().v1(),
                    name: _nameController.text,
                    importance: _importance,
                    color: _currentColor,
                    quantity: _currentSliderValue,
                    date: DateTime(
                      _dueDate.year,
                      _dueDate.month,
                      _dueDate.day,
                      _dueDate.hour,
                      _dueDate.minute,
                    ));
                if (widget.isUpdating) {
                  widget.onUpdate(groceryitem);
                } else {
                  widget.onCreate(groceryitem);
                }
              },
              icon: Icon(Icons.check))
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            // Add name TextField
            buildNameField(),
            SizedBox(
              width: 16.0,
              height: 30.0,
              child: Container(
                  //color: Colors.grey,
                  ),
            ),
            //Add Importance selection
            buildImportanceField(),
            SizedBox(
              width: 16.0,
              height: 30.0,
              child: Container(
                  //color: Colors.grey,
                  ),
            ),
            // Add date picker
            buildDateField(context),
            SizedBox(
              width: 16.0,
              height: 30.0,
              child: Container(
                  //color: Colors.grey,
                  ),
            ),
            // Add time picker
            buildTimeField(context),
            SizedBox(
              width: 16.0,
              height: 30.0,
              child: Container(
                  //color: Colors.grey,
                  ),
            ),
            // Add color picker
            buildColorPicker(context),
            SizedBox(
              width: 16.0,
              height: 30.0,
              child: Container(
                  //color: Colors.grey,
                  ),
            ),
            //Add slider
            buildQuantityField(),
            // Add Grocery Tile
            GroceryTile(
              item: GroceryItem(
                  id: 'previewMode',
                  name: _name,
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSliderValue,
                  date: DateTime(
                    _dueDate.year,
                    _dueDate.month,
                    _dueDate.day,
                    _dueDate.hour,
                    _dueDate.minute,
                  )),
            )
          ],
        ),
      ),
    );
  }

// Add buildNameField()
  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'input item name eg apples, banana ..',
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor)),
          ),
        )
      ],
    );
  }

// Add buildImportanceField()
  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              label: Text(
                'low',
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.low,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.low;
                });
              },
            ),
            ChoiceChip(
              label: Text(
                'medium',
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.medium,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.medium;
                });
              },
            ),
            ChoiceChip(
              label: Text(
                'high',
                style: TextStyle(color: Colors.white),
              ),
              selected: _importance == Importance.high,
              selectedColor: Colors.black,
              onSelected: (selected) {
                setState(() {
                  _importance = Importance.high;
                });
              },
            )
          ],
        )
      ],
    );
  }

// ADD buildDateField()
  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: Text('select'),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: currentDate,
                    firstDate: currentDate,
                    lastDate: DateTime(currentDate.year + 5));
                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            ),
            Text(DateFormat('yyyy-MM-dd').format(_dueDate))
          ],
        ),
      ],
    );
  }

// Add buildTimeField()
  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of Day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: Text('select'),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                    initialTime: TimeOfDay.now(), context: context);
                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
            ),
            Text(_timeOfDay.format(context))
          ],
        )
      ],
    );
  }

// Add buildColorPicker()
  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'color',
              style: GoogleFonts.lato(fontSize: 28.0),
            )
          ],
        ),
        TextButton(
          child: Text('select'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (color) {
                        setState(() {
                          _currentColor = color;
                        });
                      },
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('save'))
                    ],
                  );
                });
          },
        )
      ],
    );
  }

//Add buildQuantityField()
  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            SizedBox(
              width: 16.0,
              child: Container(
                color: Colors.pink,
              ),
            ),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            )
          ],
        ),
        Slider(
            inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: _currentColor,
            value: _currentSliderValue.toDouble(),
            min: 0.0,
            max: 100.0,
            divisions: 100,
            label: _currentSliderValue.toInt().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value.toInt();
              });
            })
      ],
    );
  }
}
