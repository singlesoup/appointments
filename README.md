# appointments

Added

- Structured code
- Clean UI
- Search
- Filters
- Suggestion tap not implemented yet
- Status Tab selection
- Code is setup to added filters (not plugged to UI yet)
- Multiple extensions added for more functionalities

## Demo


https://github.com/user-attachments/assets/62eab193-56fe-4a9f-8cf2-227fe1ee2713

## Implementation:

- [x] Implement the screen using Flutter widgets and layouts.
- [x] Implement functional search with suggestions.
- [X] Implement a swipeable tab bar with three tabs: 
    - Upcoming
    - Completed
    - Cancelled appointments
- [x] Add a "Join Call" button for appointments that are within 2 hours of the current time.
- [ ] Create and implement a filter UI that allows users to filter appointments based on various criteria (e.g., date, appointment type).
  
### State Management:

- [x] Use the Provider package for state management:
    - [x] Create a model class for an appointment with properties like name, time, type, status, etc.
    - [x] Implement a Provider to hold the list of appointments.
    - [X] Ensure that the search bar and filters interact correctly with the appointment list to display the right results.

## Bonus:

- [x] Implement dummy navigation items in the bottom bar and make the "Appointments" tab functional.
- [X] Add basic animations to transitions between tabs.
- [ ] Use geolocation to allow location-based filtering if applicable.



- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
