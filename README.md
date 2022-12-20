
----------------

## Challenge Resume

In this project, an architecture based on Clean Architecture with layers such as domain, core, data and presentation was implemented.

### Functionalities

After the Splash screen, the user is forwarded to the Forward Page where he will have a login simulation screen.
After that, the home page is displayed with a list of restaurants with infinite pagination and a search field, where it can be filtered.
When you click on favorite the place, the restaurant will be sent to a list of favorites.
By clicking on the restaurant's card, the user is forwarded to its details, containing all available information.


### Structure

CORE 
  - Injectors
  - Exceptions
  - Responsiveness
  - Themes
  - Utils

In this folder, all the essential structure of the application and immutable are allocated, where they are the core of the project.

DATA 
  - Infra
  - Models
  - Repositories
  
This layer contains all kinds of data sources and models for these data to be used throughout the application.

DOMAIN 
  - Bloc
  - Interfaces
  - Use-cases
  
This folder contains all communication with the data source and organization of the business logic and rule.

PRESENTATION 
  - Components
  - Pages
  - Routes
  
And finally, we have the presentation layer, which is responsible for displaying all the data with all the rules applied, and displaying it in the best way possible for the user.


### Screenshots

<div>
<img src="https://drive.google.com/uc?id=1XeA7lUrD_hWNHNTvJNfUFK_SYOP5DMv6" height="400" width="200">
<img src="https://drive.google.com/uc?id=1IQeRw7raN-KcfLV8h3uje9kxRfSBO9kQ" height="400" width="200">
<img src="https://drive.google.com/uc?id=1VaSXCwqiR8mDDbf4D7HaBYBxtEegfH8q" height="400" width="200">
<img src="https://drive.google.com/uc?id=1rtwBfXEAQso0iie4n_birGyuXs26cESC" height="400" width="200">
<div/>

-----------------

## My most sincere thanks, enjoy the application.
## I am available for further questions.
