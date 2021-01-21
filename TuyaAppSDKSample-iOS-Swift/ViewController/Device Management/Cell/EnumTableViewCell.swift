//
//  EnumTableViewCell.swift
//  TuyaAppSDKSample-iOS-Swift
//
//  Copyright (c) 2014-2021 Tuya Inc. (https://developer.tuya.com/)

import UIKit

class EnumTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    // MARK: - Property
    var optionArray = [String]()
    var currentOption: String? {
        didSet {
            detailLabel.text = currentOption
        }
    }
    var selectAction: ((String) -> Void)?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        guard selected,
              optionArray.count != 0,
              let vc = window?.rootViewController
        else { return }
        
        let alert = UIAlertController(title: "Select Option", message: nil, preferredStyle: .actionSheet)
        
        for option in optionArray {
            let action = UIAlertAction(title: option, style: .default) { [weak self] _ in
                guard let self = self else { return }
                self.currentOption = option
                self.selectAction?(option)
            }
            alert.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        vc.present(alert, animated: true, completion: nil)
    }
}