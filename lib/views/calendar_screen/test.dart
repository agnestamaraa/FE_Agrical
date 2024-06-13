import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:kalender_pertanian_ta/consts/global.colors.dart";
import "package:kalender_pertanian_ta/model/eventmodel.dart";

import "package:table_calendar/table_calendar.dart";

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // store events created
  Map<DateTime, List<Event>> events = {}; 
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay){
    if (!isSameDay(_selectedDay, selectedDay)){
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Kalender Pertanian"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                scrollable: true,
                title: Text('Event Name'),
                content: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _eventController,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      events.addAll({
                        _selectedDay!: [Event(_eventController.text)]
                      });
                      Navigator.of(context).pop();
                      _selectedEvents.value = _getEventsForDay(_selectedDay!);
                    }, 
                    child: Text('Submit'),
                  )
                ],
              );
            });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: GlobalColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            TableCalendar(
                locale: "en_US",
                // rowHeight: 43,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                focusedDay: _focusedDay, 
                firstDay: DateTime.utc(2010, 10, 16), 
                lastDay: DateTime.utc(2030, 3, 14),
                calendarFormat: _calendarFormat,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: _onDaySelected,
                eventLoader: _getEventsForDay,
                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GlobalColors.mainColor
                  ),
                  todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: GlobalColors.mainColor.withOpacity(0.5)
                  ),
                ),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay){
                  _focusedDay = focusedDay;
                },
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _selectedEvents, 
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length, 
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            onTap: () => print(''),
                            title: Text('${value[index].title}'),
                          ),
                        );
                      });
                  }
                ),
              )
          ],
        ),
      ),
    );
  }


  // Widget content() {
  //   return Padding(
  //     padding: const EdgeInsets.all(20.0),
  //     child: Column(
  //       children: [
  //         Text('Selected Day = ' + today.toString().split(" ")[0]),
  //         Container(
  //           child: TableCalendar(
  //             locale: "en_US",
  //             // rowHeight: 43,
  //             headerStyle: HeaderStyle(
  //               formatButtonVisible: false,
  //               titleCentered: true
  //             ),
  //             availableGestures: AvailableGestures.all,
  //             selectedDayPredicate: (day) => isSameDay(day, today),
  //             focusedDay: today, 
  //             firstDay: DateTime.utc(2010, 10, 16), 
  //             lastDay: DateTime.utc(2030, 3, 14),
  //             onDaySelected: _onDaySelected,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}