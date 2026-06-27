## Test cases for Yandex Maps in the desktop browser

General precondition: https://yandex.ru/maps is open, no search active


## Test case 001
- Title: Search for a valid address displays the location on the map
- Steps to reproduce:
    1. Click on the search input field
    2. Type "Paris Louvre"
    3. Press Enter or click the search button
- Expected result: The map centers on Louvre museum, a marker or highlight appears at the location.

## Test case 002
- Title: Zooming in and out of the map using the mouse and keyboard
- Steps to reproduce:
    1. Hover over map area
    2. Roll the mouse wheel down
    3. Click "-" on the left panel
    4. Roll the mouse wheel up
    5. Click "+" on the left panel
- Expected result: The map zooms out in steps 2 and 3. The map zooms in in steps 4 and 5.

## Test case 003
- Title: Dragging the map with the mouse
- Steps to reproduce:
    1. Hover over map area
    2. Hold LMB and drag the mouse to the side
- Expected result: The map moves according to mouse movement, in the same direction and at the same speed


## Test case 004
- Title: Opening and switching the organization card by clicking on the icon on the map
- Preconditions: The map is zoomed in enough for organization icons to appear. An area of ​​the map is open that contains at least two organizations
- Steps to reproduce:
    1. Click on the organization icon on the map area
    2. Click on any other organization icon
- Expected result: An organization card opens on the right after step 1. The organization card is replaced with a new one after step 2. The name on the card matches the label of the clicked icon on the map

## Test case 005
- Title: Building a route from point 1 to point 2
- Steps to reproduce:
    1. Right-click anywhere on the map
    2. In the menu that opens, select “Route from here”
    3. In the route card that opens on the right, enter any request that does not match the first point (for example "Paris Louvre")
    4. Click on the desired route point in the suggest menu
- Expected result: The map scale has changed so that it fits the entire route line on the screen. The “from” and “to” points coincide with those indicated in steps 2 and 4. A route card appears on the right with distance and travel time. A route line is drawn on the map between the two points