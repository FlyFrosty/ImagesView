import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;


var whichBG;

class imagesApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
        if (whichBG == null) {whichBG=0;}
        onSettingsChanged();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        if (whichBG == null) {whichBG=0;}
        onSettingsChanged();
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new imagesView() ] as Array<Views or InputDelegates>;
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
        whichBG = Properties.getValue("BGOpt");
    }

}

function getApp() as imagesApp {
    return Application.getApp() as imagesApp;
}