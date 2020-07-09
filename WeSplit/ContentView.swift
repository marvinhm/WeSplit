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
    @State private var numberOfPeople = ""
    @State private var percentageTip = 2

    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let numberOfPeeps = Double(numberOfPeople) ?? 0.00
        let tipSelection = Double(tipPercentages[percentageTip])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = (orderAmount / 100) * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / numberOfPeeps
        
        return amountPerPerson
    }
    
    var originalAmountPlusTip: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[percentageTip])
        let tipValue = (orderAmount / 100) * tipSelection
        
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number Of People", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $percentageTip) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount Per Person")) {
                    Text("£ \(totalPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Original Amount + tip")) {
                    Text("£ \(originalAmountPlusTip, specifier: "%.2f")")
                        .foregroundColor(self.tipPercentages[percentageTip] == 0 ? .red : .black)
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
