# Testing Theory: Examples of Levels, Types, and Test Design

---

## Test Levels (Examples)

**Unit Testing**  
Verification of a function that checks a user's age of majority based on their date of birth.

**Integration Testing**  
Verification that after changing the price in the admin panel, it updates correctly in the product catalog and the shopping cart.

**System Testing**  
Full end-to-end scenario:  
Go to website → Select a restaurant → Add a dish to the cart → Place an order → Receive a push notification.

**Acceptance Testing**  
The customer launches the store and attempts to add a new product. They verify that the product appears correctly on the site.

---

## Test Types (Examples)

**Functional Testing**  
Verification that clicking the "Save" button opens a download dialog and the file is saved locally.

**Non-functional Testing**
- Verification that the mobile version of the site displays correctly on both iPhone and Android devices.
- Verification that the dark theme renders correctly and is user-friendly.
- Verification that the game does not freeze under a load of 2000 concurrent online users.

**Regression Testing**  
After adding a new "Share" button, we rerun all existing tests for login, search, and the shopping cart to ensure they haven't broken.

**Smoke Testing**  
After a new build, verify the following:  
- Main page loads  
- Search functionality works  
- Items can be added to the cart

**Sanity Testing**
- **Case 1:** After fixing the "Forgot Password" feature, we check only this flow: request reset, receive email, change password, and log in with the new password.
- **Case 2:** After fixing the "Save" button, we verify the file saves locally and can be opened on the device.
- **Case 3:** After adding a "Full Screen" button, we verify that the full-screen mode toggles correctly and returns to the compact view.

---

## Test Design: Equivalence Partitioning & Boundary Value Analysis

### 1) Age Field (integer, 18 to 60 inclusive)

**Valid Equivalence Classes**
- 18 to 60 inclusive, e.g., 40

**Invalid Equivalence Classes**
- Less than 18: -10, 0, 10
- Greater than 60: 75, 100
- Non-integers: 18.5, 45.7, 59.9
- Letters / symbols: `"abc"`, `"!-+:?№%*/\"`
- Empty value / null

**Boundary Values**
- 17, 18, 19 (lower boundary)
- 59, 60, 61 (upper boundary)

---

### 2) Name Field (2–30 characters, Latin/Cyrillic letters only, no digits or special characters)

**Valid Equivalence Classes**
- 2 to 30 characters, letters only (Latin or Cyrillic), e.g., "kirill", "Анастасия"

**Invalid Equivalence Classes**
- Less than 2 characters: `"a"`
- More than 30 characters: `"egorkirillolegmashatatianaolgaahastasiya"`
- Contains digits: `"30secondstomars"`
- Contains special characters: `"!-+:?№%*/\"`
- Empty value / null

**Boundary Values**
- 1, 2, 3 characters (lower boundary)
- 29, 30, 31 characters (upper boundary)

---

### 3) Date of Birth Field (format DD.MM.YYYY, valid dates from 01.01.1900 to 31.12.2026 inclusive; leap years are respected)

**Valid Equivalence Classes**
- Any correct date within range, e.g., 15.09.2003

**Invalid Equivalence Classes**
- Letters and symbols: `"ab.09.2к25"`, `"10.+%.2025"`
- Incorrect format: `"2003.15.09"`, `"15-09-2003"`, `"15.09.03"`
- Day, month, or year negative: `"15.-5.2005"`
- Day = 0: `"00.09.1997"`
- Day >= 32: `"42.09.1997"`
- Day > 30 for months with 30 days (April, June, September, November):  
  `31.04.2002`, `31.06.2003`, `31.09.2004`, `31.11.2005`
- Day > 28 for February in a non‑leap year: `29.02.1900`
- Day > 29 for February in a leap year: `30.02.2000`
- Day empty: `".09.1997"`
- Month = 0: `"10.00.2005"`
- Month >= 13: `"10.42.2005"`
- Month empty: `"10.  .2005"`
- Year 0000–1899 inclusive: `"15.02.1444"`
- Year >= 2027: `"15.02.3033"`
- Year empty: `"15.02.   "`

**Boundary Values**
- Day: 0, 1, 2 (lower) and 30, 31, 32 (upper)
- Day for 30‑day months: 29, 30, 31
- Day for February (non‑leap): 27, 28, 29
- Day for February (leap): 28, 29, 30
- Month: 0, 1, 2 (lower) and 11, 12, 13 (upper)
- Year: 1899, 1900, 1901 (lower) and 2025, 2026, 2027 (upper)
- Full boundaries: `01.01.1900` and `31.12.2026`