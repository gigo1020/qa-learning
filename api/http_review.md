# HTTP Review

## What is HTTP?
HTTP (HyperText Transfer Protocol) is a protocol for transferring data between a client (browser, app) and a server

## HTTP Methods
- **GET** – retrieve data. Example: get list of posts, an image, order status.
- **POST** – send data to create a new resource. Example: create a new user, add product in the catalog.
- **PUT** – completely replace an existing resource. Requires all fields.
- **PATCH** - partially replace object data. Only need to specify the fields that you want to change.
- **DELETE** – remove a resource. Example: delete a post, an item, an image.

## Response Status Code Groups
- **1xx** – informational (100 Continue)
- **2xx** – success (200 OK, 201 Created, 204 No Content)
- **3xx** – redirection (301 Moved Permanently, 302 Found, 307 Temporarily moved)
- **4xx** – client error (400 Bad Request, 401 Need Authorization, 403 Forbidden, 404 Not Found)
- **5xx** – server error (500 Internal Server Error, 503 Service Unavailable)

## Headers (examples)
- `Content-Type: application/json` – body format is JSON
- `Authorization: Bearer <token>` – authentication
- `User-Agent` – identifies the client (browser, tool)

## Body
- **Request body** – data sent to the server (e.g., JSON in POST, PUT, PATCH)
- **Response body** – data returned by the server (e.g., JSON with requested info)