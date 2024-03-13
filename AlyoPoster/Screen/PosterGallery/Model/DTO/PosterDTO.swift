//
//  PosterDTO.swift
//  AlyoPoster
//
//  Created by Sefa İbiş on 13.03.2024.
//

struct PosterItems: Decodable {
    let items: [PosterItem]?
}

struct PosterItem: Decodable {
    let poster: String?
    let title: String?
}
