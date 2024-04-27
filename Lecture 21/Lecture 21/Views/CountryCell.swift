//
//  CountryCell.swift
//  Lecture 21
//

import UIKit

class CountryCell: UITableViewCell {
    
    static let identifier = "CountryCell"
    
    //    MARK: - Variables
    
    private(set) var country: Country!
    
    //    MARK: - UI Components
    
    private let countryFlag: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .black
        return iv
    }()
    
    private let countryName: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "Error"
        return label
    }()
    
    //    MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with country: Country) {
        self.country = country
        
        let commonName = country.name.common
        self.countryName.text = commonName
        
        guard let imageURL = self.country.imageURL else {
            return
        }
        
        // Use URLSession to asynchronously load image data
        URLSession.shared.dataTask(with: imageURL) { [weak self] (data, response, error) in
            if let error = error {
                // Handle error
                print("Error loading image data: \(error)")
                return
            }
            
            if let data = data {
                // Update UI on the main thread
                DispatchQueue.main.async {
                    self?.countryFlag.image = UIImage(data: data)
                }
            }
        }.resume()
    }

    
    //    MARK: - UI Setup
    
    private func setupUI() {
        
        self.addSubview(countryFlag)
        self.addSubview(countryName)
        
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryFlag.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryFlag.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            countryFlag.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            countryFlag.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            
            countryName.leadingAnchor.constraint(equalTo: countryFlag.trailingAnchor, constant: 16),
            countryName.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
}
