# measure_ap

MeasureAp for easy assessment of patients

## Getting Started

MeasureAp would be a “one stop” app that allows a clinician to administer a paperless
assessment at bedside for their patients. It is imagined as a tool that’ll help clinicians look at
their patients history, track and manage their patients.

## Setup Instruction
The setup is straight forward. All the libraries and codes are in place. Just have to setup Firebase account in order to save to realtime database.
1. Clone the repo
2. Create a firebase app 
3. Setup android app and download google-services.json with the guide here: https://firebase.google.com/docs/android/setup
4. Replace google-service.json in /android/app folder
5. Ready to rock!

## Assumptions
The guide provided was pretty straight forward so didn't have to make any assumption for development.

## Challenges
1. When showing image in the full screen, I was planning for using 'Hero' library but I came up with my own solution and created a transparent widget for it.
2. The stepper was a bit new, had to search for a bit but planned to create my own from scratch and Bloc helped me in creating that more efficiently and faster.
3. The gradient button shadow took out some time for me. I was successful in creating a gradient shadow but could not position it properly so had to use normal shadow.

## Improvements
1. Patient tab shows list of the patients and can help monitor patients easily.
2. Added buttons on full page image when identifying animals so that it would be easier to switch between identified or not.
