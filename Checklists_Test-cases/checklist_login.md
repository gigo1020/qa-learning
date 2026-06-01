# Checklist for login form

## Positive checks
- Login with valid email and password
- There is a link "Forgot your password"

## Negative checks
- Empty email field: "Enter email" message
- Empty password field: "Enter password" message
- Both mail and password fields are empty: "Enter data" message
- Email without a domain (user@): message about incorrect format
- Email without @ (user.com): message about incorrect format
- Password shorter than 8 characters: Invalid format message
- Password without special characters: message about incorrect format
- Password without numbers: incorrect format message
- Spaces at the beginning and end of the email: trimmed 
- User does not exist: go to registration form

## UI и UX
- Fields are highlighted red when there is an error
- Error messages are clear (not "error 500")
- Log In button is only active when both fields are filled in
- Pressing Enter on the form submits the request
- Tab switches fields in the correct order
- Clicking on the eye toggles the visibility of the entered password

## Security
- The password field is hidden (asterisks or dots)
- Doesn't save password in URL after form submission
- XSS-Script
- SQL injection
