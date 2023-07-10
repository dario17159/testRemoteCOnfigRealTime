//
//  ScreenOrientationPlugin.m
//  App
//
//  Created by Dario Carrizo on 10/07/2023.
//

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(ScreenOrientationPlugin, "ScreenOrientation",
           CAP_PLUGIN_METHOD(orientation, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(lock, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(unlock, CAPPluginReturnPromise);
           )
