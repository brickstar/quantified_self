# Quantified Self

This application is a back-end API that serves up data for meals eaten for the purpose of tracking calories.

This API has been deployed to heroku [here](https://rocky-chamber-88480.herokuapp.com)

## Versions

Ruby 2.4.1
Rails 5.2.1

This API has the following end-points:

## Foods Endpoints
`GET /api/v1/foods`<br>
`Status: 200`<br>
Returns all foods
```json
[
  {
    "id": 1,
    "name": "Apple",
    "calories": 200
  },
  {
    "id": 2,
    "name": "Orange",
    "calories": 200
  },
  {
    "id": 3,
    "name": "Banana",
    "calories": 200
  }
]
```

`GET /api/v1/foods/:id`<br>
Returns a single food
`Status: 200`<br>
```json 
{
  "id": 1,
  "name": "Apple",
  "calories": 200
}
```

`POST /api/v1/foods`<br>
Creates a new food

`DELETE /api/v1/foods/:id`<br>
Deletes a food

`PATCH /api/v1/foods/:id`<br>
Updates a food

## Meals Endpoints
`GET /api/v1/meals`<br>
`Status: 200`<br>
Returns all meals and associated foods

`GET /api/v1/meals/:meal_id/foods`<br>
Returns all foods for a single meal

`POST /api/v1/meals/:meal_id/foods/:id`<br>
Adds a food to a meal

`DELETE /api/v1/meals/:meal_id/foods/:id`<br>
Removes a food from a meal

## Favorite Foods Endpoints
`GET /api/v1/favorite_foods`<br>
Returns top 3 foods by times eaten

