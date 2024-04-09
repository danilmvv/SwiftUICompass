//
//  Info.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject var viewModel: CompassViewModel
    
    var body: some View {
        let heading = Int(viewModel.heading)
        
        HStack {
            Text("\(heading)")
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text("º")
                .font(.system(size: 64))
            
            Text(viewModel.directionName)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 64, design: .monospaced))
        .sensoryFeedback(trigger: viewModel.directionName) { oldValue, newValue in
            if newValue == "С" {
                return .success
            }
            
            return .selection
        }
    }
}

#Preview {
    InfoView(viewModel: CompassViewModel())
}
