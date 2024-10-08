import 'package:appointments/src/appoinments/data/appointments.dart';
import 'package:flutter/widgets.dart'
    show ChangeNotifier, TextEditingController;

class ApproinmentsProvider extends ChangeNotifier {
  List<Appointments> _appointmentsList = [];
  List<Appointments> get appoinmentsList => _appointmentsList;

  AppointmentType _currentTab = AppointmentType.upcoming;
  AppointmentType get currentTab => _currentTab;

  final List<Appointments> _dummyAppointments = [
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

  //### Initialize appointments
  getAppointments() {
    _appointmentsList.addAll(_dummyAppointments);
    _filteredAppointments = _appointmentsList;
    notifyListeners();
  }

  ApproinmentsProvider() {
    setTab(currentTab);
  }

  //### tab selection
  void setTab(AppointmentType status) {
    _appointmentsList.clear();
    searchController.clear();
    getAppointments();
    _currentTab = status;
    filterByStatus(status);
    _appointmentsList = _filteredAppointments;
    notifyListeners();
  }

  //### For search results
  List<Appointments> _searchResults = [];
  List<Appointments> get searchResults => _searchResults;

  // Search function
  void searchAppointments(String query) {
    // If the query is empty, show all appointments
    if (query.isEmpty) {
      _appointmentsList.clear();
      _appointmentsList = _searchResults;
    } else {
      // Filter appointments based on the name or type
      _searchResults = _dummyAppointments.where((appointment) {
        return appointment.name.toLowerCase().contains(query.toLowerCase()) ||
            appointment.type.toLowerCase().contains(query.toLowerCase()) ||
            appointment.id.contains(query);
      }).toList();
      _appointmentsList = _searchResults;
    }

    // Notify listeners so the UI can update
    notifyListeners();
  }

  final TextEditingController searchController = TextEditingController();

  //### For Filters
  List<Appointments> _filteredAppointments = [];
  List<Appointments> get filteredAppointments => _filteredAppointments;

  // Filter by Status
  void filterByStatus(AppointmentType status) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.status == status;
    }).toList();
    notifyListeners();
  }

  // Filter by Type
  void filterByType(String type) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.type.toLowerCase() == type.toLowerCase();
    }).toList();
    notifyListeners();
  }

  // Filter by Mode
  void filterByMode(AppointmentMode mode) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.mode == mode;
    }).toList();
    notifyListeners();
  }

  // Filter by Duration
  void filterByDuration(AppointmentDuration duration) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.duration == duration;
    }).toList();
    notifyListeners();
  }

  // Filter by Date Range
  void filterByDateRange(DateTime startDate, DateTime endDate) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      return appointment.time.isAfter(startDate) &&
          appointment.time.isBefore(endDate);
    }).toList();
    notifyListeners();
  }

  // // Filter by Time of Day
  // void filterByTimeOfDay(TimeOfDay startTime, TimeOfDay endTime) {
  //   _filteredAppointments = _appointmentsList.where((appointment) {
  //     final appointmentTime = TimeOfDay.fromDateTime(appointment.time);
  //     return (appointmentTime.hour >= startTime.hour &&
  //         appointmentTime.hour <= endTime.hour);
  //   }).toList();
  //   notifyListeners();
  // }

  // Apply multiple filters (Status, Type, Mode, Duration, etc.)
  void applyFilters({
    AppointmentType? status,
    String? type,
    AppointmentMode? mode,
    AppointmentDuration? duration,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    _filteredAppointments = _appointmentsList.where((appointment) {
      bool matchesStatus = status == null || appointment.status == status;
      bool matchesType =
          type == null || appointment.type.toLowerCase() == type.toLowerCase();
      bool matchesMode = mode == null || appointment.mode == mode;
      bool matchesDuration =
          duration == null || appointment.duration == duration;
      bool matchesDateRange = startDate == null ||
          endDate == null ||
          (appointment.time.isAfter(startDate) &&
              appointment.time.isBefore(endDate));

      return matchesStatus &&
          matchesType &&
          matchesMode &&
          matchesDuration &&
          matchesDateRange;
    }).toList();

    notifyListeners();
  }
}
