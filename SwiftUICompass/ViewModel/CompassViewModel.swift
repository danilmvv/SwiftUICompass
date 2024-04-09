//
//  CompassViewModel.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import Foundation
import CoreLocation

class CompassViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var heading: Double = 0.0
    @Published var directionName: String = "С"
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        self.heading = newHeading.magneticHeading
        self.directionName = getDirectionName(heading: newHeading.magneticHeading)
//        print(newHeading.magneticHeading)
    }
    
    private func getDirectionName(heading: Double) -> String {
        let directions = ["С", "СВ", "В", "ЮВ", "Ю", "ЮЗ", "З", "СЗ"]
        let index = Int((heading + 22.5) / 45) % 8
        return directions[index]
    }
}
