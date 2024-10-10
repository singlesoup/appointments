import 'package:flutter/material.dart';
import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:appointments/src/utils/extentions/capitalize.dart';
import 'package:appointments/src/appoinments/data/appointments.dart';
import 'package:appointments/src/utils/extentions/date_formatter.dart';

class AppointmentCard extends StatelessWidget {
  final Appointments appointment;

  const AppointmentCard({
    super.key,
    required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: themeColor.withOpacity(0.1),
              child: const Icon(
                Icons.person_outline,
                color: themeColor,
                size: 48,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.name,
                    style: hhTextTheme.bodyLarge,
                  ),
                  const SizedBox(height: 4),
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            DateTimeFormatter.formatAppointmentDate(
                                appointment.time),
                            style: hhTextTheme.titleSmall!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            DateTimeFormatter.getRelativeTime(appointment.time),
                            style: hhTextTheme.titleSmall!.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (appointment.isWithinTwoHours)
              SizedBox(
                height: 32,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call_outlined,
                    size: 14,
                  ),
                  label: Text(
                    'Join call',
                    style: hhTextTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    backgroundColor: themeColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              )
            else
              Text(
                appointment.status.name.capitalize(),
                style: hhTextTheme.bodyMedium!.copyWith(
                  color: themeColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
