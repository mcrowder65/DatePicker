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
class DatePickerViewController: UIViewController {
    @IBOutlet var label: UILabel!
    var labelText: String!
    
    @IBOutlet weak var value: UILabel!
    var valueText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label?.text = labelText
        value?.text = valueText
        view.backgroundColor = .white
        let gesture = UITapGestureRecognizer(target: self, action: #selector (self.someAction (_:)))
        
        self.view.addGestureRecognizer(gesture)
        
        
    }
    @objc func someAction(_ sender: UITapGestureRecognizer) {
        
        DatePickerPopover(title: "DatePicker")
            .setDoneButton(action: { _, selectedDate in
                print(selectedDate)
            })
            .appear(originView: sender.view!, baseViewController: self)
    }
}

struct DatePicker: UIViewControllerRepresentable {
    let label: String
    let value: String
    func makeUIViewController(context: UIViewControllerRepresentableContext<DatePicker>) -> UIViewController {
        let vc = DatePickerViewController()
        vc.labelText = label
        vc.valueText = value
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<DatePicker>) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}
