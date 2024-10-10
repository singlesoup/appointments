import 'package:appointments/src/appoinments/data/appointments.dart';

final List<Appointments> dummyAppointments = [
  Appointments(
    id: 'HH-1',
    name: 'Smith',
    time: DateTime.now().add(const Duration(hours: 1)), // Upcoming
    type: 'General',
    status: AppointmentType.upcoming,
    duration: AppointmentDuration.long,
    mode: AppointmentMode.virtual,
  ),
  Appointments(
    id: 'HH-2',
    name: 'Adams',
    time: DateTime.now().add(const Duration(days: 3)), // Upcoming
    type: 'General',
    status: AppointmentType.upcoming,
    duration: AppointmentDuration.medium,
    mode: AppointmentMode.inperson,
  ),
  Appointments(
    id: 'HH-3',
    name: 'Patel',
    time: DateTime.now().subtract(const Duration(days: 2)), // Completed
    type: 'General',
    status: AppointmentType.completed,
    duration: AppointmentDuration.short,
    mode: AppointmentMode.inperson,
  ),
  Appointments(
    id: 'HH-4',
    name: 'Lee',
    time: DateTime.now().subtract(const Duration(days: 1)), // Cancelled
    type: 'General',
    status: AppointmentType.cancelled,
    duration: AppointmentDuration.medium,
    mode: AppointmentMode.inperson,
  ),
  Appointments(
    id: 'HH-5',
    name: 'Johnson',
    time: DateTime.now().add(const Duration(hours: 5)), // Upcoming
    type: 'General',
    status: AppointmentType.upcoming,
    duration: AppointmentDuration.long,
    mode: AppointmentMode.inperson,
  ),
  Appointments(
    id: 'HH-6',
    name: 'Brown',
    time: DateTime.now().subtract(const Duration(days: 4)), // Completed
    type: 'General',
    status: AppointmentType.completed,
    duration: AppointmentDuration.short,
    mode: AppointmentMode.virtual,
  ),
  Appointments(
    id: 'HH-7',
    name: 'Miller',
    time: DateTime.now().add(const Duration(minutes: 90)), // Within 2 hours
    type: 'General',
    status: AppointmentType.upcoming,
    duration: AppointmentDuration.long,
    mode: AppointmentMode.virtual,
  ),
  Appointments(
    id: 'HH-8',
    name: 'Wilson',
    time: DateTime.now().add(const Duration(days: 7)), // Upcoming
    type: 'General',
    status: AppointmentType.upcoming,
    duration: AppointmentDuration.long,
    mode: AppointmentMode.inperson,
  ),
  Appointments(
    id: 'HH-9',
    name: 'Garcia',
    time: DateTime.now().subtract(const Duration(days: 10)), // Completed
    type: 'General',
    status: AppointmentType.completed,
    duration: AppointmentDuration.long,
    mode: AppointmentMode.inperson,
  ),
  Appointments(
    id: 'HH-10',
    name: 'Martinez',
    time: DateTime.now().subtract(const Duration(days: 3)), // Cancelled
    type: 'General',
    status: AppointmentType.cancelled,
    duration: AppointmentDuration.medium,
    mode: AppointmentMode.inperson,
  ),
];
