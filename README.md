# Cab Booking App

This repository contains a **Cab Booking App** that includes three modules: **User App**, **Driver App**, and **Admin Panel**. The app allows users to book rides, drivers to accept rides, and the admin to manage pricing dynamically. The app leverages real-time communication using WebSockets and integrates Google Maps for navigation and route planning.

## Features

### User App
- **Ride Booking**: Users can search for nearby drivers and book a ride.
- **Real-time Ride Updates**: Users receive live updates on driver location and ride status.
- **Google Maps Integration**: Visualizes the driver's location, displays the route using polylines, and calculates the estimated time of arrival (ETA).
  
### Driver App
- **Ride Requests**: Drivers receive real-time ride requests and can accept or reject them.
- **Live Location Sharing**: Automatically shares the driver's live location with the user once the ride is accepted.
- **Ride Status Updates**: Drivers can update the status of the ride (arrived, trip started, trip ended).

### Admin Panel
- **Dynamic Price Control**: Admin can adjust ride pricing dynamically based on demand, traffic, or surge pricing rules.
- **Ride Monitoring**: Admin can monitor all ongoing rides and user-driver interactions.
- **Driver and User Management**: Admin can manage registered users and drivers from the dashboard.

## Tech Stack
- **Flutter**: Used for front-end development of the User and Driver apps.
- **WebSockets**: Implemented for real-time ride information and live updates between user and driver apps.
- **Google Maps API**: Integrated for navigation and setting polylines from pickup to drop locations.
- **Providers**: Used for state management within the app to handle app state efficiently.
- **GetX**: Utilized for navigation across various screens and routes in the app.
