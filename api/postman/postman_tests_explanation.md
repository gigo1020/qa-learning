# Postman tests for JSONPlaceholder API

## Purpose
To demonstrate how to write automated tests in Postman using JavaScript (`pm.test`, `pm.expect`). Tests validate status codes, response structure, data types, and values.

## Test scenarios and checks

### 1. GET all posts (`{{baseUrl}}/posts`)
- Status code is 200
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

- Response body is an array
pm.test("Response is an array", function () {
    const jsonData = pm.response.json();
    pm.expect(Array.isArray(jsonData)).to.be.true;
});

- Array length > 0 (ensures data exists)
pm.test("Array length > 0", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.length).to.be.greaterThan(0);
});

- First post has `id` (number) and `title` (string)
pm.test("First post has id (number) and title (string)", function () {
    const jsonData = pm.response.json();
    if (jsonData.length > 0) {
        pm.expect(jsonData[0]).to.have.property('id').that.is.a('number');
        pm.expect(jsonData[0]).to.have.property('title').that.is.a('string');
    }
});

**Why these checks?**  
We want to confirm that the API returns a non-empty list of posts with correct data types.

### 2. GET a single post (`{{baseUrl}}/posts/1`)
- Status code 200

- `id` equals 1
pm.test("id equals 1", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.id).to.equal(1);
});
- `title` is not empty
pm.test("Title is not empty", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.title).to.be.a('string').and.not.empty;
});

- Contains `userId` and `body` fields
pm.test("Has userId and body fields", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData).to.have.property('userId');
    pm.expect(jsonData).to.have.property('body');
});


**Why?**  
Verifies that a specific resource is retrieved correctly and required fields are present.

### 3. GET comments for post 1 (`{{baseUrl}}/comments?postId=1`)
- Status code 200
- Response is an array
- The first comment has all required fields: `postId`, `id`, `name`, `email`, `body`
pm.test("First comment has all required fields", function () {
    const jsonData = pm.response.json();
    if (jsonData.length > 0) {
        pm.expect(jsonData[0]).to.have.property('postId');
        pm.expect(jsonData[0]).to.have.property('id');
        pm.expect(jsonData[0]).to.have.property('name');
        pm.expect(jsonData[0]).to.have.property('email');
        pm.expect(jsonData[0]).to.have.property('body');
    }
});

- Every comment has `postId === 1` (using a loop)
pm.test("All comments have postId === 1", function () {
    const jsonData = pm.response.json();
    jsonData.forEach(comment => {
        pm.expect(comment.postId).to.equal(1);
    });
});

**Why?**  
Ensures that filtering works (only comments belonging to post 1 are returned) and that the response structure is consistent.

## How tests are written
- `pm.response.to.have.status(200)` – checks HTTP status
- `pm.response.json()` – parses JSON response
- `pm.expect(...)` – assertions 
- `Array.isArray()` – verifies response is an array
- `jsonData.forEach(...)` – iterates over array to check each item

## What I learned
- Using environment variables (`{{baseUrl}}`) to switch API endpoints easily.
- Writing reusable test scripts inside Postman.
- Basic JavaScript constructs: `const`, `if`, `forEach`, property existence checks.

These tests run automatically after each request, making regression testing faster and more reliable.