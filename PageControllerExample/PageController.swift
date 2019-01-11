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
