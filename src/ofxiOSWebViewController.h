//
//  ofxiOSWebViewController.h
//  emptyExample
//
//  Created by Daan van Hasselt on 5/28/12.
//  Copyright (c) 2012 Touchwonders B.V. All rights reserved.
//

#pragma once

#include "ofMain.h"
#include "ofxiPhoneExtras.h"

///-------------------------------------------------
/// Event
///-------------------------------------------------

typedef enum _ofxiOSWebViewState{
    ofxiOSWebViewStateUndefined,
    ofxiOSWebViewStateDidStartLoading,
    ofxiOSWebViewStateDidFinishLoading,
    ofxiOSWebViewStateDidFailLoading
} ofxiOSWebViewState;

class ofxiOSWebViewControllerEventArgs : public ofEventArgs
{     

    public:
    
        NSURL *url;
        NSError *error;
        ofxiOSWebViewState state;
    
        ofxiOSWebViewControllerEventArgs()
        {
            url = nil;
            error = nil;
            state = ofxiOSWebViewStateUndefined;
        }
    
        ofxiOSWebViewControllerEventArgs(NSURL *_url, ofxiOSWebViewState _state, NSError *_error)
        {
            url = _url;
            state = _state;
            error = _error;
        }
    
}; 

///-------------------------------------------------
/// c++ OF class
///-------------------------------------------------

@class ofxiOSWebViewDelegate;
class ofxiOSWebViewController {
    
public:

    void showView(int frameWidth, int frameHeight,  BOOL animated, BOOL addToolbar, BOOL transparent, BOOL scroll);
    void hideView(BOOL animated);
    
    void setOrientation(ofOrientation orientation);
    
    void loadNewUrl(NSURL *url);
    void loadLocalFile(const string & filename);
    
    ofEvent<ofxiOSWebViewControllerEventArgs> event;
    
    bool autoRotation;
    void setAutoRotation(bool _autoRotation);
    
    /**
     * I would prefer to make these methods private, but we can't make a obj-c class a friend of a c++ class.
     */
    void didStartLoad();
    void didFinishLoad();
    void didFailLoad(NSError *error);
    
private:
    
    void createView(BOOL withToolbar, CGRect frame, BOOL transparent, BOOL scroll);
    UIView *_view;
    UIWebView *_webView;
    ofxiOSWebViewDelegate *_delegate;
    
    bool isRetina();
    
};

///-------------------------------------------------
/// obj-c webview delegate
///-------------------------------------------------

@interface ofxiOSWebViewDelegate : NSObject <UIWebViewDelegate> {
    int _numWebViewLoads; // to prevent firing delegate multiple times
}

- (void)closeButtonTapped;

@property (nonatomic, assign) ofxiOSWebViewController *delegate;
@end
