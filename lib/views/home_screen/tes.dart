import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(
          slivers: [
            // Add the app bar to the CustomScrollView.
            const SliverAppBar(
              // Provide a standard title.
              title: Text(title),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: Placeholder(),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 200,
            ),
            // Next, create a SliverList
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => ListTile(title: Text('Item #$index')),
                // Builds 1000 ListTiles
                childCount: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:kalender_pertanian_ta/consts/global.colors.dart';
// import 'package:kalender_pertanian_ta/widgets/button_global.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// // import 'package:kalender_pertanian_ta/views/notification_screen.dart/notification_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<String> items = [
//     'Cikembulan',
//     'Cimalaka',
//     'Cimanggu',
//     'Cipacing',
//     'Jatinangor',
//     'Tanjungkerta',
//     'Sukamantri',
//     'Cisitu',
//   ];

//   String? selectedValue;
//   final TextEditingController textEditingController = TextEditingController();

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(20, 24, 10, 60),
//           child: Column(children: [
//             // Greetings
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Hai, Juan!
//                 Column(
//                   children: [
//                     Text(
//                       'Hai, Juan!',
//                       style: TextStyle(
//                           color: GlobalColors.textMainColor,
//                           fontSize: 24,
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ],
//                 ),

//                 // Notification icon
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.notifications,
//                       color: GlobalColors.textMainColor,
//                     ),
//                     const SizedBox(width: 10),
//                     Icon(
//                       Icons.account_circle,
//                       color: GlobalColors.textMainColor,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             const SizedBox(height: 20),

//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // search bar
//                     DropdownButtonHideUnderline(
//                       child: Container(
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: GlobalColors.textColor, width: 1.0),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: DropdownButton2<String>(
//                           isExpanded: true,
//                           hint: Text(
//                             'Pilih Lokasi',
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).hintColor,
//                             ),
//                           ),
//                           items: items
//                               .map((item) => DropdownMenuItem(
//                                     value: item,
//                                     child: Text(
//                                       item,
//                                       style: const TextStyle(
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ))
//                               .toList(),
//                           value: selectedValue,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedValue = value;
//                             });
//                           },
//                           buttonStyleData: const ButtonStyleData(
//                               padding: EdgeInsets.only(left: 0, right: 9),
//                               height: 40),
//                           dropdownStyleData: const DropdownStyleData(
//                             maxHeight: 200,
//                           ),
//                           menuItemStyleData: const MenuItemStyleData(
//                             height: 40,
//                           ),
//                           dropdownSearchData: DropdownSearchData(
//                             searchController: textEditingController,
//                             searchInnerWidgetHeight: 50,
//                             searchInnerWidget: Container(
//                               height: 50,
//                               padding: const EdgeInsets.only(
//                                 top: 8,
//                                 bottom: 8,
//                                 right: 8,
//                                 left: 8,
//                               ),
//                               child: TextFormField(
//                                 expands: true,
//                                 maxLines: null,
//                                 controller: textEditingController,
//                                 decoration: InputDecoration(
//                                   isDense: true,
//                                   contentPadding: const EdgeInsets.symmetric(
//                                     horizontal: 10,
//                                     vertical: 8,
//                                   ),
//                                   hintText: 'Cari Lokasi',
//                                   hintStyle: const TextStyle(fontSize: 14),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             searchMatchFn: (item, searchValue) {
//                               return item.value
//                                   .toString()
//                                   .contains(searchValue);
//                             },
//                           ),
//                           //This to clear the search value when you close the menu
//                           onMenuStateChange: (isOpen) {
//                             if (!isOpen) {
//                               textEditingController.clear();
//                             }
//                           },
//                         ),
//                       ),
//                     ),

//                     // Cuaca hari ini
//                     Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                       width: double.infinity, // menyesuaikan dengan layar
//                       decoration: BoxDecoration(
//                         color: GlobalColors.mainColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Senin, 26 Februari 2024',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ]),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'Hari Ini',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   Text(
//                                     '08:00',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),

//                           // icon cuaca
//                           Container(
//                             margin: const EdgeInsets.only(top: 20),
//                             alignment: Alignment.center,
//                             child: Image.asset(
//                               'assets/images/cerahberawan.png',
//                               width: 130,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),

//                           Row(
//                             // crossAxisAlignment: CrossAxisAlignment.baseline,
//                             // textBaseline: TextBaseline.alphabetic,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 '21',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 90,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(width: 4),
//                               RichText(
//                                   text: const TextSpan(
//                                 text: '°',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20, // Ukuran simbol derajat
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: 'C',
//                                     style: TextStyle(
//                                       fontSize: 14, // Ukuran huruf 'C'
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                             ],
//                           ),

