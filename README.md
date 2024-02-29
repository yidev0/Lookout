# Lookout

## Decription

Project made for Swift Student Challenge 2023. 
The aim of this app is to help people explore new cities. 
The app uses MapKit to get nearby restaurants, bars, hotels, and more, in a simplified list only showing the distance to the location.

There is also a camera feature to help blind and low vision users cross roads by reading pedestrian traffic lights.
The camera will help users learn which way the traffic light is, and what color it currently is.

## Disclaimer

This project does not contain the CoreML model required to run the app. 
To create your own, please train your own object recognition model with labels "Car Blue", "Car Red", "Car Yellow", "Pedestrian Blue", "Pedestrian Red".

The labels with "Car" is for traffic lights used for cars, and blue represents the state which the car is allowed to go.

The labels with "Pedestrian" is for traffic lights used for pedestrians to walk across the street.

