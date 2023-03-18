//
//  ContentView.swift
//  ApiEW
//
//  Created by Alexander Bater on 17/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var input: String = ""
    @StateObject private var stateController = StateController()
    
    var body: some View {
        List {
            TextField("Enter your name", text: $input)
            Button("Get age", action: { stateController.getAge(name: input) })
            Text(stateController.age)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
