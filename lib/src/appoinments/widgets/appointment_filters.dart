import 'package:appointments/src/appoinments/provider/approinments_provider.dart';
import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentFilters extends StatefulWidget {
  const AppointmentFilters({super.key});

  @override
  State<AppointmentFilters> createState() => _AppointmentFiltersState();
}

class _AppointmentFiltersState extends State<AppointmentFilters> {
  String totalAppoinments = '';
  bool filtersApplied = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 6.0,
      ),
      child: Row(
        children: [
          Consumer<ApproinmentsProvider>(
            builder: (context, provider, child) {
              return Text(
                '${provider.appoinmentsList.length} Appointments',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 12,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: themeColor),
              ),
              child: const Icon(
                Icons.calendar_today,
                size: 18,
                color: themeColor,
              ),
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: themeColor),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt_outlined,
              color: themeColor,
              size: 20,
            ),
            label: Text(
              'Filters',
              style: hhTextTheme.titleSmall!.copyWith(color: themeColor),
            ),
          ),
        ],
      ),
    );
  }
}
