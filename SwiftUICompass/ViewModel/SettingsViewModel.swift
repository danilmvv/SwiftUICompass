//
//  SettingsViewModel.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import Foundation

enum CompassMode: String {
    case normal = "Обычный"
    case simplified = "Упрощенный"
}

class SettingsViewModel: ObservableObject {
    @Published var compassMode: CompassMode {
        didSet {
            UserDefaults.standard.set(compassMode.rawValue, forKey: "CompassMode")
        }
    }
    
    init() {
        self.compassMode = UserDefaults.standard.string(forKey: "CompassMode").flatMap(CompassMode.init(rawValue:)) ?? .normal
    }
}
