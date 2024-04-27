//
//  ViewController.swift
//  Lecture 21
//

import UIKit

class HomeController: UIViewController {
    
    //    MARK: - Variables
    
    private let countries: [Country] = [
        Country(capital: "Tbilisi", region: "Tbilisi", subregion: "Kartli", area: 10, continents: "Europe", startOfWeek: "Monday", name: Country.Name(common: "Georgia"), flags: Country.Flags(alt: "Red and White"))
    ]
    
    //    MARK: - UI Components
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .systemBackground
        tv.register(CountryCell.self, forCellReuseIdentifier: CountryCell.identifier)
        return tv
    }()
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //    MARK: - UI Setup
    
    private func setupUI() {
        self.navigationItem.title = "Countries"
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

//MARK: - TableView Functions

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryCell.identifier, for: indexPath) as? CountryCell else {
            fatalError("Unable to dequeue CountryCell in HomeController")
        }
        
        let country = self.countries[indexPath.row]
        cell.configure(with: country)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let country = self.countries[indexPath.row]
        let vm = ViewCountryControllerViewModel(country)
        let vc = ViewCountryController(vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

