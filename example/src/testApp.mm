#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
	// initialize the accelerometer
	ofxAccelerometer.setup();
	//If you want a landscape oreintation
	ofSetOrientation(OFXIOS_ORIENTATION_LANDSCAPE_LEFT);
	
	ofBackground(127);

    inlineWebViewController.showView(ofGetWindowWidth(), ofGetWindowHeight(), YES, NO, YES, NO);
    inlineWebViewController.setOrientation(OFXIOS_ORIENTATION_LANDSCAPE_LEFT);
    inlineWebViewController.setAutoRotation(false);
    
    ofAddListener(inlineWebViewController.event, this, &testApp::webViewEvent);
    
    inlineWebViewController.loadLocalFile("www/demo.html");

}

//--------------------------------------------------------------
void testApp::webViewEvent(ofxiOSWebViewControllerEventArgs &args) {
    if(args.state == ofxiOSWebViewStateDidStartLoading){
        NSLog(@"Webview started loading URL %@.", args.url);
    }
    else if(args.state == ofxiOSWebViewStateDidFinishLoading){
        NSLog(@"Webview finished loading URL %@.", args.url);
    }
    else if(args.state == ofxiOSWebViewStateDidFailLoading){
        NSLog(@"Webview failed to load the URL %@. Error: %@", args.url, args.error);
    }
}

//--------------------------------------------------------------
void testApp::update(){
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    ofSetColor(255);
    //ofCircle(0,0,1500);
    ofSetColor(0);
	
}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
    
    
    
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){
    
}


//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
    
    // TODO: Better way of handling autorotation.
    
    if(!inlineWebViewController.autoRotation) return;

    switch (newOrientation) {
        case 1:
            inlineWebViewController.setOrientation(OFXIOS_ORIENTATION_PORTRAIT);
            break;
        case 2:
            inlineWebViewController.setOrientation(OFXIOS_ORIENTATION_UPSIDEDOWN);
            break;
        case 3:
            inlineWebViewController.setOrientation(OFXIOS_ORIENTATION_LANDSCAPE_LEFT);
            break;
        case 4:
            inlineWebViewController.setOrientation(OFXIOS_ORIENTATION_LANDSCAPE_RIGHT);
            break;
        default:
            break;
    }
    
}

