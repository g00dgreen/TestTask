//
//  CellViewModel.swift
//  TestTask
//
//  Created by Артем Макар on 21.05.24.
//

import Foundation
import SwiftUI

enum CellState {
    case death
    case live
}

class CellViewModel: ObservableObject {
    @Published var model: [CellModel] = []
    
    init(model: [CellModel]) {
        self.model = model
    }
    
    func pressButton() {
        upadeteListState(newCell: getRandomCell())
    }
    
    private var counter = 0
    private var lastLifeID: [UUID] = []
    
    private func getRandomCell() -> CellModel {
        let randomState: CellState = Int.random(in: 0...1) == 0 ? .death : .live
        switch randomState {
        case .death:
            counter >= 0 ? (counter = -1) : (counter += -1)
            return CellModel(
                id: UUID(),
                title: "Мёртвая",
                subTitle: "или прикидывается",
                imageLabel: "\u{2620}",
                backgroundImage: Image("EllipseDeath")
            )
        case .live:
            counter <= 0 ? (counter = 1) : (counter += +1)
            return CellModel(
                id: UUID(),
                title: "Живая",
                subTitle: "и шевелится!",
                imageLabel: "\u{1F4A5}",
                backgroundImage: Image("EllipseLive")
            )
        }
    }
    
    private func upadeteListState(newCell: CellModel) {
        model.append(newCell)
        
        switch counter {
        case 3:
            let id = UUID()
            lastLifeID.append(id)
            
            model.append(CellModel(
                id: id,
                title: "Жизнь",
                subTitle: "ку-ку!",
                imageLabel: "\u{1F423}",
                backgroundImage: Image("EllipseLife")
            ))
            
            counter = 0
            
        case -3:
            counter = 0
            
            if lastLifeID.count != 0 {
                model = model.filter { cell in
                    cell.id != lastLifeID[lastLifeID.count-1]
            }
                lastLifeID.removeLast()
        }
        default: break
        }
    }
}
