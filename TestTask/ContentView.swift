//
//  ContentView.swift
//  TestTask
//
//  Created by Артем Макар on 21.05.24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model: CellViewModel
    var body: some View {
        VStack(spacing: 0) {
            Text("Клеточное наполнение")
                .font(.custom("Roboto-Bold", size: 20))
                .foregroundColor(.white)
                .frame(height: 28)
                .padding(.bottom, 22)
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(model.model, id: \.id) { cell in
                            SomeCellView(
                                title: cell.title,
                                subTitle: cell.subTitle,
                                backgroundImage:  cell.backgroundImage,
                                imageTitle: cell.imageLabel
                            )
                        }
                        .onChange(of: model.model.count) { newValue in
                            if let lastId = model.model.last?.id {
                                withAnimation {
                                    proxy.scrollTo(lastId)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            Spacer()
            Button {
                model.pressButton()
            } label: {
                Text("СОТВОРИТЬ")
                    .frame(height: 36)
                    .font(.custom("Roboto-Medium", size: 14))
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
            }
            .background(Color.fromRGB(red: 90, green: 52, blue: 114))
            .cornerRadius(4)

        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            LinearGradient(
                gradient: Gradient(
                    colors:
                        [Color.fromRGB(red: 49, green: 0, blue: 80),
                         Color.fromRGB(red: 0, green: 0, blue: 0)]
                ),
                startPoint: .top, endPoint: .bottom)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            model: CellViewModel(model: [CellModel.init(cellState: .live)], numberOfCellForAction: 2)
        )
    }
}
