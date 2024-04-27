//
//  ViewCountryControllerViewModel.swift
//  Lecture 21
//

import Foundation
import UIKit

class ViewCountryControllerViewModel {
    
    var onImageLoaded: ((UIImage?)->Void)?
    
    //    MARK: - Variables
    
    let country: Country
    
    //    MARK: - Initializer
    
    init(_ country: Country) {
        self.country = country
        self.loadImage()
    }
    
    private func loadImage() {
        DispatchQueue.global().async { [weak self] in
            if let imageURL = self?.country.imageURL,
               let imageData = try? Data(contentsOf: imageURL),
               let flagImage = UIImage(data: imageData) {
                self?.onImageLoaded?(flagImage)
            }
        }
    }
    
    //    MARK: - Computed Properties
    
    var aboutLabel: String {
        return "About the flag:"
    }
    
    var descriptionLabel: String {
        return "\(self.country.flags.alt)"
    }
    
}



