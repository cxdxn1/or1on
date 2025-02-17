//
//  ContentView.swift
//  or1on
//
//  Created by Rayyan Khan on 1/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            exploit_init()
        }) {
            Text("Start")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
