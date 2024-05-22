//
//  Extensions.swift
//  TestTask
//
//  Created by Артем Макар on 22.05.24.
//

import Foundation
import SwiftUI

public extension Color {
    static func fromRGB(red: Double, green: Double, blue: Double, opacity: Double = 255) -> Color {
    Color(red: red/255, green: green/255, blue: blue/255, opacity: opacity/255)
  }
}
