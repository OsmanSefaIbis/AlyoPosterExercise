//
//  PosterViewModel.swift
//  AlyoPoster
//
//  Created by Sefa İbiş on 13.03.2024.
//

import Foundation

// - Class: Contract
protocol ContractForPosterVM: AnyObject {
    var delegate: DelegateOfPosterVM? { get set }
}

// - Class: Communicator
protocol DelegateOfPosterVM: AnyObject {

}

// MARK: Class
final class PosterVM {
    
    // - Variables: MVVM
    private lazy var model: ContractOfPosterModel = PosterModel()
    weak var view: ContractForPosterVC?
    weak var delegate: DelegateOfPosterVM?
    
    // - Variables: State
    // TODO: In-case
    
    // - Lifecycle: Object
    init(view: ContractForPosterVC) {
        model.delegate = self
        self.view = view
    }
}

// - Conformance: Class Contract 
extension PosterVM: ContractForPosterVM {
    
}

// - Notify: MVVM
extension PosterVM: DelegateOfPosterModel {
    
}

// - Extended: Helper Class Methods
extension PosterVM {
    
    // TODO: In-case
}





