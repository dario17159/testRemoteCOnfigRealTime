//
//  RealTimeRemoteConfig.swift
//  App
//
//  Created by Dario Carrizo on 10/07/2023.
//

import Foundation
import FirebaseRemoteConfig

public class RealTimeRemoteConfig{
    var remoteConfig: RemoteConfig!
    
    init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
//        //Escuchar y activar cambios
//        remoteConfig.fetch{ (status, error ) -> Void in
//            if status == .success {
//                print("Config fetched!")
//
//            } else {
//                print("Config not fetched")
//                print("Error: \(error?.localizedDescription ?? "No error available.")")
//            }
//        }
//
//        //Escuchar cambios en tiempo real
//        remoteConfig.addOnConfigUpdateListener{ configUpdate, error in
//
//            guard let configUpdate, error == nil else {
//                print("Error listening for config updates: \(String(describing: error))")
//                return
//            }
//
//            print("Update keys: \(configUpdate.updatedKeys)")
//        }
    }
}
