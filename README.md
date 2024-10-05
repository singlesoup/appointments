# appointments

Added

- Structured code
- Clean UI
- Search Suggestions
- Suggestion tap not implemented yet
- Status Tab selection
- Code is setup to added filters (not plugged to UI yet)
- Multiple extensions added for more functionalities

## Demo


https://github.com/user-attachments/assets/62eab193-56fe-4a9f-8cf2-227fe1ee2713

## Implementation:

- [ ] Implement the screen using Flutter widgets and layouts.
- [ ] Implement functional search with suggestions.
- [ ] Implement a swipeable tab bar with three tabs: 
    - Upcoming
    - Completed
    - Cancelled appointments
- [ ] Add a "Join Call" button for appointments that are within 2 hours of the current time.
- [ ] Create and implement a filter UI that allows users to filter appointments based on various criteria (e.g., date, appointment type).
  
### State Management:

- [ ] Use the Provider package for state management:
    - [ ] Create a model class for an appointment with properties like name, time, type, status, etc.
    - [ ] Implement a Provider to hold the list of appointments.
    - [ ] Ensure that the search bar and filters interact correctly with the appointment list to display the right results.

## Bonus:

- [ ] Implement dummy navigation items in the bottom bar and make the "Appointments" tab functional.
- [ ] Add basic animations to transitions between tabs.
- [ ] Use geolocation to allow location-based filtering if applicable.



- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
