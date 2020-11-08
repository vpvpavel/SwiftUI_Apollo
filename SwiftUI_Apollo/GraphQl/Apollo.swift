//
//  Apollo.swift
//  SwiftUI_Apollo
//
//  Created by Pavlo Vorobiov on 11/8/20.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
}
