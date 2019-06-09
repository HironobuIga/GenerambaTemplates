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
import UIComponent

final class RootViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var minusButton: RoundButton!
    @IBOutlet private weak var plusButton: RoundButton!
    
    // MARK: - Property
    private var viewModel: RootViewModelType!
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    static func insntantiate(initialNumber: Int = 0, viewModel: RootViewModelType? = nil) -> RootViewController {
        let viewController =  StoryboardScene.RootViewController.initialScene.instantiate()
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
        numberLabel.text = "---"
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
