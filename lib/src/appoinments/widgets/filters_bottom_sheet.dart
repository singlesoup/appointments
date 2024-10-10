import 'package:appointments/src/appoinments/data/appointments.dart';
import 'package:appointments/src/appoinments/provider/approinments_provider.dart';
import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({super.key});

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  AppointmentMode? selectedMode;
  AppointmentDuration? selectedDuration;
  String? selectedType;
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();

    var appointmentFilters = context.read<ApproinmentsProvider>().activeFilters;
    selectedMode = appointmentFilters.mode;
    selectedType = appointmentFilters.type;
    selectedDuration = appointmentFilters.duration;
    startDate = appointmentFilters.startDate;
    endDate = appointmentFilters.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: hhTextTheme.titleLarge,
              ),
              Consumer<ApproinmentsProvider>(
                builder: (context, provider, child) {
                  return TextButton(
                    onPressed: provider.hasActiveFilters
                        ? () {
                            provider.clearAllFilters();
                            setState(() {
                              selectedMode = null;
                              selectedDuration = null;
                              selectedType = null;
                              startDate = null;
                              endDate = null;
                            });
                            Future.delayed(const Duration(milliseconds: 400),
                                () {
                              Navigator.of(context).pop();
                            });
                          }
                        : null,
                    child: Text(
                      'Clear All',
                      style: hhTextTheme.titleSmall!.copyWith(
                        color: provider.hasActiveFilters
                            ? themeColor
                            : Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          // TODO: Change filterChip colors

          // Mode Filter
          Text('Appointment Mode', style: hhTextTheme.titleMedium),
          Wrap(
            spacing: 8,
            children: AppointmentMode.values.map((mode) {
              return FilterChip(
                label: Text(mode.name),
                selected: selectedMode == mode,
                onSelected: (selected) {
                  setState(() {
                    selectedMode = selected ? mode : null;
                  });
                  if (selected) {
                    context.read<ApproinmentsProvider>().applySingleFilter(
                          mode: selectedMode,
                          duration: selectedDuration,
                          type: selectedType,
                          startDate: startDate,
                          endDate: endDate,
                        );
                  } else {
                    context
                        .read<ApproinmentsProvider>()
                        .removeSingleFilter('mode');
                  }
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 16),

          // Duration Filter
          Text('Duration', style: hhTextTheme.titleMedium),
          Wrap(
            spacing: 8,
            children: AppointmentDuration.values.map((duration) {
              return FilterChip(
                label: Text(duration.name),
                selected: selectedDuration == duration,
                onSelected: (selected) {
                  setState(() {
                    selectedDuration = selected ? duration : null;
                  });
                  if (selected) {
                    context.read<ApproinmentsProvider>().applySingleFilter(
                          mode: selectedMode,
                          duration: selectedDuration,
                          type: selectedType,
                          startDate: startDate,
                          endDate: endDate,
                        );
                  } else {
                    context
                        .read<ApproinmentsProvider>()
                        .removeSingleFilter('duration');
                  }
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 24),

          // Apply Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Apply Filters',
                style: hhTextTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
