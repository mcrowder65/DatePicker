//
//  ContentView.swift
//  DatePicker
//
//  Created by Matt Crowder on 2/20/20.
//  Copyright © 2020 Matt. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var text: String = ""
//    @State var startDate: Date
    var body: some View {
        Form {
            Section {
                Button(action: { print("hello!")}) {
                    Text("Hello!")
                }
            }
            Section {
                DatePicker(label: "Start Date", value: "02/02/2020")
                DatePicker(label: "End Date")
            }
//            Section {
//                DatePicker(label: "Start Date")
//                DatePicker(label: "End Date")
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
