# EventHub User Stories

## Event Creation and Management

### USER-001: Create Event
**As a** registered user,  
**I want to** create a new event with a title, text description, category, venue, date/time, and maximum capacity,  
**so that** I can organize activities for the university community.

### USER-002: Save Event as Draft
**As an** event organizer,  
**I want to** save my event as a draft without publishing it,  
**so that** I can work on it over time and publish when ready.

### USER-003: Publish Event
**As a** event organizer,  
**I want to** publish my draft event to make it visible to all users,  
**so that** people can discover and register for it.

### USER-004: Edit Own Event
**As a** event organizer,  
**I want to** edit the details of events I created while they are in draft or published state,  
**so that** I can update information or fix errors.

### USER-005: Cancel Own Event
**As a** event organizer,  
**I want to** cancel events I created,  
**so that** I can void all registrations if the event cannot proceed.

### USER-006: View Registered Attendees
**As a** event organizer,  
**I want to** see a list of users who have registered for my event,  
**so that** I can know who is coming and plan.

### USER-007: Rich Text Event Descriptions
**As a** event organizer,  
**I want to** format my event description with rich text (bold, italics, lists, links),  
**so that** I can present atractive information clearly.

## Event Discovery and Browsing

### USER-008: Browse All Events
**As a** registered user,  
**I want to** see a list of all published events,  
**so that** I can discover activities happening on campus.

### USER-009: Filter Events by Category
**As a** registered user,  
**I want to** filter events by category (workshops, sports, talks, social gatherings, study groups),  
**so that** I can quickly find events that match my interests.

### USER-010: View Event Details
**As a** registered user,  
**I want to** view detailed information about an event including description, venue, date/time, capacity, and current registration count,  
**so that** I can decide whether to attend.

### USER-011: View Venue Information
**As a** registered user,  
**I want to** see detailed venue information for each event,  
**so that** I know where the event will take place.

### USER-012: See Available Spots
**As a** registered user,  
**I want to** see how many spots are available for an event,  
**so that** I can know if registration is still possible or if I'll be waitlisted.

### USER-013: View Event Reviews
**As a** registered user,  
**I want to** read reviews and ratings from past attendees,  
**so that** I can make informed decisions about attending similar future events.

### USER-014: Browse Events by Status
**As a** registered user,  
**I want to** filter events by their status (published, ongoing, completed),  
**so that** I can see only relevant events like upcoming events I can register for.

## Registration and Waiting List

### USER-015: Register for Event
**As a** registered user,  
**I want to** register for a published event that has available capacity,  
**so that** I can secure my spot to attend.

### USER-016: Join Waiting List
**As a** registered user,  
**I want to** be automatically placed on the waiting list when I register for a full event,  
**so that** I can get a spot if someone cancels.

### USER-017: Automatic Waitlist Promotion
**As a** user on a waiting list,  
**I want to** be automatically promoted to confirmed status when a confirmed attendee cancels,  
**so that** I don't miss the opportunity to attend.

### USER-018: Cancel Registration
**As a** registered attendee,  
**I want to** cancel my registration for an event,  
**so that** I can free up my spot if my plans change.

### USER-019: Prevent Duplicate Registration
**As a** registered user,  
**I want to** be prevented from registering for the same event twice,  
**so that** I don't accidentally take multiple spots.

### USER-020: Cannot Register for Started Events
**As a** registered user,  
**I want to** be prevented from registering for events that have already started or ended,  
**so that** registration only applies to future events.

### USER-021: View My Registrations
**As a** registered user,  
**I want to** see all events I'm registered for 
**so that** I can manage my attendance plans.

### USER-022: See Registration Status
**As a** registered user,  
**I want to** clearly see whether my registration is confirmed or waitlisted,  
**so that** I know if I have a guaranteed spot.

## Reviews and Ratings

### USER-023: Leave Review for Attended Event
**As a** registered user who attended an event,  
**I want to** leave a rating (1-5 stars) and written comment after the event ends,  
**so that** I can share my experience with other users.

### USER-024: Only Review Attended Events
**As a** registered user,  
**I want to** only be able to review events that I actually attended and that have ended,  
**so that** reviews are authentic and relevant.

