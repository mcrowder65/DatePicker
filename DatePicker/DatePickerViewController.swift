//
//  DatePickerViewController.swift
//  DatePicker
//
//  Created by Matt Crowder on 2/20/20.
//  Copyright © 2020 Matt. All rights reserved.
//

import UIKit
import SwiftyPickerPopover
import SwiftUI
import SwiftDate
class DatePickerViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var labelText: String!
    
    @IBOutlet weak var value: UILabel!
    var valueText: String!
    private let dateFormat: String = "MM/dd/yyyy"
    func textToDate(_ text: String?) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let str = text ?? ""
        let d = str.isEmpty ? Date().toFormat(dateFormat) : str
        guard let selectedDate = dateFormatter.date(from: d) else {
            fatalError()
        }
        return selectedDate
    }

    func dateToText(_ date: Date) -> String {
        return date.toFormat(dateFormat)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label?.text = labelText
        value?.text = valueText == "" ? "Optional" : valueText
        value?.textColor = valueText == "" ? .gray : value.textColor
        view.backgroundColor = .white
        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.someAction (_:)))
        
        self.view.addGestureRecognizer(gesture)
        
        
    }
    @objc func someAction(_ sender: UITapGestureRecognizer) {
        
        DatePickerPopover(title: self.labelText)
            .setSelectedDate(textToDate(value.text))
            .setDoneButton(action: { _, selectedDate in
                self.value.text = self.dateToText(selectedDate)
            })
            .appear(originView: sender.view!, baseViewController: self)
    }
}

struct DatePicker: UIViewControllerRepresentable {
    let label: String
    @Binding var value: Date
    func makeUIViewController(context: UIViewControllerRepresentableContext<DatePicker>) -> UIViewController {
        let vc = DatePickerViewController()
        vc.labelText = label
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        vc.valueText = df.string(from: value)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<DatePicker>) {
        print("updated")
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}

//extension DatePicker {
//    init(label: String) {
//        self.label = label
//        self.value = .constant(Date())
//    }
//}
