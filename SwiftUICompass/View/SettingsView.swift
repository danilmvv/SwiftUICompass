//
//  SettingsView.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: SettingsViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack(alignment: .leading) {
                    Text("Тип Компаса:")
                    
                    Picker(selection: $settings.compassMode, label: Text("Вид"), content: {
                        Text("Обычный").tag(CompassMode.normal)
                        Text("Упрощенный").tag(CompassMode.simplified)
                    })
                    .pickerStyle(.segmented)
                }
                
                Spacer()
                
                Text(":)")
                    .font(.footnote)
            }
            .padding()
            .navigationTitle("Настройки")
            .toolbar {
                Button("Готово") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(SettingsViewModel())
}