//                           const Text('Cerah berawan',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                               )),
//                           const SizedBox(height: 25),

//                           GlobalButtonn(
//                             onTap: () {},
//                             buttonColor: Colors.white,
//                             buttonText: 'Lihat Selengkapnya',
//                             buttonTextColor: GlobalColors.mainColor,
//                             fontSize: 14,
//                             buttonHeight: 50,
//                           ),
//                           const SizedBox(height: 25),

//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text('Terakhir diperbarui 30 menit lalu',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w500,
//                                   )),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // Cuaca hari ini
//                     Container(
//                       margin: const EdgeInsets.only(top: 20),
//                       padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                       width: double.infinity, // menyesuaikan dengan layar
//                       decoration: BoxDecoration(
//                         color: GlobalColors.mainColor,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Column(
//                         children: [
//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Senin, 26 Februari 2024',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 18,
//                                         fontFamily: 'Inter',
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ]),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     'Hari Ini',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                   Text(
//                                     '08:00',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),

//                           // icon cuaca
//                           Container(
//                             margin: const EdgeInsets.only(top: 20),
//                             alignment: Alignment.center,
//                             child: Image.asset(
//                               'assets/images/cerahberawan.png',
//                               width: 130,
//                               height: 100,
//                               fit: BoxFit.cover,
//                             ),
//                           ),

//                           Row(
//                             // crossAxisAlignment: CrossAxisAlignment.baseline,
//                             // textBaseline: TextBaseline.alphabetic,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 '21',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 90,
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                               const SizedBox(width: 4),
//                               RichText(
//                                   text: const TextSpan(
//                                 text: '°',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20, // Ukuran simbol derajat
//                                   fontFamily: 'Inter',
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: 'C',
//                                     style: TextStyle(
//                                       fontSize: 14, // Ukuran huruf 'C'
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                             ],
//                           ),

//                           const Text('Cerah berawan',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                               )),
//                           const SizedBox(height: 25),

//                           GlobalButtonn(
//                             onTap: () {},
//                             buttonColor: Colors.white,
//                             buttonText: 'Lihat Selengkapnya',
//                             buttonTextColor: GlobalColors.mainColor,
//                             fontSize: 14,
//                             buttonHeight: 50,
//                           ),
//                           const SizedBox(height: 25),

//                           const Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text('Terakhir diperbarui 30 menit lalu',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontFamily: 'Inter',
//                                     fontWeight: FontWeight.w500,
//                                   )),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),

//                     // const SizedBox(height: 16),

//                     // Volume Penjualan Tanaman
//                   ],
//                 ),
//               ),
//             )

//             // Expanded(
//             //   child: GridView.count(
//             //     // Create a grid with 2 columns. If you change the scrollDirection to
//             //     // horizontal, this produces 2 rows.
//             //     crossAxisCount: 1,
//             //     // Generate 100 widgets that display their index in the List.
//             //     children: [
//             //       // search bar
//             //       DropdownButtonHideUnderline(
//             //         child: Container(
//             //           decoration: BoxDecoration(
//             //             border: Border.all(
//             //                 color: GlobalColors.textColor, width: 1.0),
//             //             borderRadius: BorderRadius.circular(8),
//             //           ),
//             //           child: DropdownButton2<String>(
//             //             isExpanded: true,
//             //             hint: Text(
//             //               'Pilih Lokasi',
//             //               style: TextStyle(
//             //                 fontSize: 16,
//             //                 color: Theme.of(context).hintColor,
//             //               ),
//             //             ),
//             //             items: items
//             //                 .map((item) => DropdownMenuItem(
//             //                       value: item,
//             //                       child: Text(
//             //                         item,
//             //                         style: const TextStyle(
//             //                           fontSize: 16,
//             //                         ),
//             //                       ),
//             //                     ))
//             //                 .toList(),
//             //             value: selectedValue,
//             //             onChanged: (value) {
//             //               setState(() {
//             //                 selectedValue = value;
//             //               });
//             //             },
//             //             buttonStyleData: const ButtonStyleData(
//             //                 padding: EdgeInsets.only(left: 0, right: 9),
//             //                 height: 40),
//             //             dropdownStyleData: const DropdownStyleData(
//             //               maxHeight: 200,
//             //             ),
//             //             menuItemStyleData: const MenuItemStyleData(
//             //               height: 40,
//             //             ),
//             //             dropdownSearchData: DropdownSearchData(
//             //               searchController: textEditingController,
//             //               searchInnerWidgetHeight: 50,
//             //               searchInnerWidget: Container(
//             //                 height: 50,
//             //                 padding: const EdgeInsets.only(
//             //                   top: 8,
//             //                   bottom: 8,
//             //                   right: 8,
//             //                   left: 8,
//             //                 ),
//             //                 child: TextFormField(
//             //                   expands: true,
//             //                   maxLines: null,
//             //                   controller: textEditingController,
//             //                   decoration: InputDecoration(
//             //                     isDense: true,
//             //                     contentPadding: const EdgeInsets.symmetric(
//             //                       horizontal: 10,
//             //                       vertical: 8,
//             //                     ),
//             //                     hintText: 'Cari Lokasi',
//             //                     hintStyle: const TextStyle(fontSize: 14),
//             //                     border: OutlineInputBorder(
//             //                       borderRadius: BorderRadius.circular(8),
//             //                     ),
//             //                   ),
//             //                 ),
//             //               ),
//             //               searchMatchFn: (item, searchValue) {
//             //                 return item.value.toString().contains(searchValue);
//             //               },
//             //             ),
//             //             //This to clear the search value when you close the menu
//             //             onMenuStateChange: (isOpen) {
//             //               if (!isOpen) {
//             //                 textEditingController.clear();
//             //               }
//             //             },
//             //           ),
//             //         ),
//             //       ),

