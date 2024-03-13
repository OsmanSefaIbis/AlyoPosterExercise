//
//  PosterModel.swift
//  AlyoPoster
//
//  Created by Sefa İbiş on 13.03.2024.
//

import Foundation

// - Class: Contract
protocol ContractOfPosterModel: AnyObject {
    
    var delegate: DelegateOfPosterModel? { get set }
    
}

// - Class: Communicator
protocol DelegateOfPosterModel: AnyObject {
    // TODO: fill
}

// MARK: Class + Contract Conformance
final class PosterModel: ContractOfPosterModel {
    
    // - Variables: MVVM
    var delegate: DelegateOfPosterModel?
    // - Variables: Data
    
    
    private(set) var posterItems: [PosterItem] = []
    
    
    
    func requestPosterData() {
        guard let url = URL(string: "https://ak1dtm.storage.googleapis.com/interview/small.json") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let data = data {
                guard let decodedData = try? JSONDecoder().decode(PosterItems.self, from: data) else { return }
                guard let unwrappedItems = decodedData.items else { return }
                self.posterItems = unwrappedItems
            }
        }
        task.resume()
    }
}

