//
//  PosterViewModel.swift
//  AlyoPoster
//
//  Created by Sefa İbiş on 13.03.2024.
//

import Foundation

typealias RowItem = PosterCellDataModel

// - Class: Contract
protocol ContractForPosterVM: AnyObject {
    var delegate: DelegateOfPosterVM? { get set }
    var posters: [RowItem] { get set }
    func viewDidLoad()
    func getPoster(at index: IndexPath) -> RowItem?
}

// - Class: Communicator
protocol DelegateOfPosterVM: AnyObject {
    func didLoadPosters()
}

// MARK: Class
final class PosterVM {
    
    // - Variables: MVVM
    private lazy var model: ContractOfPosterModel = PosterModel()
    weak var view: ContractForPosterVC?
    weak var delegate: DelegateOfPosterVM?
    
    // - Variables: State
    var posters: [RowItem] = []
    
    // - Lifecycle: Object
    init(view: ContractForPosterVC) {
        model.delegate = self
        self.view = view
    }
}

// - Conformance: Class Contract 
extension PosterVM: ContractForPosterVM {
    
    func viewDidLoad() {
        view?.setupTableView()
        model.requestPosterData()
    }
    
    func getPoster(at index: IndexPath) -> RowItem? {
        guard index.item < posters.count else { return nil }
        return posters[index.item]
    }
}

// - Notify: MVVM
extension PosterVM: DelegateOfPosterModel {
    func didGetPosterData() {
        let data: [RowItem] = model.posterItems.map {
            return RowItem(
                posterUrl: $0.poster ?? "",
                posterNo: $0.title ?? ""
            )
        }
        self.posters = data
        self.delegate?.didLoadPosters()
    }
    func didFailPosterDataRetrieval() {
        fatalError("Fail gracefully @didFailPosterDataRetrieval()")
    }
}

// - Extended: Helper Class Methods
extension PosterVM {
    // TODO: In-case
}





