{
  "openapi": "3.0.0",
  "info": {
    "title": "API Documentation",
    "description": "",
    "version": "1.0"
  },
  "paths": {
    "/movies": {
      "post": {
        "summary": "Create a movie",
        "tags": [
          "Movies"
        ],
        "description": "",
        "parameters": [
          {
            "name": "Accept",
            "in": "header",
            "example": "application/json"
          },
          {
            "name": "Content-Type",
            "in": "header",
            "example": "application/json"
          }
        ],
        "requestBody": {
          "content": {
            "application/json": {
              "examples": {
                "creates movie": {
                  "summary": "creates movie",
                  "value": {
                    "name": "Movie",
                    "imdb_id": "imdb"
                  }
                }
              }
            }
          }
        },
        "responses": {
          "200": {
            "description": "OK",
            "content": {
              "application/json; charset=utf-8": {
                "examples": {
                  "creates movie": {
                    "summary": "creates movie",
                    "value": {
                      "success": true,
                      "id": 177,
                      "name": "Movie",
                      "imdb_id": "imdb",
                      "price": 0,
                      "rating": {
                        "average_rating": "0.0",
                        "total_votes": null
                      },
                      "showtimes": [

                      ]
                    }
                  }
                }
              }
            },
            "headers": {
              "Content-Type": {
                "description": "application/json; charset=utf-8"
              }
            }
          }
        }
      }
    }
  },
  "tags": [
    {
      "name": "Movies",
      "description": ""
    }
  ],
  "x-tagGroups": [
    {
      "name": "Movies",
      "tags": [
        "Movies"
      ]
    }
  ]
}
