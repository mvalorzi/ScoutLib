//
//  ImageLoader.swift
//  BookLib
//
//  Created by Martín Valorzi on 23/04/2021.
//

import SwiftUI
import Combine

public class ImageLoader: ObservableObject {
    @Published public var image: UIImage? = nil
    private let url: URL?
    private var cancellable: AnyCancellable? = nil
    
    init(_ url: String?) {
        if let url = url {
            self.url = URL(string: url)
        } else {
            self.url = nil
        }
    }
    
    init(_ url: URL?) {
        self.url = url
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        guard let url = url else { return }
        cancel()
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue(label: "ImageQueue", qos: DispatchQoS.background))
            .map {
                if let image = UIImage(data: $0.data) {
                    return image
                } else {
                    return nil
                }
            }
            .replaceError(with: UIImage(named: "error"))
            .replaceNil(with: UIImage(named: "error"))
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
