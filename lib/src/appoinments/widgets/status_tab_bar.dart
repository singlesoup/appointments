import 'package:appointments/src/appoinments/data/appointments.dart';
import 'package:appointments/src/appoinments/provider/approinments_provider.dart';
import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:appointments/src/utils/extentions/capitalize.dart';
import 'package:flutter/material.dart' show Colors, InkWell;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StatusTabBar extends StatelessWidget {
  const StatusTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          _TabButton(
            type: AppointmentType.upcoming,
            onTap: () {
              var approinmentsProvider = context.read<ApproinmentsProvider>();
              approinmentsProvider.setTab(AppointmentType.upcoming);
            },
          ),
          _TabButton(
            type: AppointmentType.completed,
            onTap: () {
              var approinmentsProvider = context.read<ApproinmentsProvider>();
              approinmentsProvider.setTab(AppointmentType.completed);
            },
          ),
          _TabButton(
            type: AppointmentType.cancelled,
            onTap: () {
              var approinmentsProvider = context.read<ApproinmentsProvider>();
              approinmentsProvider.setTab(AppointmentType.cancelled);
            },
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatefulWidget {
  final AppointmentType type;
  final VoidCallback onTap;

  const _TabButton({
    required this.type,
    required this.onTap,
  });

  @override
  State<_TabButton> createState() => _TabButtonState();
}

class _TabButtonState extends State<_TabButton> {
  String label = '';
  bool isSelected = false;

  static const Duration animationDuration = Duration(milliseconds: 250);

  @override
  void initState() {
    super.initState();
    label = widget.type.name.capitalize();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApproinmentsProvider>(
      builder: (context, approinmentsProvider, child) {
        AppointmentType selectedStatus = approinmentsProvider.currentTab;
        isSelected = (selectedStatus == widget.type);
        return Expanded(
          child: InkWell(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: animationDuration,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? themeColor : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: AnimatedDefaultTextStyle(
                duration: animationDuration,
                style: isSelected
                    ? hhTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: themeColor,
                      )
                    : hhTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                textAlign: TextAlign.center,
                child: Text(
                  label,
                  style: hhTextTheme.titleSmall!.copyWith(
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