//             //       // Cuaca hari ini
//             //       Container(
//             //         margin: const EdgeInsets.only(top: 20),
//             //         padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//             //         width: double.infinity, // menyesuaikan dengan layar
//             //         decoration: BoxDecoration(
//             //           color: GlobalColors.mainColor,
//             //           borderRadius: BorderRadius.circular(10),
//             //         ),
//             //         child: Column(
//             //           children: [
//             //             const Row(
//             //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               children: [
//             //                 Column(
//             //                     crossAxisAlignment: CrossAxisAlignment.start,
//             //                     children: [
//             //                       Text(
//             //                         'Senin, 26 Februari 2024',
//             //                         style: TextStyle(
//             //                           color: Colors.white,
//             //                           fontSize: 18,
//             //                           fontFamily: 'Inter',
//             //                           fontWeight: FontWeight.w500,
//             //                         ),
//             //                       ),
//             //                     ]),
//             //                 Column(
//             //                   crossAxisAlignment: CrossAxisAlignment.end,
//             //                   children: [
//             //                     Text(
//             //                       'Hari Ini',
//             //                       style: TextStyle(
//             //                         color: Colors.white,
//             //                         fontSize: 18,
//             //                         fontFamily: 'Inter',
//             //                         fontWeight: FontWeight.w500,
//             //                       ),
//             //                     ),
//             //                     Text(
//             //                       '08:00',
//             //                       style: TextStyle(
//             //                         color: Colors.white,
//             //                         fontSize: 18,
//             //                         fontFamily: 'Inter',
//             //                         fontWeight: FontWeight.w500,
//             //                       ),
//             //                     ),
//             //                   ],
//             //                 ),
//             //               ],
//             //             ),

//             //             // icon cuaca
//             //             Container(
//             //               margin: const EdgeInsets.only(top: 20),
//             //               alignment: Alignment.center,
//             //               child: Image.asset(
//             //                 'assets/images/cerahberawan.png',
//             //                 width: 130,
//             //                 height: 100,
//             //                 fit: BoxFit.cover,
//             //               ),
//             //             ),

//             //             Row(
//             //               // crossAxisAlignment: CrossAxisAlignment.baseline,
//             //               // textBaseline: TextBaseline.alphabetic,
//             //               mainAxisAlignment: MainAxisAlignment.center,
//             //               children: [
//             //                 const Text(
//             //                   '21',
//             //                   style: TextStyle(
//             //                     color: Colors.white,
//             //                     fontSize: 90,
//             //                     fontFamily: 'Inter',
//             //                     fontWeight: FontWeight.w500,
//             //                   ),
//             //                 ),
//             //                 const SizedBox(width: 4),
//             //                 RichText(
//             //                     text: const TextSpan(
//             //                   text: '°',
//             //                   style: TextStyle(
//             //                     color: Colors.white,
//             //                     fontSize: 20, // Ukuran simbol derajat
//             //                     fontFamily: 'Inter',
//             //                     fontWeight: FontWeight.w500,
//             //                   ),
//             //                   children: [
//             //                     TextSpan(
//             //                       text: 'C',
//             //                       style: TextStyle(
//             //                         fontSize: 14, // Ukuran huruf 'C'
//             //                       ),
//             //                     ),
//             //                   ],
//             //                 )),
//             //               ],
//             //             ),

