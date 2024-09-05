//
//  UIApplicationExtension.swift
//  BeSafe
//
//  Created by Dheeraj Neelam on 12/6/22.
//  Copyright © 2022 BeSafe. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    var activeKeyWindow: UIWindow? {
        return UIApplication.shared
            .connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
