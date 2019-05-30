//
//  RootViewModel.swift
//  GenerambaTemplates
//
//  Created by iganin on 30/05/2019.
//  Copyright © 2019 iganin. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa

protocol RootViewModelInput {
    var didTappedPlusButton: AnyObserver<Void> { get }
    var didTappedMinusButton: AnyObserver<Void> { get }
}

protocol RootViewModelOutput {
    var currentNumber: Driver<String> { get }
}

protocol RootViewModelType {
    var input: RootViewModelInput { get }
    var output: RootViewModelOutput { get }
}

final class RootViewModel: RootViewModelInput, RootViewModelOutput, RootViewModelType {

    typealias Dependency = (
        initialNumber: Int,
        wireframe: RootWireframe
    )

    var input: RootViewModelInput { return self }
    var output: RootViewModelOutput { return self }

    // MARK: Property
    let disposeBag = DisposeBag()

    // MARK: Input
    let didTappedPlusButton: AnyObserver<Void>
    let didTappedMinusButton: AnyObserver<Void>

    // MARK: Output
    let currentNumber: Driver<String>

    init(dependency: Dependency) {
        let wireframe = dependency.wireframe
        let initialNumber = dependency.initialNumber

        // input
        let didTappedPlusButtonRelay = PublishRelay<Void>()
        didTappedPlusButton = AnyObserver<Void> { event in
            if event.isCompleted { return }
            didTappedPlusButtonRelay.accept(())
        }
        let didTappedMinusButtonRelay = PublishRelay<Void>()
        didTappedMinusButton = AnyObserver<Void> { event in
            if event.isCompleted { return }
            didTappedMinusButtonRelay.accept(())
        }

        // output
        let currentNumberRelay = BehaviorRelay<Int>(value: initialNumber)
        currentNumber = currentNumberRelay
            .map { "\($0)" }
            .asDriver(onErrorJustReturn: "")

        // connection
        didTappedPlusButtonRelay
            .map { currentNumberRelay.value + 1 }
            .bind(to: currentNumberRelay)
            .disposed(by: disposeBag)
        
        didTappedMinusButtonRelay
            .map { currentNumberRelay.value - 1 }
            .bind(to: currentNumberRelay)
            .disposed(by: disposeBag)
    }
}
