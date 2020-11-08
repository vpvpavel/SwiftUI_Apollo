//
//  ContentView.swift
//  SwiftUI_Apollo
//
//  Created by Pavlo Vorobiov on 11/7/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var countyEmoji = ""
    
    var body: some View {
        Text(countyEmoji).onAppear(perform: {
            Network.shared.apollo.fetch(query: CountryInfoQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    DispatchQueue.main.async {
                        if let emoji = graphQLResult.data?.country?.emoji {
                            self.countyEmoji = emoji
                        }
                    }
                case .failure(let error):
                    print("Error \(error)")
                }
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
