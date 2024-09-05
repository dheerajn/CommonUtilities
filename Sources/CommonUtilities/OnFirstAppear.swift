//
//  OnFirstAppear.swift
//  
//
//  Created by Dheeraj Neelam on 4/10/23.
//

import Foundation
import SwiftUI

public extension View {
    func onFirstAppear(perform: @escaping () -> Void, else: @escaping () -> Void = { }) -> some View {
        modifier(OnFirstAppear(perform: perform, else: `else`))
    }
}

private struct OnFirstAppear: ViewModifier {
    let perform: () -> Void
    let `else`: () -> Void

    @State private var firstTime = true

    func body(content: Content) -> some View {
        content.onAppear {
            if firstTime {
                firstTime = false
                perform()
            } else {
                `else`()
            }
        }
    }
}
