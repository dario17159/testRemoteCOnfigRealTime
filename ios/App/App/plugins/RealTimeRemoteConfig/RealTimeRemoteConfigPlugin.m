//
//  RealTimeRemoteConfigPlugin.m
//  App
//
//  Created by Dario Carrizo on 10/07/2023.
//

#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

CAP_PLUGIN(RealTimeRemoteConfigPlugin, "RealTimeRemoteConfig",
           CAP_PLUGIN_METHOD(configureRemoteConfigListener, CAPPluginReturnPromise);)
