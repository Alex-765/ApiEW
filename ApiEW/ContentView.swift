//
//  ContentView.swift
//  ApiEW
//
//  Created by Alexander Bater on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var stateController = StateController()
    
    var body: some View {
        VStack {
            Button("Get quote", action: { stateController.getQuote() })
            Text(stateController.quote3)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
