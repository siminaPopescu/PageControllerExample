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
}

// MARK: - Page Controller delegate
extension PageController: NSPageControllerDelegate {
    
    func pageController(_ pageController: NSPageController, viewControllerForIdentifier identifier: NSPageController.ObjectIdentifier) -> NSViewController {
        return NSStoryboard(name: Constants.storyboard, bundle: nil).instantiateController(withIdentifier: identifier) as? NSViewController ?? NSViewController()
    }
    
    func pageController(_ pageController: NSPageController, identifierFor object: Any) -> NSPageController.ObjectIdentifier {
        return String(describing: object)
    }
    
    func pageControllerDidEndLiveTransition(_ pageController: NSPageController) {
        completeTransition()
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
