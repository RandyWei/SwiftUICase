//
//  AsnycImage.swift
//  NewsApp
//
//  Created by RandyWei on 2021/7/30.
//

import SwiftUI
import Combine

struct AsyncImage<PlaceHolder:View>:View {
    
    private let placeHolder:PlaceHolder
    @StateObject private var loader:ImageLoader
    
    init(_ url:String, @ViewBuilder placeHolder: ()-> PlaceHolder) {
        self.placeHolder = placeHolder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View{
        Group{
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
                    .scaledToFit()
            } else {
                placeHolder
            }
        }.onAppear(perform: loader.load)
    }
}

class ImageLoader:ObservableObject {
    @Published var image:UIImage?
    
    private let url:String
    
    private var cancelable:AnyCancellable?
    
    init(url:String) {
        self.url = url
    }
    
    func load(){
        guard let url = URL(string: url) else {
            return
        }
        
        cancelable = URLSession.shared.dataTaskPublisher(for: url)
            .map{ UIImage(data: $0.data)}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in
                self?.image = $0
            })
    }
    
    deinit {
        cancelable?.cancel()
    }
}
