import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class imagesView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        if (whichBG == 0){
            setLayout(Rez.Layouts.WatchFace(dc));
        } else {
            setLayout(Rez.Layouts.OtherWatchFace(dc));
        }
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;

        if (whichBG == 0){
            setLayout(Rez.Layouts.WatchFace(dc));
        } else {
            setLayout(Rez.Layouts.OtherWatchFace(dc));
        }

        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the view
        var view = View.findDrawableById("TimeLabel") as Text;

        view.setText(timeString);

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

}
