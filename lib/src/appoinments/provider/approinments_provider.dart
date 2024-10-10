import 'package:appointments/src/appoinments/data/appointments.dart';
import 'package:appointments/src/appoinments/data/dummy_appointments.dart';
import 'package:flutter/widgets.dart'
    show ChangeNotifier, TextEditingController;

class ApproinmentsProvider extends ChangeNotifier {
  // List to store all appointments
  List<Appointments> _allAppointments = [];

  AppointmentType _currentTab = AppointmentType.upcoming;
  AppointmentType get currentTab => _currentTab;

  final TextEditingController searchController = TextEditingController();

  List<Appointments> _appointmentsList = [];
  List<Appointments> get appoinmentsList => _appointmentsList;

  // Default intialisation
  ApproinmentsProvider() {
    getAppointments();
  }

  // Initialize appointments
  getAppointments() {
    _allAppointments = List.from(dummyAppointments); // Store all appointments
    filterByStatus(_currentTab); // Apply initial tab filter
    notifyListeners();
  }

  // Tab selection
  void setTab(AppointmentType status) {
    _currentTab = status;

    String currSearch = searchController.text;

    if (currSearch.isEmpty) {
      filterByStatus(status);
    } else {
      searchAppointments(currSearch, status);
    }
    notifyListeners();
  }

  // Search appointments with status filter
  void searchAppointments(String query, AppointmentType status) {
    // If the query is empty, show all appointments
    if (query.isEmpty) {
      // If search is empty, show all appointments for current tab
      filterByStatus(status);
    } else {
      // First filter by status
      List<Appointments> statusFiltered = _allAppointments
          .where((appointment) => appointment.status == status)
          .toList();

      // Filter appointments based on the name or type or id
      _appointmentsList = statusFiltered.where((appointment) {
        return appointment.name.toLowerCase().contains(query.toLowerCase()) ||
            // appointment.type.toLowerCase().contains(query.toLowerCase()) ||
            appointment.id.contains(query);
      }).toList();
    }
    notifyListeners();
  }

  // Filter by Status
  void filterByStatus(AppointmentType status) {
    _appointmentsList = _allAppointments.where((appointment) {
      return appointment.status == status;
    }).toList();
    notifyListeners();
  }

  // Filter by Type
  void filterByType(String type) {
    _appointmentsList = _allAppointments.where((appointment) {
      return appointment.type.toLowerCase() == type.toLowerCase();
    }).toList();
    notifyListeners();
  }

  // Filter by Mode
  void filterByMode(AppointmentMode mode) {
    _appointmentsList = _allAppointments.where((appointment) {
      return appointment.mode == mode;
    }).toList();
    notifyListeners();
  }

  // Filter by Duration
  void filterByDuration(AppointmentDuration duration) {
    _appointmentsList = _allAppointments.where((appointment) {
      return appointment.duration == duration;
    }).toList();
    notifyListeners();
  }

  // Filter by Date Range
  void filterByDateRange(DateTime startDate, DateTime endDate) {
    _appointmentsList = _allAppointments.where((appointment) {
      return appointment.time.isAfter(startDate) &&
          appointment.time.isBefore(endDate);
    }).toList();
    notifyListeners();
  }

  // // Filter by Time of Day
  // void filterByTimeOfDay(TimeOfDay startTime, TimeOfDay endTime) {
  //   _appointmentsList = _appointmentsList.where((appointment) {
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
    _appointmentsList = _allAppointments.where((appointment) {
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
