//
//  PageController.swift
//  PageControllerExample
//
//  Created by Simina Popescu on 11/01/2019.
//  Copyright © 2019 SiminaTutorials. All rights reserved.
//

import Cocoa

private struct Constants {
    static let storyboard = "Main"
    static let last = 1
    static let first = 0
}

class PageController: NSPageController {
    
    private var myViewControllers = ["page1", "page2", "page3", "page4", "page5", "page6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        arrangedObjects = myViewControllers
    }
    
    @IBAction func goToPage3(_ sender : Any) {
        // because the array starts from 0
        changePageController(at: 2)
    }
    
    @IBAction func goToPage4(_ sender: Any) {
        changePageController(at: 3)
    }
}

// MARK: - Page Controller delegate
extension PageController: NSPageControllerDelegate {
    
    func pageController(_ pageController: NSPageController, viewControllerForIdentifier identifier: NSPageController.ObjectIdentifier) -> NSViewController {
        return instantiate(from: .Main, with: identifier) ?? NSViewController()
    }
    
    func pageController(_ pageController: NSPageController, identifierFor object: Any) -> NSPageController.ObjectIdentifier {
        return String(describing: object)
    }
}

// MARK: - Navigation methods
extension PageController {
    
    private func changePageController(at index: Int) {
        selectedIndex = index
    }

    override func navigateForward(_ sender: Any?) {
        if selectedIndex < myViewControllers.count - Constants.last {
            changePageController(at: selectedIndex + Constants.last)
        }
    }

    override func navigateBack(_ sender: Any?) {
        if selectedIndex > 0 {
            changePageController(at: selectedIndex - Constants.last)
        }
    }
}
