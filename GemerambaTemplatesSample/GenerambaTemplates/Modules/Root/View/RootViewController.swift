//
//  RootViewController.swift
//  GenerambaTemplates
//
//  Created by iganin on 30/05/2019.
//  Copyright © 2019 iganin. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class RootViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    
    // MARK: - Property
    private var viewModel: RootViewModelType!
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    static func insntantiate(initialNumber: Int = 0, viewModel: RootViewModelType? = nil) -> RootViewController {
        let viewController = R.storyboard.rootViewController.instantiateInitialViewController()!
        let wireframe = DefaultRootWireframe(on: viewController)
        
        let dependency = RootViewModel.Dependency(
            initialNumber: initialNumber,
            wireframe: wireframe
        )
        
        let viewModel = viewModel ?? RootViewModel(dependency: dependency)
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindTo()
    }

    // MARK: - Function

}

// MARK: - Private Function
private extension RootViewController {

    func setupView() {
        plusButton.layer.borderColor = plusButton.titleLabel?.textColor.cgColor
        plusButton.layer.cornerRadius = 4.0
        plusButton.layer.borderWidth = 1.0
        
        minusButton.layer.borderColor = minusButton.titleLabel?.textColor.cgColor
        minusButton.layer.cornerRadius = 4.0
        minusButton.layer.borderWidth = 1.0
    }

    func bindTo() {
        plusButton.rx.tap
            .bind(to: viewModel.input.didTappedPlusButton)
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .bind(to: viewModel.input.didTappedMinusButton)
            .disposed(by: disposeBag)
        
        viewModel.output.currentNumber
            .drive(numberLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
