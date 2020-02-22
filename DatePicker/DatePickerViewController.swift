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
    
    var updateValue: (Date) -> Void = { _ in print("you didn't initialize updateValue!") }
    
    var optional: Bool = false
    private let dateFormat: String = "MM/dd/yy"
    func textToDate(_ text: String?) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let str = text ?? ""
        let d = str.isEmpty ? Date().toFormat(dateFormat) : str
        guard let selectedDate = dateFormatter.date(from: d) else {
            return Date()
        }
        return selectedDate
    }

    func dateToText(_ date: Date) -> String {
        return date.toFormat(dateFormat)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        label?.text = labelText
        value?.text = optional ? "Optional" : valueText
        value?.textColor = .gray
        view.backgroundColor = .white
        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.someAction (_:)))
        
        self.view.addGestureRecognizer(gesture)
        
        
    }
    @objc func someAction(_ sender: UITapGestureRecognizer) {
        value?.textColor = .systemBlue
        let datePicker = DatePickerPopover(title: self.labelText)
            .setSelectedDate(textToDate(value.text))
            .setDoneButton { _, selectedDate in
                self.value?.textColor = .gray
                self.value.text = self.dateToText(selectedDate)
                self.updateValue(selectedDate)
            }
            .setCancelButton { (_, _) in self.value.textColor = .gray }
        if optional {
            datePicker.setClearButton { (popover, _) in
                self.value.text = "Optional"
                self.value.textColor = .gray
                popover.disappear()
            }
        }
        datePicker.appear(originView: sender.view!, baseViewController: self)
            
    }
}

struct DatePicker: UIViewControllerRepresentable {
    let label: String
    @Binding var value: Date
    
    var optional: Bool = false
    func makeUIViewController(context: UIViewControllerRepresentableContext<DatePicker>) -> UIViewController {
        let vc = DatePickerViewController()
        vc.labelText = label
        vc.optional = self.optional
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yy"
        vc.valueText = df.string(from: value)
        vc.updateValue = { date in
            self.value = date
        }
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<DatePicker>) {
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}

//extension DatePicker {
//    init(label: String, value: Bind) {
//        self.label = label
//        self.value = .constant(Date())
//    }
//}
