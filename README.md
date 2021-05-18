# README

Hello. It is simple Liderboard store application.

Run

rails db:create

rails db:migrate

rails s

You need to create key for every you app. 
GET /api/v1/create_key
{
    "id": 7,
    "key": "ZRvxqnNfSjUnLcPeMejXpmCWZTefjQLCBDFPGLujUauWUeLYON",
    "created_at": "2021-05-18T06:48:36.384Z",
    "updated_at": "2021-05-18T06:48:36.384Z"
}

You can add your score
POST /api/v1/liderboard
{ 

	"key": "ADaHZZRVbrMzXSviZpExRUveREhlrVPwchVitnlyRQrtDbkHtg",
	"user_name": "6",
    "score": 2
}
Result 
{

    "key_id": 4,
    "id": 8,
    "user_name": "6",
    "score": 22.0,
    "created_at": "2021-05-18T06:09:50.525Z",
    "updated_at": "2021-05-18T06:45:35.835Z"
}

And you can get liderboard results
GET /api/v1/records?key=ADaHZZRVbrMzXSviZpExRUveREhlrVPwchVitnlyRQrtDbkHtg&limit=20&user_name=1533&format=text
format=text or format=text
user_name for define current user position.
Result will contain only newest unique results by score.

format=text
{ 
    "score": 1.0,
    "position": 3,
    "records": [
        "user1 - 100223.0",
        "user2 - 22.0",
        "user3 (YOU) - 1.0"
    ]
}

format=json
{
    "score": 1.0,
    "position": 3,
    "records": [
        {
            "score": 100223.0,
            "user_name": "user1"
        },
        {
            "score": 22.0,
            "user_name": "user2"
        },
        {
            "score": 1.0,
            "user_name": "user3 (YOU)"
        }
    ]
}
