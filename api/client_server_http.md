# Client-Server Architecture & HTTP Basics

## Client and Server
- **Client** – requests data/services (browser, mobile app).
- **Server** – processes requests and sends back responses (remote computer with data).

**Request-Response principle**: Client sends request → Server processes → Server returns response.

## HTTP Methods (most common)
| Method | Purpose |
|--------|---------|
| GET | Retrieve data (read) |
| POST | Send data to create a new resource |
| PUT | Update an existing resource completely |
| DELETE | Remove a resource |

## HTTP Response Status Codes
### 2xx – Success
- 200 OK – request succeeded
- 201 Created – new resource created

### 4xx – Client errors (browser/user mistake)
- 400 Bad Request – malformed syntax
- 401 Unauthorized – authentication required
- 403 Forbidden – access denied
- 404 Not Found – resource does not exist

### 5xx – Server errors (server's fault)
- 500 Internal Server Error – generic server error
- 502 Bad Gateway – invalid response from upstream server
- 503 Service Unavailable – server overloaded or under maintenance
