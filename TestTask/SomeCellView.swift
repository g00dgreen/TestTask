//
//  SomeCellView.swift
//  TestTask
//
//  Created by Артем Макар on 21.05.24.
//

import SwiftUI

struct SomeCellView: View {
    
    let title: String
    let subTitle: String
    let backgroundImage: Image
    let imageTitle: String
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                backgroundImage
                Text(imageTitle)
            }
            .padding(.leading, 16)
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(.custom("Roboto-Medium", size: 20))
                Text(subTitle)
                    .font(.custom("Roboto-Regular", size: 14))
            }
            .padding(.bottom, 9)
            .padding(.top, 16)
            Spacer()
        }
        .frame(minHeight: 72)
        .background(Color.fromRGB(red: 255, green: 255, blue: 255))
        .cornerRadius(8)
    }
}

struct SomeCellView_Previews: PreviewProvider {
    static var previews: some View {
        SomeCellView(
            title: "Мертвая",
            subTitle: "или прикидывается",
            backgroundImage:  Image("Ellipse"),
            imageTitle: "\u{2620}"
        )
    }
}

