import 'package:appointments/src/appoinments/provider/approinments_provider.dart';
import 'package:appointments/src/appoinments/widgets/filters_bottom_sheet.dart';
import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersUI extends StatefulWidget {
  const FiltersUI({super.key});

  @override
  State<FiltersUI> createState() => _FiltersUIState();
}

class _FiltersUIState extends State<FiltersUI> {
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
            onTap: () async {
              final now = DateTime.now();
              final picked = await showDatePicker(
                context: context,
                initialDate: now,
                firstDate: now.subtract(const Duration(days: 365)),
                lastDate: now.add(const Duration(days: 365)),
              );
              if (context.mounted) {
                if (picked != null) {
                  // Handle single date selection
                  context.read<ApproinmentsProvider>().applySingleFilter(
                        startDate: picked,
                        endDate: picked,
                      );
                } else {
                  context
                      .read<ApproinmentsProvider>()
                      .removeSingleFilter('dateRange');
                }
              }
            },
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
          Consumer<ApproinmentsProvider>(
            builder: (context, provider, child) {
              bool isActive = provider.hasActiveFilters;
              return OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1.0,
                    color: isActive ? themeColor : Colors.grey,
                  ),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => const FiltersBottomSheet(),
                  );
                },
                icon: Icon(
                  Icons.filter_alt_outlined,
                  color: isActive ? themeColor : Colors.grey,
                  size: 20,
                ),
                label: Text(
                  'Filters',
                  style: hhTextTheme.titleSmall!.copyWith(
                    color: isActive ? themeColor : Colors.grey,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