//             //             const Text('Cerah berawan',
//             //                 style: TextStyle(
//             //                   color: Colors.white,
//             //                   fontSize: 18,
//             //                   fontFamily: 'Inter',
//             //                   fontWeight: FontWeight.w500,
//             //                 )),
//             //             const SizedBox(height: 25),

//             //             GlobalButtonn(
//             //               onTap: () {},
//             //               buttonColor: Colors.white,
//             //               buttonText: 'Lihat Selengkapnya',
//             //               buttonTextColor: GlobalColors.mainColor,
//             //               fontSize: 14,
//             //               buttonHeight: 50,
//             //             ),
//             //             const SizedBox(height: 25),

//             //             const Row(
//             //               mainAxisAlignment: MainAxisAlignment.end,
//             //               children: [
//             //                 Text('Terakhir diperbarui 30 menit lalu',
//             //                     style: TextStyle(
//             //                       color: Colors.white,
//             //                       fontSize: 12,
//             //                       fontFamily: 'Inter',
//             //                       fontWeight: FontWeight.w500,
//             //                     )),
//             //               ],
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //       const SizedBox(height: 16),

//             //       // Volume Penjualan Tanaman
//             //       const Row(
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: [
//             //           Text(
//             //             'Volume Penjualan Tanaman',
//             //             style: TextStyle(
//             //                 fontSize: 18,
//             //                 fontFamily: 'Inter',
//             //                 fontWeight: FontWeight.w500),
//             //           ),
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),

//             // // search bar
//             // DropdownButtonHideUnderline(
//             //   child: Container(
//             //     decoration: BoxDecoration(
//             //       border: Border.all(color: GlobalColors.textColor, width: 1.0),
//             //       borderRadius: BorderRadius.circular(8),
//             //     ),
//             //     child: DropdownButton2<String>(
//             //       isExpanded: true,
//             //       hint: Text(
//             //         'Pilih Lokasi',
//             //         style: TextStyle(
//             //           fontSize: 16,
//             //           color: Theme.of(context).hintColor,
//             //           ),
//             //         ),
//             //         items: items
//             //             .map((item) => DropdownMenuItem(
//             //                   value: item,
//             //                   child: Text(
//             //                     item,
//             //                     style: const TextStyle(
//             //                       fontSize: 16,
//             //                     ),
//             //                   ),
//             //                 ))
//             //             .toList(),
//             //         value: selectedValue,
//             //         onChanged: (value) {
//             //           setState(() {
//             //             selectedValue = value;
//             //           });
//             //         },
//             //         buttonStyleData: const ButtonStyleData(
//             //           padding: EdgeInsets.only(left: 0, right: 9),
//             //           height: 40
//             //         ),
//             //         dropdownStyleData: const DropdownStyleData(
//             //           maxHeight: 200,
//             //         ),
//             //         menuItemStyleData: const MenuItemStyleData(
//             //           height: 40,
//             //         ),
//             //         dropdownSearchData: DropdownSearchData(
//             //           searchController: textEditingController,
//             //           searchInnerWidgetHeight: 50,
//             //           searchInnerWidget: Container(
//             //             height: 50,
//             //             padding: const EdgeInsets.only(
//             //               top: 8,
//             //               bottom: 8,
//             //               right: 8,
//             //               left: 8,
//             //             ),
//             //             child: TextFormField(
//             //               expands: true,
//             //               maxLines: null,
//             //               controller: textEditingController,
//             //               decoration: InputDecoration(
//             //                 isDense: true,
//             //                 contentPadding: const EdgeInsets.symmetric(
//             //                   horizontal: 10,
//             //                   vertical: 8,
//             //                 ),
//             //                 hintText: 'Cari Lokasi',
//             //                 hintStyle: const TextStyle(fontSize: 14),
//             //                 border: OutlineInputBorder(
//             //                   borderRadius: BorderRadius.circular(8),
//             //                 ),
//             //               ),
//             //             ),
//             //           ),
//             //           searchMatchFn: (item, searchValue) {
//             //             return item.value.toString().contains(searchValue);
//             //           },
//             //         ),
//             //         //This to clear the search value when you close the menu
//             //         onMenuStateChange: (isOpen) {
//             //           if (!isOpen) {
//             //             textEditingController.clear();
//             //         }
//             //       },
//             //     ),
//             //   ),
//             // ),

