# Mobile-app-developement-second-project

The second project  is called "Counting Days". We are taking the old Christian tradition of the advent calendar as a template for a more modern app-based version. The calendar has 24 "doors" and each door hides a small surprise and of course the final and 24th door is the main event and thus the biggest surprise. This is an iPad only app.

this project uses the following:

. Application basics:
This app has a custom icon, custom launch screen, base localization (i.e. all user facing strings are presented via NSLocalizedString) and is set to iPad only.

. Day view grid functionality:
The base layout features 24 day view items (UIView subclass) that display the day's number on the front and will use a UIViewAnimation (curl or flip maybe) when tapped in correct sequence to display a surprise image on the back.

. Auto layout:
The entire app uses auto layout to adjust between landscape and portrait modes.

. Backgrounds, buttons, titles:
The main view (on left) is embedded in UINavigationController and features 2 bar buttons (Reset and Select Holiday). Its background image or background color changes depending on the holiday selected and its title as well as that of the holiday view are adjusted accordingly.

. Reset functionality:
On Reset (top left button) an alert is displayed center screen asking whether the user really wants to reset all days. On OK all day view doors are closed automatically to re-display their numbers again.

. Holiday selection:
On Select Holiday (top right button) the user is shown a table view presented via popover segue. It holds a list of 3 holidays . You may add more. The current selection is indicated with a checkmark. You may use one of the built-in table view cells that have a built-in image view to present it or make up your own table view cell.

7. Test mode:
At the bottom right is a test mode switch (UISwitch). If the switch is on each day window executes as regularly even if tapped put of order.Exiting from test mode causes a full reset as described in point 6 above but without causing the alert to pop.

8. Out of order alert:
If a day view is tapped out of order and the application is not in test mode the secret is not shown. Instead show an alert just below the day view in question. Make sure to use the correct arrows.

9. Big reveal:
When tapping the final day view (in test mode or otherwise) the green "Happy Holidays" view (HolidayViewController) is displayed via Storyboard segue.
