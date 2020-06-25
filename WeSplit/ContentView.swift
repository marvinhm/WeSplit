//
//  ContentView.swift
//  WeSplit
//
//  Created by Marvin Matovu on 20/06/2020.
//  Copyright © 2020 Marvin Matovu. All rights reserved.
//

import SwiftUI
    
struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var percentageOfTip = 2

    let percetageTip = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Text("£ \(checkAmount)")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
