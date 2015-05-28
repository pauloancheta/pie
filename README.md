# Picky Eater
A CodeCore final project

## Uses
The app filters the menu of the restaurant according to the dietary needs or allergies of the diner.
Once the diner has set their preferences, the menu will change to only what the diner could eat.

The restaurant user can create a menu, create dishes, associate recipes to the dishes and add ingredients to the recipes.

## Technical Aspects
The diner uses the same recipe model as the restaurant. For non-admin users (diners) a recipe is automatically created for them, the allergies goes in here. The diet is just a string that is used to match the category of each ingredient.

The admin user (restaurant) has a the ability to add an address. This address is then used for the geolocation for the google map.