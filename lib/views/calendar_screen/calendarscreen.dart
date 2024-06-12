import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/views/calendar_screen/event.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Store events created
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
    _eventController.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
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
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        shape: CircleBorder(
          side: BorderSide(
            color: GlobalColors.mainColor,
            width: 2.0,
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
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
                      if (_eventController.text.isNotEmpty) {
                        setState(() {
                          // Check if the selected day already has events
                          if (events[_selectedDay!] != null) {
                            // Append the new event to the existing list
                            events[_selectedDay!]!.add(Event(_eventController.text));
                          } else {
                            // Create a new list with the new event
                            events[_selectedDay!] = [Event(_eventController.text)];
                          }
                          _eventController.clear();
                          Navigator.of(context).pop();
                          // Update the ValueNotifier to reflect the new list of events
                          _selectedEvents.value = _getEventsForDay(_selectedDay!);
                        });
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: GlobalColors.mainColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greetings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Hai, Juan!
                  Column(
                    children: [
                      Text(
                        'Kalender Pertanian',
                        style: TextStyle(
                          color: GlobalColors.textMainColor,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8)
                    ],
                  ),
                  // Notification and Profile icons
                  // Row(
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {
                  //         // Handle notification button press
                  //       },
                  //       icon: Icon(Icons.notifications),
                  //     ),
                  //     IconButton(
                  //       onPressed: () {
                  //         // Handle profile button press
                  //       },
                  //       icon: Icon(Icons.account_circle),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TableCalendar(
                        locale: "en_US",
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
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
                            color: GlobalColors.mainColor,
                          ),
                          todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: GlobalColors.mainColor.withOpacity(0.5),
                          ),
                        ),
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                      ),
                      SizedBox(height: 8.0),
                      ValueListenableBuilder<List<Event>>(
                        valueListenable: _selectedEvents,
                        builder: (context, value, _) {
                          return ListView.builder(
                            itemCount: value.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  onTap: () => print('Event tapped: ${value[index].title}'),
                                  title: Text('${value[index].title}'),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
