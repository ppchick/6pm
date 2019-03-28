import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import '../session/global.dart' as globals;

class DatePickerSession extends StatelessWidget {
  BuildContext context;
  DatePickerSession(this.context);
  String _datetime;
  String _year;
  String _month;
  String _date;

  String _lang = 'en';
  String _format = 'dd-mmmm-yyyy';
  bool _showTitleActions = false;

  TextEditingController _langCtrl = TextEditingController();
  TextEditingController _formatCtrl = TextEditingController();

  void initDate() {
    _langCtrl.text = 'en';
    _formatCtrl.text = 'dd-mmmm-yyyy';

    DateTime now = DateTime.now();
    _year = now.year.toString();
    if (now.month < 10)
      _month = '0' + now.month.toString();
    else
      _month = now.month.toString();
    if (now.day < 10)
      _date = '0' + now.day.toString();
    else
      _date = now.day.toString();
    _datetime = _date + '/' + _month + '/' + _year;
    globals.datetime = _datetime;
  }

  /// Display date picker.
  void _showDatePicker() {
    final bool showTitleActions = false;
    DatePicker.showDatePicker(
      context,
      showTitleActions: _showTitleActions,
      minYear: DateTime.now().year,
      maxYear: DateTime.now().year + 1,
      initialYear: DateTime.now().year,
      initialMonth: DateTime.now().month,
      initialDate: DateTime.now().day,
      confirm: Text(
        'Confirm',
        style: TextStyle(color: Colors.red),
      ),
      cancel: Text(
        'Cancel',
        style: TextStyle(color: Colors.cyan),
      ),
      locale: _lang,
      dateFormat: _format,
      onChanged: (year, month, date) {
        debugPrint('onChanged date: $date/$month/$year');

        if (!showTitleActions) {
          _changeDatetime(year, month, date);
        }
      },
      onConfirm: (year, month, date) {
        _changeDatetime(year, month, date);
      },
    );
  }

  void _changeDatetime(int year, int month, int date) {
    _year = year.toString();
    if (month < 10)
      _month = '0' + month.toString();
    else
      _month = month.toString();
    if (date < 10)
      _date = '0' + date.toString();
    else
      _date = date.toString();
    _datetime = _date + '/' + _month + '/' + _year;
    globals.datetime = _datetime;
  }

  @override
  Widget build(BuildContext context) {
    initDate();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Date:',
                style: TextStyle(fontSize: 20.0),
              ),
              Container(
                padding: EdgeInsets.only(left: 12.0),
                child: Text(
                  '$_datetime',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
            ],
          ),
        ),
        Container(
          // padding: EdgeInsets.only(left: 30.0),
          child: IconButton(
            onPressed: _showDatePicker,
            icon: Icon(Icons.today),
          ),
        ),
      ],

      // Selected dat
    );
  }
}
