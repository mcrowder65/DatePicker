//
//  ContentView.swift
//  DatePicker
//
//  Created by Matt Crowder on 2/20/20.
//  Copyright © 2020 Matt. All rights reserved.
//

import SwiftUI
import SwiftDate

struct ContentView: View {
    @State var text: String = ""
    @State var startDate: String = ""
    @State var endDate: String = ""
    var body: some View {
        Form {
            Section {
                Button("Hello!") {
                    print("\(self.startDate) \(self.endDate)")
                    
                }
            }
            Section {
                DatePicker(label: "Start Date", value: $startDate)
                DatePicker(label: "End Date", value: $endDate, optional: true)
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
