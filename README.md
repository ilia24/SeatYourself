# SeatYourself (An opentable clone)

* As a user...

...I am presented with a list of restaurants on the homepage.
...I can sign up, login, and logout.
...on the page for a restaurant I can make a reservation if I am logged in.
...I can go to a page to see a list of the reservations I’ve booked.
...I can go to a page to see the list of restaurants sorted by cuisines.


Writing code is only one part of software development. As projects get larger, you will need to start planning things out before you start coding.

The following steps are considered to be pretty useful when it comes to planning and modelling your application.

Planning Your Project

This is the first project you're working on that you might not be able to finish. Often in software, there is more to do than there is time. We must therefore learn to assess and prioritize, and in some cases, make sacrifices.

Step 1

We'll want to:

Decide what problems we are trying to solve
Think about who will be using our application
Decide what our goals are, and what "done" will look like
Understand our constraints, e.g. when the project must be completed, what the budget is, etc.
Decide on what features are absolutely necessary versus optional
A good philosophy is, after understanding the problem well, to write the least amount of code to meet a given set of requirements and once those requirements are met, ask if the product owner would like to add more functionality. This is a much more focused approach than guessing what functionality they might want in the future. You would be surprised at how much information is lost in translation from one person to the next.

User Stories

At this stage, a useful tool is to write user stories. Here are some user stories we might write for Seat Yourself.

As a visitor, I want to see a directory of the restaurants available.
As a visitor, when I click on a restaurant, I want to be able to see:
address
neighbourhood
price range
summary
menu
a list of available timeslots
As a visitor, I want to sign up for a customer account so that I can make reservations online.
As a customer, I want to be able to make a reservation online.
As a customer, I want to receive loyalty points when I make a reservation.
As a customer, I want to see my loyalty points in my account profile.
As a customer, I want to receive an email confirmation after I've made a reservation.
As the restaurant owner, I want to see the list of the weeks reservations.
As the restaurant owner, I want to see my customer list with how many points each person has and how much they have spent online.
As a visitor, I would like to be able to view restaurants based on their cuisine category (e.g. Italian). This can be down with a drop-down menu using collection_select.
A restaurant can only be open from 11am - 8pm, 7 days a week.
A restaurant can only hold 100 people in any given time slot.
A reservation can be for a party of 2 to 20 people.
Step 2

Now that we have a good understanding to the above questions, we can refine our plans and make them more concrete. Here we want to

create mockups
draw out what entities (models in Rails) we will need and how they will relate to each other (associations in Rails)
Mockups

Once we understand the general picture of the application, lets create static web pages to guide the construction of our application. Below is a passage from the blog article A Comprehensive Guide to Mockups in Web Design:

A "Mockup" is a refinement of the conceptual user interface design and results in a more or less realistic, though static simulation of the user interface. You may build on the wireframe with dummy text, color, graphics and polish, and may adjust layout slightly but stays within the general guide of the wireframe.

A mockup lets you know which information goes where. – You know which information goes where before you start writing the functional analysis or request for offer.
Can be used for design implementation. – Which means it’s possible to test your layout concept and trend before you’ve written a single word of code. Changes in the concept are easily and cheaply fixed.
Attention to detail. – About functionality and make sure you have visitor’s perspective. You can gauge which functions work better than others, and which conflict with overall usability
Flexibility. – Changes, delete or even add more points about your ideas and concept are easily.
Valuable service. – If you can give potential clients this mockup as a free service, it means you can provide more value that other designers/developers out there.
As part of the proposal. – If the client is huge, lucrative, prestigious, and interesting then perhaps you could invest some time in winning this job by providing a mockup. Be careful when providing mockups that you are sure to have them sign a legal document stating that they cannot use any part of your concept or design without paying for it. Sometimes unscrupulous clients will have you do a mock up and then use it without hiring you!
Remember that your job depends on this phase. – Clients will appreciate your work. This is important how you can often win a client’s approval through your mockup design. If your client was happy for what you’ve done with mockup design, the next phase of this job will be very easy for you
Here are a couple of example mockups to get you started:

Original Twitter Concept

Original Twitter Concept

Vimeo Profile Page Idea

Vimeo Profile Page Idea

5 Years of Firefox

5 Years of Firefox

Create mockups for Seat Yourself based on the user stories and translate them into static HTML pages that look like a fully functioning application.

Entity-relationship (ER) Modeling

This is a fancy way of saying that you need to decide what entities (models in Rails) you will want and how they will relate to each other (associations in Rails). An ER model is an abstract way of describing a database. Diagrams created to design these entities and relationships are called entity–relationship diagrams or ER diagrams. Wikipedia

Example ER Model

Model Your Entities

Using the above as an example, first we'll make a diagram to represent our models. At a minimum, the models we will need are:

User
Restaurant
Reservation
Category
Step 3

Now that you have a good idea of what you're going to build, you need to decide the order in which you will build all the parts. How do you do that?

Think about dependencies. Creating a Reservation is dependent on the existence of a Restaurant and a User. Therefore, you will first create the Restaurant and User models, and then add the Reservations model
A good tactic is to plan your application in steps, such that each step is a minimally useful website. So if you create a Restaurant model, then create a RestaurantController and set up the CRUD (7 RESTful actions) so that you can add and view Restaurants before you create the User model. You don't want to create two models, before you have one model that does anything.
Testing Your Rails App

We realize that you have learned a large number of new concepts in a short amount of time and are trying to tackle a difficult problem with no clearly defined solution. Ideally this problem would be solved through a process of Test Driven Development, but we think it is more important to understand the basics of the application before you get comfortable with the TDD workflow. We will use a Verification Testing methodology to check that the application functions as expected.

Complete the following

We would like you to now be able to lean against your tests when refactoring your code, but in order to do so you will need to write at least the following tests.

Setting up your factories.

Create a factory for a category
Create a factory for a user
Create a factory for a restaurant, if it belongs to anything, please make that association in your factory
Create a factory for a reservation, if it belongs to anything, please make that association in your factory
Reservation Tests

When a restaurant is full, it should not be available for reservations
A user should not be able to make a reservation outside of operating hours
User Tests

A user's name is required
A user's email is required
A user's password and password_confirmation are required
A user's password_confirmation must match password
An unsafe user password should not authenticate
A safe user password should authenticate
Two users cannot have the same email
Category Tests

A category should have a name
Restaurant Tests

A restaurant must have a name
A restaurant must have an address
A restaurant must have a phone number
A restaurant must have a picture
A restaurant must have a description
A restaurant must belong to a category
A restaurant must not be able to accept more people than it's capacity
