//
//  ScreenOrientation.swift
//  App
//
//  Created by Dario Carrizo on 10/07/2023.
//

import Foundation
import UIKit

public class ScreenOrientation: NSObject {
    
    public func getCurrentOrientationType() -> String {
        let currentOrientation: UIDeviceOrientation = UIDevice.current.orientation
        return fromDeviceOrientation(currentOrientation)
    }
    
    private func fromDeviceOrientation(_ orientation: UIDeviceOrientation) -> String {
        switch orientation {
        case .landscapeLeft:
            return "landscape-primary"
        case .landscapeRight:
            return "landscape-secondary"
        case .portraitUpsideDown:
            return "portrait-secondary"
        default:
            return "portrait-primary"
        }
    }
}
