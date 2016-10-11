# BeaconRanger

Simple project used as the prototype for running an introdution to iOS workshop. Attendees build a single view controller app with storyboards and some code. The main UI consists of a switch and a table view. Flipping the switch turns the user's device into a beacon that is detectable by instances of the app running on other devices. The table view displays a list of nearby beacons. The is that every workshop attendee use the same UUID but different major values for their beacon (pick their favorite number), so that everyone that finishes can see a list of everyone elses favorite numbers.

Goals of this demo are to teach basic storyboards, view hierarchy, target-action mechanism, and delegation (table view and location manager) while also making a cool app only possible in a native environment on Apple hardware.

Uses Swift 3

Originally created for MHacks 8
