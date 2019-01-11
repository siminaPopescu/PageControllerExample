//
//  ViewController.swift
//  PageControllerExample
//
//  Created by Simina Popescu on 11/01/2019.
//  Copyright © 2019 SiminaTutorials. All rights reserved.
//

import Cocoa

enum StoryboardName: String {
    case Main
}
extension NSViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func instantiate<T: NSViewController>(from storyboard: StoryboardName) -> T? {
        return NSStoryboard(name: storyboard.rawValue, bundle: nil).instantiateInitialController() as? T
    }
    
    func instantiate<T: NSViewController>(from storyboard: StoryboardName, viewController: T.Type) -> T? {
        return NSStoryboard(name: storyboard.rawValue, bundle: nil).instantiateController(withIdentifier: viewController.identifier) as? T
    }
    
    func instantiate<T: NSViewController>(from storyboard: StoryboardName, with identifier: String) -> T? {
        return NSStoryboard(name: storyboard.rawValue, bundle: nil).instantiateController(withIdentifier: identifier) as? T
    }
}
