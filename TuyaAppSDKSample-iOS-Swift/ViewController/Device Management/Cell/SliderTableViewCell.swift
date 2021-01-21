//
//  StepperTableViewCell.swift
//  TuyaAppSDKSample-iOS-Swift
//
//  Copyright (c) 2014-2021 Tuya Inc. (https://developer.tuya.com/)

import UIKit

class SliderTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    // MARK: - Property
    var sliderAction: ((UISlider) -> Void)?

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderAction?(sender)
    }

}