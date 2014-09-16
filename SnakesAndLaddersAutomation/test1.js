var target = UIATarget.localTarget();
var application = target.frontMostApp();
var window = application.mainWindow();
window.logElementTree();

var playButton = window.buttons()["Play"];
if (!playButton.isValid()) {
    UIALogger.logFail("Could not locate play button on parent view"); 
}
playButton.tap();
target.delay(10);
UIATarget.onAlert = function onAlert(alert) {
    return false;
}
