//
//  ViewExtension.swift
//  BeSafe
//
//  Created by Dheeraj Neelam on 11/18/22.
//  Copyright © 2022 BeSafe. All rights reserved.
//

import Foundation
import SwiftUI

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }

    @ViewBuilder
    func redacted(if condition: @autoclosure () -> Bool) -> some View {
        if condition() {
            redacted(reason: .placeholder)
                .shimmering()
        } else {
            unredacted()
        }
    }
}

private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
