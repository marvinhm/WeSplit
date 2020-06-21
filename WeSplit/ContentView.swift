//
//  ContentView.swift
//  WeSplit
//
//  Created by Marvin Matovu on 20/06/2020.
//  Copyright © 2020 Marvin Matovu. All rights reserved.
//

import SwiftUI
    
  struct ContentView: View {
       @State var count = 0

       var body: some View {
           Button("Tap Count: \(count)") {
               self.count += 1
           }
       }
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
