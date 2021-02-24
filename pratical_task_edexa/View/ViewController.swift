//
//  ViewController.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 24/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var citiesTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    var selectedTab : CityEnum = .all
    var viewModel = CityViewModel()
    var selectedIndexPaths : [IndexPath] = []
    var  searchActive : Bool = false
    
    var filtered : [City] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        citiesTableView.register(UINib(nibName: "CityCell", bundle: nil), forCellReuseIdentifier: "CityCell")
        viewModel.cityDidChanges = { (finished, error) in
            if !error {
                self.setDataToUI()
            }
        }
        self.searchBar.showsCancelButton = false

        viewModel.fetchCitiesList()
        setupLongPressGesture()
    }
    override func viewWillAppear(_ animated: Bool) {
        selectedIndexPaths = []
        searchActive = false
        self.searchBar?.text = nil
        setDataToUI()

    }
    override func viewDidDisappear(_ animated: Bool) {
        
        for each in tabBarController?.tabBar.items ?? [] {
            each.badgeValue = nil
        }
    }

    
    func setDataToUI()  {
        switch selectedTab {
               case .losAngeles:
                   viewModel.selectedTabData = viewModel.cities?.getLosAngels() ?? []
               case .chicago:
                   viewModel.selectedTabData = viewModel.cities?.getChicago() ?? []
        case .newYork:
                   viewModel.selectedTabData = viewModel.cities?.getNewYork() ?? []
               default:
                   viewModel.selectedTabData = viewModel.cities ?? []
        }
        reloadData()
    }

    
    func reloadData()  {
        citiesTableView?.reloadData()
    }
}

extension ViewController : UIGestureRecognizerDelegate {
   
    func setupLongPressGesture() {
          let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
          longPressGesture.minimumPressDuration = 0.5 // 1 second press
          longPressGesture.delegate = self
          self.citiesTableView.addGestureRecognizer(longPressGesture)
      }

      @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
          if gestureRecognizer.state == .began {
              let touchPoint = gestureRecognizer.location(in: self.citiesTableView)
              if let indexPath = citiesTableView.indexPathForRow(at: touchPoint) {

                if selectedIndexPaths.contains(indexPath) {
                    if let index = selectedIndexPaths.firstIndex(of: indexPath) {
                        selectedIndexPaths.remove(at: index)
                    }
                } else{
                    selectedIndexPaths.append(indexPath)
                }
                
                if selectedIndexPaths.count == 0 {
                    tabBarController?.tabBar.items?[tabBarController?.tabBar.selectedItem?.tag ?? 0].badgeValue = nil
                } else{
                    tabBarController?.tabBar.items?[tabBarController?.tabBar.selectedItem?.tag ?? 0].badgeValue = "\(selectedIndexPaths.count)"
                }
                self.reloadData()
                self.view.endEditing(true)

              }
          }
      }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchActive ? filtered.count : viewModel.selectedTabData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        var eachItem = viewModel.selectedTabData[indexPath.row]
        if searchActive {
            eachItem = filtered[indexPath.row]
        }
        cell.employeeNameLabel?.text = eachItem.firstName + " " + eachItem.lastName
        cell.cityNameLabel?.text = eachItem.city.map { $0.rawValue }
        cell.indexLabel?.text = (cell.cityNameLabel?.text ?? "" ).getFirstCharecter()
        
        if selectedIndexPaths.contains(indexPath) {
            cell.backgroundColor = cell.indexLabel.backgroundColor
        } else{
            cell.backgroundColor = .clear
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let eachItem = viewModel.selectedTabData[indexPath.row]
        showAlert("You have selected : \(eachItem.firstName + " " + eachItem.lastName)", controller: self)
        self.view.endEditing(true)

    }
}

extension ViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.searchActive = true;
        self.searchBar.showsCancelButton = true


        filtered = []
        filtered = searchText.isEmpty ? viewModel.selectedTabData  : viewModel.selectedTabData .filter { $0.firstName.contains(searchText) }
           self.reloadData()
       }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           searchActive = true
       }

       func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
           searchActive = false
       }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchActive = false;
           searchBar.text = nil
           searchBar.resignFirstResponder()
           citiesTableView.resignFirstResponder()
           self.searchBar.showsCancelButton = false
           citiesTableView.reloadData()
       }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
           searchActive = false
       }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
                   return true
       }
}


extension String {
    func getFirstCharecter() -> String {
        return String(self.prefix(1))
    }
}
