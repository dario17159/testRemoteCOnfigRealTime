//
//  RealTiemRemoteConfigPlugin.swift
//  App
//
//  Created by Dario Carrizo on 10/07/2023.
//

import Foundation
import Capacitor

@objc(RealTimeRemoteConfigPlugin)
public class RealTimeRemoteConfigPlugin: CAPPlugin{
    
    private let implementation = RealTimeRemoteConfig()
    
    @objc public func configureRemoteConfigListener(_ call: CAPPluginCall){
        implementation.remoteConfig.addOnConfigUpdateListener{ configUpdate, error in
            
            guard let configUpdate, error == nil else {
                print("Error listening for config updates: \(String(describing: error))")
                return
            }
            
            print("Update keys: \(configUpdate.updatedKeys)")
//            self.notifyListeners("screenOrientationChange", data: ["type": "\(configUpdate.updatedKeys)"])
            self.onReamoteConfigChanged(configUpdate.updatedKeys)
        }
        
        call.resolve()
    }
    
    private func onReamoteConfigChanged(_ updateKeys: Set<String>){
        do{
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            
            let jsonData = try jsonEncoder.encode(updateKeys)
            let json = String(data: jsonData
                              , encoding: String.Encoding.utf8)
            notifyListeners("screenOrientationChange", data: ["type": json ?? "No json data"])
        }catch {
            print(error.localizedDescription)
        }
        
    }
}
