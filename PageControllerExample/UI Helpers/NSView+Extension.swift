//
//  NSView+Extension.swift
//  PageControllerExample
//
//  Created by Simina Popescu on 11/01/2019.
//  Copyright © 2019 SiminaTutorials. All rights reserved.
//

import Cocoa

extension NSView {
    @IBInspectable var backgroundColor: NSColor {
        get {
            return NSColor(cgColor: layer?.backgroundColor ?? .white) ?? .white
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue.cgColor
        }
    }
}