### USER-025: Edit My Review
**As a** user who left a review,  
**I want to** edit my review and rating,  
**so that** I can update my feedback if my perspective changes.

### USER-026: View Average Rating
**As a** registered user,  
**I want to** see the average rating for events,  
**so that** I can quickly assess event quality.

### USER-027: Only Review Completed Events
**As a** registered user,  
**I want to** only be able to leave reviews after an event has completed,  
**so that** reviews are based on actual experience, not expectations.

## Administrative Actions

### USER-028: Edit Any Event
**As an** administrator,  
**I want to** edit any event regardless of who created it,  
**so that** I can moderate content and fix issues in the platform.

### USER-029: Cancel Any Event
**As an** administrator,  
**I want to** cancel any event on the platform,  
**so that** I can remove inappropriate or problematic events.

### USER-030: Manage Categories
**As an** administrator,  
**I want to** create, edit, and delete event categories,  
**so that** I can organize the platform's events.

### USER-031: Manage Venues
**As an** administrator,  
**I want to** create, edit, and delete venues,  
**so that** event organizers have accurate location options.

### USER-032: Manage Users
**As an** administrator,  
**I want to** manage user accounts (activate, deactivate, assign roles),  
**so that** I can maintain platform security and quality.

### USER-033: Remove Inappropriate Reviews
**As an** administrator,  
**I want to** delete or edit user reviews,  
**so that** I can remove spam, harassment, or inappropriate content.

### USER-034: View Platform Analytics
**As an** administrator,  
**I want to** see statistics about events, registrations, and user activity,  
**so that** I can understand platform usage and make informed decisions.

## Authentication and Authorization

### USER-035: User Registration
**As a** visitor,  
**I want to** create an account with email and password,  
**so that** I can access EventHub features.

### USER-036: User Login
**As a** registered user,  
**I want to** log in with my credentials,  
**so that** I can access my personalized dashboard and activities.

### USER-037: User Logout
**As a** logged-in user,  
**I want to** log out of my account,  
**so that** I can secure my account when using shared devices.

### USER-038: Prevent Unauthorized Access
**As a** system,  
**I want to** prevent non-authenticated users from creating events or registering,  
**so that** only legitimate community members can participate.

## User Experience and Interface

### USER-039: Responsive Design
**As a** user on any device,  
**I want to** access EventHub on desktop, tablet, or mobile device,  
**so that** I can use the platform conveniently from anywhere.

### USER-040: Clear Navigation
**As a** user,  
**I want to** easily navigate between different sections (browse events, my events, my registrations, profile),  
**so that** I can quickly find what I need.

### USER-041: Receive Feedback Messages
**As a** user,  
**I want to** see clear success, error, and informational messages after performing actions,  
**so that** I know whether my action succeeded and what to do next.

### USER-042: View Validation Errors
**As a** user creating or editing content,  
**I want to** see clear validation error messages,  
**so that** I can fix issues and successfully complete my task.

### USER-043: Filter Events by Date
**As a** registered user,  
**I want to** filter events by date range (today, this week, this month, upcoming),  
**so that** I can find events happening when I'm available.

## Event Lifecycle Management

### USER-044: Automatic Status Transition to Ongoing
**As a** system,  
**I want to** automatically transition published events to "ongoing" status when their start time arrives,  
**so that** registration closes and the event status is accurate.

### USER-045: Automatic Status Transition to Completed
**As a** system,  
**I want to** automatically transition ongoing events to "completed" status when their end time passes,  
**so that** attendees can leave reviews and the event status is accurate.

### USER-046: View Event Lifecycle History
**As an** event organizer,  
**I want to** see when my event transitioned between lifecycle states,  
**so that** I can understand its progression and any issues.

### USER-047: Notification for Waitlist Promotion
**As a** user on a waiting list,  
**I want to** be notified when I'm promoted to confirmed status,  
**so that** I don't miss my opportunity to attend.

### USER-48: Cannot Edit Completed Events
**As an** event organizer,  
**I want to** be prevented from editing events that have completed,  
**so that** historical event data remains accurate.