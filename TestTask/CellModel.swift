//
//  CellModel.swift
//  TestTask
//
//  Created by Артем Макар on 21.05.24.
//

import Foundation
import SwiftUI


enum CellState {
    case death
    case life(id: UUID)
    case live
}

public struct CellModel: Identifiable {
    public let id: UUID
    let title: String
    let subTitle: String
    let imageLabel: String
    let backgroundImage: Image
    
    init(id: UUID, title: String, subTitle: String, imageLabel: String, backgroundImage: Image) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.imageLabel = imageLabel
        self.backgroundImage = backgroundImage
    }
    
    init(cellState: CellState) {
        switch cellState {
        case .live:
            self.id = UUID()
            self.title = "Живая"
            self.subTitle = "и шевелится!"
            self.imageLabel = "\u{1F4A5}"
            self.backgroundImage = Image("EllipseLive")
        case .death:
            self.id = UUID()
            self.title = "Мёртвая"
            self.subTitle = "или прикидывается"
            self.imageLabel = "\u{2620}"
            self.backgroundImage = Image("EllipseDeath")
        case .life(let id):
            self.id = id
            self.title = "Жизнь"
            self.subTitle = "ку-ку!"
            self.imageLabel = "\u{1F423}"
            self.backgroundImage = Image("EllipseLife")
        }
    }
}