//             // // Cuaca hari ini
//             // Container(
//             //   margin: const EdgeInsets.only(top: 20),
//             //   padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//             //   width: double.infinity,                 // menyesuaikan dengan layar
//             //   decoration: BoxDecoration(
//             //     color: GlobalColors.mainColor,
//             //     borderRadius: BorderRadius.circular(10),
//             //   ),
//             //   child: Column(
//             //     children: [
//             //       const Row(
//             //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //         crossAxisAlignment: CrossAxisAlignment.start,
//             //         children: [
//             //           Column(
//             //             crossAxisAlignment: CrossAxisAlignment.start,
//             //             children: [
//             //               Text(
//             //                 'Senin, 26 Februari 2024',
//             //                 style: TextStyle(
//             //                   color: Colors.white,
//             //                   fontSize: 18,
//             //                   fontFamily: 'Inter',
//             //                   fontWeight: FontWeight.w500,
//             //                 ),
//             //               ),
//             //             ]
//             //           ),

//             //           Column(
//             //             crossAxisAlignment: CrossAxisAlignment.end,
//             //             children: [
//             //               Text(
//             //                 'Hari Ini',
//             //                 style: TextStyle(
//             //                   color: Colors.white,
//             //                   fontSize: 18,
//             //                   fontFamily: 'Inter',
//             //                   fontWeight: FontWeight.w500,
//             //                 ),
//             //               ),

//             //               Text(
//             //                 '08:00',
//             //                 style: TextStyle(
//             //                   color: Colors.white,
//             //                   fontSize: 18,
//             //                   fontFamily: 'Inter',
//             //                   fontWeight: FontWeight.w500,
//             //                 ),
//             //               ),
//             //             ],
//             //           ),
//             //         ],
//             //       ),

//             //       // icon cuaca
//             //       Container(
//             //         margin: const EdgeInsets.only(top: 20),
//             //         alignment: Alignment.center,
//             //         child: Image.asset(
//             //           'assets/images/cerahberawan.png',
//             //           width: 130,
//             //           height: 100,
//             //           fit: BoxFit.cover,
//             //         ),
//             //       ),

//             //       Row(
//             //         // crossAxisAlignment: CrossAxisAlignment.baseline,
//             //         // textBaseline: TextBaseline.alphabetic,
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: [
//             //           const Text(
//             //             '21',
//             //             style: TextStyle(
//             //               color: Colors.white,
//             //               fontSize: 90,
//             //               fontFamily: 'Inter',
//             //               fontWeight: FontWeight.w500,
//             //             ),
//             //           ),
//             //           const SizedBox(width: 4),

//             //           RichText(
//             //             text: const TextSpan(
//             //               text: '°',
//             //               style: TextStyle(
//             //                 color: Colors.white,
//             //                 fontSize: 20, // Ukuran simbol derajat
//             //                 fontFamily: 'Inter',
//             //                 fontWeight: FontWeight.w500,
//             //               ),
//             //               children: [
//             //                 TextSpan(
//             //                   text: 'C',
//             //                   style: TextStyle(
//             //                     fontSize: 14, // Ukuran huruf 'C'
//             //                   ),
//             //                 ),
//             //               ],
//             //             )
//             //           ),
//             //         ],
//             //       ),

//             //       const Text(
//             //         'Cerah berawan',
//             //         style: TextStyle(
//             //           color: Colors.white,
//             //           fontSize: 18,
//             //           fontFamily: 'Inter',
//             //           fontWeight: FontWeight.w500,
//             //         )
//             //       ),
//             //       const SizedBox(height: 25),

//             //       GlobalButtonn(
//             //         onTap: () {},
//             //         buttonColor: Colors.white,
//             //         buttonText: 'Lihat Selengkapnya',
//             //         buttonTextColor: GlobalColors.mainColor,
//             //         fontSize: 14,
//             //         buttonHeight: 50,
//             //       ),
//             //       const SizedBox(height: 25),

//             //       const Row(
//             //         mainAxisAlignment: MainAxisAlignment.end,
//             //         children: [
//             //           Text(
//             //             'Terakhir diperbarui 30 menit lalu',
//             //             style: TextStyle(
//             //               color: Colors.white,
//             //               fontSize: 12,
//             //               fontFamily: 'Inter',
//             //               fontWeight: FontWeight.w500,
//             //             )
//             //           ),
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             // const SizedBox(height: 16),

//             // // Volume Penjualan Tanaman
//             // const Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: [
//             //     Text(
//             //       'Volume Penjualan Tanaman',
//             //       style: TextStyle(
//             //         fontSize: 18,
//             //         fontFamily: 'Inter',
//             //         fontWeight: FontWeight.w500
//             //       ),
//             //     ),
//             //   ],
//             // ),

//             // Chart
//           ]),
//         ),
//       ),
//     );
//   }
// }
