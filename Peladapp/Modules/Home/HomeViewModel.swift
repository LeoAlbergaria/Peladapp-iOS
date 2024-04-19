//
//  HomeViewModel.swift
//  Peladapp
//
//  Created by Leonardo Albergaria on 19/04/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var inList: [String] { get }
    var waitingList: [String] { get }
    var outList: [String] { get }
}

class HomeViewModel: HomeViewModelProtocol {
    let inList: [String] = ["Leo", "Pedro", "Gabriel"]
    let waitingList: [String] = ["Joao"]
    let outList: [String] = ["Murilo"]
}
