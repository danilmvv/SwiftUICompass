//
//  Compass.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import SwiftUI

struct CompassView: View {
    @EnvironmentObject var settings: SettingsViewModel
    @ObservedObject var viewModel: CompassViewModel
    
    var body: some View {
        Group {
            if settings.compassMode == .normal {
                CompassWheel(heading: viewModel.heading)
            } else {
                CompassArrow(heading: viewModel.heading)
            }
        }
    }
}


#Preview {
    CompassView(viewModel: CompassViewModel())
        .environmentObject(SettingsViewModel())
}
