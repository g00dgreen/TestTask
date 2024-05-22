//
//  CellModel.swift
//  TestTask
//
//  Created by Артем Макар on 21.05.24.
//

import Foundation
import SwiftUI

public struct CellModel: Identifiable {
    public let id: UUID
    let title: String
    let subTitle: String
    let imageLabel: String
    let backgroundImage: Image
}
