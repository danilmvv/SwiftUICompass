//
//  CompassArrow.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import SwiftUI

struct CompassArrow: View {
    let heading: Double
    
    var body: some View {
        ZStack {
            Image(systemName: "location.north")
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .rotationEffect(.degrees(-heading))
        }
    }
}

#Preview {
    CompassArrow(heading: 21)
}
