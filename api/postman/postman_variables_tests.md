# Postman: Variables, Environments, and Basic Tests

## Variables in Postman
Variables store values that can be reused across requests. Syntax: `{{variableName}}`.

**Types of variables (by scope):**
- **Global** – available in all collections and requests in the workspace.
- **Collection** – only within a specific collection.
- **Environment** – active only when a specific environment is selected.

**Why use variables?**
- Avoid hardcoding values (URLs, tokens, user IDs).
- Easy to update a value in one place.
- Switch between different servers (dev, staging, prod) using environments.

## Environments
An **Environment** is a set of variables for a specific context (e.g., development, staging, production).  
You can switch environments via the dropdown in Postman. Environment variables override global variables with the same name.

**Example:**  
Environment `Staging` → variable `base_url = "https://staging.api.example.com"`  
Request: `GET {{base_url}}/users` → will use the staging URL.

## Writing Automated Tests in Postman
Tests are written in JavaScript inside the **Tests** tab of a request. Postman provides `pm` object.

**Basic syntax:**
```javascript
pm.test("Test name", function () {
    // assertions using pm.expect
});

**Common assertions:**
- Check status code: pm.response.to.have.status(200);
- Check that a field exists: pm.expect(jsonData).to.have.property('fieldName');
- Check data type: pm.expect(jsonData.fieldName).to.be.a('number');

**Retrieving response body:**
- const jsonData = pm.response.json();  // parses response as JSON
- pm.response.json() converts the raw response into a JavaScript object so you can access its properties e.g., jsonData.userId

## Example

pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Response has userId field", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData).to.have.property('userId');
});

pm.test("userId is a number", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.userId).to.be.a('number');
});

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

pm.test("All comments have postId === 1", function () {
    const jsonData = pm.response.json();
    jsonData.forEach(comment => {
        pm.expect(comment.postId).to.equal(1);
    });
});

pm.test("Title is not empty", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData.title).to.be.a('string').and.not.empty;
});

pm.test("Has userId and body fields", function () {
    const jsonData = pm.response.json();
    pm.expect(jsonData).to.have.property('userId');
    pm.expect(jsonData).to.have.property('body');
});