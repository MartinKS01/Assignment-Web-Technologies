## Team Members

* Martin Karl Said - MartinKS01 - [mnkarl@miuandes.cl](mailto:mnkarl@miuandes.cl)
* Tomás Melin Perez - Melaooo - [trmelin@miuandes.cl](mailto:trmelin@miuandes.cl)

# EventHub

EventHub is a Ruby on Rails web application that allows members of the university community to create, discover, and participate in events such as workshops, talks, study groups, sports activities, and social gatherings.

The platform supports event registration with capacity limits and waiting lists, event reviews, authentication, and role-based authorization.

## Main Features

### Authentication

* User authentication implemented with Devise.
* User registration, login, logout, and account management.
* Protected routes requiring authentication.

### Authorization

* Role-based permissions implemented with CanCanCan.
* Two user roles:
  * Admin
  * Regular User

### Events

* Full CRUD functionality.
* Rich text descriptions using ActionText.
* Event lifecycle management:
  * Draft
  * Published
  * Finished
  * Cancelled
* Event organizer controls.

### Registrations

* Register for published events.
* Automatic waitlist management when capacity is reached.
* Automatic promotion from waitlist when a confirmed attendee cancels.

### Reviews

* Users can review events they attended.
* Reviews are only allowed for completed events.
* Ratings from 1 to 5 stars.

### Categories and Venues

* Full CRUD functionality.
* Admin-only management.

## Test Credentials

### Admin User

| Email                                     | Password    | Role  |
| ----------------------------------------- | ----------- | ----- |
| [admin@uandes.cl](mailto:admin@uandes.cl) | password123 | Admin |

### Regular Users

| Email                                             | Password    | Role    |
| ------------------------------------------------- | ----------- | ------- |
| [jperez@uandes.cl](mailto:jperez@uandes.cl)       | password123 | Regular |
| [mrojas@uandes.cl](mailto:mrojas@uandes.cl)       | password123 | Regular |
| [cgonzalez@uandes.cl](mailto:cgonzalez@uandes.cl) | password123 | Regular |
| [amartinez@uandes.cl](mailto:amartinez@uandes.cl) | password123 | Regular |

## Roles and Permissions

| Action                            | Regular User | Admin |
| --------------------------------- | ------------ | ----- |
| Browse events, venues, categories | Yes          | Yes   |
| Create events                     | Yes          | Yes   |
| Edit/cancel own events            | Yes          | Yes   |
| Edit/cancel any event             | No           | Yes   |
| Register for events               | Yes          | Yes   |
| Cancel own registration           | Yes          | Yes   |
| Review attended events            | Yes          | Yes   |
| Manage categories                 | No           | Yes   |
| Manage venues                     | No           | Yes   |
| Manage users                      | No           | Yes   |
| Delete any review                 | No           | Yes   |
| Access admin dashboard            | No           | Yes   |

## Setup Requirements

* Ruby 3.3.6
* Rails 8.1.3
* PostgreSQL
* Node.js
* Yarn

## Installation

### Install dependencies

```bash
bundle install
npm install
```

### Database setup

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

### Run the application

```bash
bin/dev
```

The application will be available at:

```text
http://localhost:3000
```

## Business Rules

### Registration Management

* Users can only register for published events.
* If capacity is available, registration status becomes confirmed.
* If the event is full, registration status becomes waitlisted.
* When a confirmed attendee cancels, the first user in the waiting list is automatically promoted.

### Reviews

* Users can only review events they attended.
* Users must have a confirmed registration.
* Events must be finished before reviews can be submitted.
* Ratings must be between 1 and 5.

### Event Lifecycle

* Events are created as Draft by default.
* Organizers can publish draft events.
* Organizers can cancel draft or published events.
* Registration is restricted based on event status.

## Technologies Used

* Ruby on Rails 8
* PostgreSQL
* Bootstrap 5
* Devise
* CanCanCan
* ActionText
* ESBuild
