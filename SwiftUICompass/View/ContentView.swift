//
//  ContentView.swift
//  SwiftUICompass
//
//  Created by Danil Masnaviev on 08/04/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CompassViewModel()
    @State private var isSettingsSheetPresented = false
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                CompassView(viewModel: viewModel)
                    .padding(60)
                
                Spacer()
                InfoView(viewModel: viewModel)
            }
            .toolbar {
                Button(action: {
                    isSettingsSheetPresented.toggle()
                }) {
                    Image(systemName: "gearshape.fill")
                        .foregroundStyle(Color("CustomBlack"))
                }
            }
            .sheet(isPresented: $isSettingsSheetPresented) {
                SettingsView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(SettingsViewModel())
}
