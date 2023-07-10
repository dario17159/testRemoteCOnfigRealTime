//
//  ScreenOrientationPlugin.swift
//  App
//
//  Created by Dario Carrizo on 10/07/2023.
//

import Foundation
import Capacitor

@objc(ScreenOrientationPlugin)
public class ScreenOrientationPlugin: CAPPlugin {
    
    private let implementation = ScreenOrientation()
    
    public override func load() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.orientationDidChange),
            name: UIDevice.orientationDidChangeNotification,
            object: nil)
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func orientationDidChange(){
        if(UIDevice.current.orientation.isValidInterfaceOrientation){
            let orientation = implementation.getCurrentOrientationType()
            notifyListeners("screenOrientationChange", data: ["type": orientation])
        }
    }
    
    @objc public func orientation(_ call: CAPPluginCall){
        let orientationType = implementation.getCurrentOrientationType()
        
        call.resolve(["type": orientationType])
    }
    
    @objc public func lock(_ call: CAPPluginCall){
        call.resolve()
    }
    
    @objc public func unlock(_ call: CAPPluginCall){
        call.resolve()
    }
}
