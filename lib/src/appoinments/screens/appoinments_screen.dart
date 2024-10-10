import 'package:appointments/src/appoinments/data/appointments.dart';
import 'package:appointments/src/appoinments/provider/approinments_provider.dart';
import 'package:appointments/src/appoinments/widgets/appointment_card.dart';
import 'package:appointments/src/appoinments/widgets/filters_ui.dart';
import 'package:appointments/src/appoinments/widgets/search_bar.dart';
import 'package:appointments/src/appoinments/widgets/status_tab_bar.dart';
import 'package:appointments/src/theme/colors.dart';
import 'package:appointments/src/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  late ApproinmentsProvider approinmentsProvider;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    approinmentsProvider = ApproinmentsProvider();
  }

  @override
  void dispose() {
    _pageController.dispose();
    approinmentsProvider.searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(
            'All Appointments',
            style: hhTextTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: Container(
        color: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            // Search Bar
            const SearchAppointmentBar(),
            // Tab Bar
            // This Consumer is Needed to rebuilt the StatusBar
            Consumer<ApproinmentsProvider>(
              builder: (context, approinmentsProvider, _) {
                return StatusTabBar(
                  onTabSelected: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                );
              },
            ),

            // Appointment Counter and Filters
            const FiltersUI(),

            // Appointments List
            Expanded(
              child: Consumer<ApproinmentsProvider>(
                builder: (context, provider, child) {
                  return PageView.builder(
                    controller: _pageController,
                    itemCount: AppointmentType.values.length,
                    onPageChanged: (index) {
                      final newStatus = AppointmentType.values[index];
                      provider.setTab(newStatus);
                    },
                    itemBuilder: (context, pageIndex) {
                      return ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: provider.appoinmentsList.length,
                        itemBuilder: (context, index) {
                          var appointment = provider.appoinmentsList[index];
                          return AppointmentCard(
                            appointment: appointment,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
