//
//  ImageAsync.swift
//  BookLib
//
//  Created by Martín Valorzi on 23/04/2021.
//

import SwiftUI

public struct ImageAsync: View {
    @ObservedObject var imageLoader: ImageLoader
    private let content: ((Image) -> Image)?
    fileprivate var placeholder: AnyView? = nil
    
    init(_ url: String?, content: ((Image) -> Image)? = nil) {
        imageLoader = ImageLoader(url)
        self.content = content
    }
    
    init(_ url: URL?, placeholder: AnyView? = nil, content: ((Image) -> Image)? = nil) {
        imageLoader = ImageLoader(url)
        self.content = content
    }
    
    public var body: some View {
        let image: Image?
        if let i = imageLoader.image {
            image = Image(uiImage: i)
        } else {
            image = nil
        }
        let result: AnyView?
        if let image = image  {
            if let r = content?(image) {
                result = AnyView(r)
            } else {
                result = AnyView(image)
            }
        } else {
            result = AnyView(Color.clear)
        }
        return Group {
            if imageLoader.image == nil {
                result.overlay(placeholder)
            } else {
                result
            }
        }.onAppear {
            imageLoader.load()
        }.onDisappear {
            imageLoader.cancel()
        }
    }
}
public extension ImageAsync {
    func placeholder<T: View>(@ViewBuilder content: () -> T) -> ImageAsync {
        var result = self
        result.placeholder = AnyView(content())
        return result
    }
    
    func placeholder(_ text: Text) -> ImageAsync {
        var result = self
        result.placeholder = AnyView(text)
        return result
    }
    
    func placeholder(_ image: Image) -> ImageAsync {
        var result = self
        result.placeholder = AnyView(image)
        return result
    }
}
