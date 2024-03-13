//
//  PosterCell.swift
//  AlyoPoster
//
//  Created by Sefa İbiş on 13.03.2024.
//

import UIKit
import Kingfisher

final class PosterCell: UITableViewCell {

    // Variables: Id text
    static let nibName = "PosterCell", reuseId = "PosterCell"
    
    // Variables: UI
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var posterNo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with data: RowItem) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            guard let url = URL(string: data.posterUrl) else { return }
            self.posterImage.kf.setImage(with: url)
            self.posterNo.text = data.posterNo
        }
    }
}

// Data Model: PosterCell, RowItem is type alias
struct PosterCellDataModel {
    let posterUrl: String
    let posterNo: String
}
