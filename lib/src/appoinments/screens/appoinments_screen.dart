import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('All Appointments'),
      ),
      body: Column(
        children: [
          // // Search Bar
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       prefixIcon: const Icon(Icons.search),
          //       hintText: 'Search by name, Id, birth date etc.',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          //     ),
          //   ),
          // ),

          // // Tab Bar
          // const TabSelector(),

          // // Appointment Counter and Filters
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Row(
          //     children: [
          //       const Text(
          //         '50 appointments',
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //       const Spacer(),
          //       IconButton(
          //         icon: const Icon(Icons.calendar_today),
          //         onPressed: () {},
          //         style: IconButton.styleFrom(
          //           backgroundColor: Colors.blue.withOpacity(0.1),
          //         ),
          //       ),
          //       const SizedBox(width: 8),
          //       TextButton.icon(
          //         onPressed: () {},
          //         icon: const Icon(Icons.filter_list),
          //         label: const Text('Filters'),
          //         style: TextButton.styleFrom(
          //           backgroundColor: Colors.grey.withOpacity(0.1),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // // Appointments List
          // Expanded(
          //   child: ListView.builder(
          //     padding: const EdgeInsets.all(16),
          //     itemCount: 10,
          //     itemBuilder: (context, index) {
          //       final isFirstAppointment = index == 0;
          //       return AppointmentCard(
          //         showJoinCall: isFirstAppointment,
          //         showCompleted: !isFirstAppointment,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class TabSelector extends StatelessWidget {
  const TabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            label: 'Upcoming',
            isSelected: true,
            onTap: () {},
          ),
          _TabButton(
            label: 'Completed',
            isSelected: false,
            onTap: () {},
          ),
          _TabButton(
            label: 'Cancelled',
            isSelected: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Colors.blue : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final bool showJoinCall;
  final bool showCompleted;

  const AppointmentCard({
    super.key,
    this.showJoinCall = false,
    this.showCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: const Icon(Icons.person_outline, color: Colors.blue),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patient name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'Today',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.access_time, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        'In 2 mins',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (showJoinCall)
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.video_call),
                label: const Text('Join call'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              )
            else if (showCompleted)
              const Text(
                'Completed',
                style: TextStyle(color: Colors.blue),
              ),
          ],
        ),
      ),
    );
  }
}
