//
//  UIApplicationProtocol.swift
//  BeSafe
//
//  Created by Dheeraj Neelam on 11/25/22.
//  Copyright © 2022 BeSafe. All rights reserved.
//

import Foundation
import UIKit

public protocol UIApplicationProtocol {
    func safeOpenURL(_ url: URL, options: [String: Any], completionHandler completion: ((Bool) -> Void)?)
    func canOpenURL(_ url: URL) -> Bool
}

extension UIApplication: UIApplicationProtocol {
    public func safeOpenURL(_ url: URL, options: [String: Any], completionHandler completion: ((Bool) -> Void)?) {
        open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary(options), completionHandler: completion)
    }

    private func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
        return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value) })
    }
}
