import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatAppointmentDate(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final dateToCheck = DateTime(dateTime.year, dateTime.month, dateTime.day);

    // Time formatter
    final timeFormat = DateFormat('h:mm a');

    if (dateToCheck == today) {
      return 'Today at ${timeFormat.format(dateTime)}';
    } else if (dateToCheck == tomorrow) {
      return 'Tomorrow at ${timeFormat.format(dateTime)}';
    } else {
      // Within the next 7 days
      final difference = dateToCheck.difference(today).inDays;
      if (difference > 0 && difference < 7) {
        final dayFormat = DateFormat('EEEE'); // Full day name
        return '${dayFormat.format(dateTime)} at ${timeFormat.format(dateTime)}';
      }

      // This year
      if (dateTime.year == now.year) {
        final dateFormat = DateFormat('MMM d'); // e.g., "Oct 5"
        return '${dateFormat.format(dateTime)} at ${timeFormat.format(dateTime)}';
      }

      // Different year
      final dateFormat = DateFormat('MMM d, y'); // e.g., "Oct 5, 2024"
      return '${dateFormat.format(dateTime)} at ${timeFormat.format(dateTime)}';
    }
  }

  static String getRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);

    if (difference.isNegative) {
      // Past appointments
      if (difference.inDays < -1) {
        return '${-difference.inDays} days ago';
      } else if (difference.inHours < -1) {
        return '${-difference.inHours} hours ago';
      } else if (difference.inMinutes < -1) {
        return '${-difference.inMinutes} minutes ago';
      } else {
        return 'Just now';
      }
    } else {
      // Upcoming appointments
      if (difference.inDays > 0) {
        return 'In ${difference.inDays} days';
      } else if (difference.inHours > 0) {
        return 'In ${difference.inHours} hours';
      } else if (difference.inMinutes > 0) {
        return 'In ${difference.inMinutes} minutes';
      } else {
        return 'Now';
      }
    }
  }

  static String getAppointmentTimeSlot(DateTime start,
      {Duration duration = const Duration(minutes: 30)}) {
    final end = start.add(duration);
    final timeFormat = DateFormat('h:mm a');
    return '${timeFormat.format(start)} - ${timeFormat.format(end)}';
  }

  static String getMonthDay(DateTime date) {
    return DateFormat('MMM d').format(date);
  }

  static String getDayName(DateTime date) {
    return DateFormat('EEEE').format(date);
  }
}
