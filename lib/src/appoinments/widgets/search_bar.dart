import 'package:appointments/src/appoinments/provider/approinments_provider.dart';
import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';

class SearchAppointmentBar extends StatelessWidget {
  const SearchAppointmentBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Consumer<ApproinmentsProvider>(builder: (context, appoint, child) {
        debugPrint(appoint.appoinmentsList.length.toString());

        return TextField(
          controller: appoint.searchController,
          // focusNode: focusNode,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: Icon(
                Icons.search,
                color: Colors.grey[600],
                size: 24,
              ),
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: 'Search by name, Id, birth date etc.',
            hintStyle: hhTextTheme.bodyLarge!.copyWith(
              color: Colors.grey[600],
            ),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: borderColor, width: 1.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: borderColor, width: 2.0),
            ),
          ),
          onChanged: (value) {
            debugPrint("this is being print: $value");
            appoint.searchAppointments(value);
          },
        );

        // return TypeAheadField(
        //   controller: appoint.searchController,
        //   retainOnLoading: false,
        //   decorationBuilder: (context, child) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         color: accent,
        //         borderRadius: BorderRadius.circular(12),
        //         border: Border.all(color: Colors.grey[300]!, width: 1.5),
        //       ),
        //       child: child,
        //     );
        //   },
        //   builder: (context, controller, focusNode) {
        //     return TextField(
        //       controller: controller,
        //       focusNode: focusNode,
        //       decoration: InputDecoration(
        //         contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
        //         prefixIcon: Padding(
        //           padding: const EdgeInsets.only(left: 15.0, right: 10.0),
        //           child: Icon(
        //             Icons.search,
        //             color: Colors.grey[600],
        //             size: 24,
        //           ),
        //         ),
        //         fillColor: Colors.white,
        //         filled: true,
        //         hintText: 'Search by name, Id, birth date etc.',
        //         hintStyle: hhTextTheme.bodyLarge!.copyWith(
        //           color: Colors.grey[600],
        //         ),
        //         border: OutlineInputBorder(
        //           borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        //           borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
        //         ),
        //         enabledBorder: const OutlineInputBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //           borderSide: BorderSide(color: borderColor, width: 1.5),
        //         ),
        //         focusedBorder: const OutlineInputBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(30.0)),
        //           borderSide: BorderSide(color: borderColor, width: 2.0),
        //         ),
        //       ),
        //     );
        //   },
        //   itemBuilder: (context, value) {
        //     // TODO: (fix) Internally the state is not upating
        //     return KeyedSubtree(
        //       key: ValueKey('${appoint.appoinmentsList.length}_${value.id}'),
        //       child: ListTile(
        //         title: Text(value.name),
        //       ),
        //     );
        //   },
        //   onSelected: (value) {
        //     debugPrint(value.name);
        //     // TODO: Implement search onTap
        //   },
        //   suggestionsCallback: (query) {
        //     appoint.searchAppointments(query);
        //     return appoint.searchResults;
        //   },
        // );
      }),
    );
  }
}
