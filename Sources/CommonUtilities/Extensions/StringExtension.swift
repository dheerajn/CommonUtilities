//
//  StringExtension.swift
//  BeSafe
//
//  Created by Dheeraj Neelam on 2/12/23.
//

import Foundation

public extension String {
    var getOnlyNumber: String {
        let validChars = Set("1234567890")
        return String(filter { validChars.contains($0) })
    }
}

public extension String {
    static var placeholder: String {
        let length = (4...10).randomElement() ?? 5
        return String(Array(repeating: "X", count: length))
    }
}
