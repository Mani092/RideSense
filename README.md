# RideSense

A new Flutter project. This application shows the location entered by the user, then shows it on the next page with a marker.

## App Overview:
The app integrates **Google Places API** and **Google Maps** to allow users to search for a location and visualize it on an interactive map. It uses the **GetX** state management package to manage the user's selected location and transfer it across different screens.

### Key Features:

- **Location Search**: The app allows users to search for a location using the **Google Places Autocomplete API**. As the user types into the search bar, location suggestions appear in a list, which the user can tap to select.

- **Interactive Map**: After selecting a location from the search results, the app navigates to a map screen where the selected location is displayed using **Google Maps**. The latitude and longitude of the location are fetched using the **Google Place Details API**.

- **Marker on Selected Location**: Once the map is loaded, the app places a marker on the map at the exact coordinates (latitude and longitude) of the selected location.

### Screenshots:

<img src="https://github.com/user-attachments/assets/cddab7e1-083e-43a6-a4e1-30f827344dff" alt="Map View Screenshot" width="400" />

<img src="https://github.com/user-attachments/assets/886813ef-454c-467f-a5dc-044a1b603161" alt="Location Search Screenshot" width="400" />


