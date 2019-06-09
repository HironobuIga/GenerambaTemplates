//
//  RootViewController.swift
//  MVCSample
//
//  Created by HironobuIga on 2019/06/09.
//  Copyright © 2019 iganin. All rights reserved.
//

import UIKit

final class RootViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    
    // MARK: Button Action
    
    @IBAction private func didTapMinusButton(_ sender: UIButton) {
        currentNumber -= 1
        numberLabel.text = "\(currentNumber)"
    }
    
    @IBAction private func didTapPlusButton(_ sender: UIButton) {
        currentNumber += 1
        numberLabel.text = "\(currentNumber)"
    }
    
    // MARK: Property
    private var currentNumber = 0
    var router: RootRouter!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Function
}

// MARK: - Private Function
private extension RootViewController {
    
    func setupView() {
        minusButton.layer.cornerRadius = 15.0
        minusButton.layer.borderWidth = 4.0
        minusButton.layer.borderColor = minusButton.tintColor.cgColor
        
        plusButton.layer.cornerRadius = 15.0
        plusButton.layer.borderWidth = 4.0
        plusButton.layer.borderColor = minusButton.tintColor.cgColor
    }
    
}
