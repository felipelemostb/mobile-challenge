# Wedigitek React Native Challenge

You are free to use any libraries that you feel needed to complete the following tasks, but we will highly value the usage of:

- [Redux](https://github.com/reduxjs/redux)
- [Redux-Saga](https://github.com/redux-saga/redux-saga)
- [React Navigation](https://github.com/react-navigation/react-navigation)

## Tasks

### **1. List restaurants**

- [ ] The initial app screen should display a list of restaurants (like Uber Eats, iFood and similar apps) populated from this endpoint: https://api.dev.wdtek.xyz/restaurants
- [ ] The list should be paginated (infinite scroll). The endpoint accepts the query params `offset` and `limit` to help you with the pagination.
- [ ] Keep the design simple - showing the restaurant's image and name should be enough here.

### **2. Restaurant details**

- [ ] When a user presses on a restaurant row, the app should open a new screen displaying the selected restaurant information: https://api.dev.wdtek.xyz/restaurants/{_id} (example \_id: `5ea88c9fce27ef5586174f57`)
- [ ] The details screen should present: restaurant's image, name, address, contacts and cuisines.

### **3. Favorite restaurants**

We would like you to add a "favorites" feature to the app. The requirements are:

- [ ] A user can mark "star" restaurants as favorites both from the list and details page for all items.
- [ ] The user is able to unfavorite restaurants from the list and from the details page.
- [ ] The list is persisted after the app is closed (but everything is stored locally for now).

## Practicalities

When you're ready to submit your challenge, share the link to your repo with us.
If you prefer to keep it private, we will provide you with some emails to invite
to the repo.

We're excited to have you take on this challenge and looking forward to seeing
your solution.

Happy coding!
