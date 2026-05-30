# Test cases for the videoplayer on the desktop

- General precondition: open a website https://www.w3schools.com/html/html5_video.asp 



## Test case 001
- Title: Play / Pause button in the video player plays and pauses video
- Steps to reproduce:
    1. Click "Play" button (it will change into Pause)
    2. Click "Pause" button
- Expected result: The video starts playing after step 1. The video is paused after step 2. The button icon changes with each press, Play and Pause alternately

## Test case 002
- Title: Adjusting the volume in the video player makes the sound quieter and louder
- Preconditions: Click Play button, video should play while walking through steps. Sound is on, there is a listening device 
- Steps to reproduce:
    1. Press the sound icon in the video player
    2. Use the slider to make the sound louder
    3. Use the slider to make the sound quieter
- Expected result: The video plays continuously. The sound became louder after step 2. The sound became quieter after step 3. Volume slider moves smoothly with mouse using

## Test case 003
- Title: Full screen switch in the videoplayer
- Preconditions: Click Play button, video should play while walking through steps.
- Steps to reproduce:
    1. Press Full Screen button in the videoplayer
    2. Press Full Screen button again
- Expected result: The video expanded to fill the entire screen after step 1. The video was minimized to its original state after step 2.

## Test case 004
- Title: Rewind video using the timeline in the video player
- Preconditions: Click Play button, video should play while walking through steps.
- Steps to reproduce:
    1. Click on the timeline at the middle of the video
    2. Click on the timeline at the start of the video
- Expected result: The video rewinds to the specified point in both steps

## Test case 005
- Title: Video stops at the end of the timeline
- Steps to reproduce:
    1. Click on the timeline close to the end of the video 
    2. Wait untill video ends
- Expected result: The video stopped when it reached the end point of the timeline. Last frame of video is shown. 