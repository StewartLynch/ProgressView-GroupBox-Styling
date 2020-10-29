//
//  ContentView.swift
//  ProgressView-GroupBox Styling
//
//  Created by Stewart Lynch on 2020-10-28.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0
    var body: some View {
        GroupBox(label: Text("Charging Station")) {
            VStack {
                ProgressView(value: progress) {
                    Label("Battery", systemImage: "battery.25")
                } currentValueLabel: {
                    Text("Currrent Charge")
                }
                .progressViewStyle(BatteryViewStyle(width: 100, height: 25))
                Button("Charge") {
                    progress = 0
                    withAnimation(Animation.linear(duration: 2)) {
                        progress = 1
                    }
                }
                .buttonStyle(SpecialButtonStyle(actionType: .confirm, withImage: false))
            }
            .padding()
        }
        .groupBoxStyle(ColoredGroupBoxStyle(backgroundColor: UIColor.systemGreen, width: 300, labelColor: .purple, opacity: 0.2))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
