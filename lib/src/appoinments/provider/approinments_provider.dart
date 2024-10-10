import 'package:appointments/src/appoinments/data/appointment_filters.dart';
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
    String currSearch = searchController.text;
    _currentTab = status;
    if (currSearch.isEmpty) {
      filterByStatus(status);
    } else {
      searchAppointments(currSearch, status);
    }
    if (_activeFilters.isActive) {
      clearAllFilters();
    }
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

  // Track active filters
  final AppointmentFilters _activeFilters = AppointmentFilters();
  AppointmentFilters get activeFilters => _activeFilters;

// Getter to check if any filters are active
  bool get hasActiveFilters => _activeFilters.isActive;

  // Apply a single filter
  void applySingleFilter({
    AppointmentMode? mode,
    AppointmentDuration? duration,
    String? type,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    if (mode != null) _activeFilters.mode = mode;
    if (duration != null) _activeFilters.duration = duration;
    if (type != null) _activeFilters.type = type;
    if (startDate != null) _activeFilters.startDate = startDate;
    if (endDate != null) _activeFilters.endDate = endDate;

    _applyActiveFilters();
    notifyListeners();
  }

  // Remove a single filter
  void removeSingleFilter(String filterType) {
    switch (filterType) {
      case 'mode':
        _activeFilters.mode = null;
        break;
      case 'duration':
        _activeFilters.duration = null;
        break;
      case 'type':
        _activeFilters.type = null;
        break;
      case 'dateRange':
        _activeFilters.startDate = null;
        _activeFilters.endDate = null;
        break;
    }

    _applyActiveFilters();
    notifyListeners();
  }

  // Internal method to apply all active filters
  void _applyActiveFilters() {
    filterByStatus(_currentTab);
    List<Appointments> filtered = _appointmentsList;

    if (_activeFilters.mode != null) {
      filtered = filtered
          .where((appointment) => appointment.mode == _activeFilters.mode)
          .toList();
    }

    if (_activeFilters.duration != null) {
      filtered = filtered
          .where(
              (appointment) => appointment.duration == _activeFilters.duration)
          .toList();
    }

    if (_activeFilters.type != null) {
      filtered = filtered
          .where((appointment) =>
              appointment.type.toLowerCase() ==
              _activeFilters.type!.toLowerCase())
          .toList();
    }

    if (_activeFilters.startDate != null && _activeFilters.endDate != null) {
      filtered = filtered.where((appointment) {
        return appointment.time.isAfter(
                _activeFilters.startDate!.subtract(const Duration(days: 1))) &&
            appointment.time
                .isBefore(_activeFilters.endDate!.add(const Duration(days: 1)));
      }).toList();
    }

    if (_activeFilters.isActive) {
      _appointmentsList = filtered;
    } else {
      filterByStatus(_currentTab);
    }
  }

  // Clear all filters
  void clearAllFilters() {
    _activeFilters.reset();
    filterByStatus(_currentTab);
  }
}
