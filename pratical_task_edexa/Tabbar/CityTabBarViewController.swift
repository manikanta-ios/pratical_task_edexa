//
//  CityTabBarViewController.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 25/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import UIKit

class CityTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let firstViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        firstViewController.selectedTab = .all
        firstViewController.tabBarItem = UITabBarItem(title: "All", image: nil, tag: 0)
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        secondViewController.selectedTab = .chicago
        secondViewController.tabBarItem = UITabBarItem(title: "Chicago", image: nil, tag: 1)
        let thirdViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        thirdViewController.selectedTab = .newYork
        thirdViewController.tabBarItem = UITabBarItem(title: "New York", image: nil, tag: 2)
        let fourthViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        fourthViewController.selectedTab = .losAngeles
        fourthViewController.tabBarItem = UITabBarItem(title: "Los Angeles", image: nil, tag: 3)

        let tabBarList = [firstViewController, secondViewController,thirdViewController,fourthViewController]
        viewControllers = tabBarList

    }
}
