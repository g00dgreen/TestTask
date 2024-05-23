//
//  CellViewModel.swift
//  TestTask
//
//  Created by Артем Макар on 21.05.24.
//

import Foundation
import SwiftUI

enum RandomCell {
    case live
    case death
}

class CellViewModel: ObservableObject {
    @Published var model: [CellModel] = []
    
    init(model: [CellModel], numberOfCellForAction: Int) {
        self.model = model
        self.numberOfCellForAction = numberOfCellForAction
    }
    
    func pressButton() {
        upadeteListState(newCell: getRandomCell())
    }
    
    private var numberOfCellForAction: Int
    private var counter = 0
    private var lastLifeID: [UUID] = []
    
    private func getRandomCell() -> CellModel {
        let randomState: RandomCell = Int.random(in: 0...1) == 0 ? .death : .live
        switch randomState {
        case .death:
            counter >= 0 ? (counter = -1) : (counter += -1)
            return CellModel.init(cellState: .death)
        case .live:
            counter <= 0 ? (counter = 1) : (counter += +1)
            return CellModel.init(cellState: .live)
        }
    }
    
    private func upadeteListState(newCell: CellModel) {
        model.append(newCell)
        
        switch counter {
        case numberOfCellForAction:
            let id = UUID()
            lastLifeID.append(id)
            
            model.append(CellModel.init(cellState: .life(id: id)))
            counter = 0
            
        case -numberOfCellForAction:
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
