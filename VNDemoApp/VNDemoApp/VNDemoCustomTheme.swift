//
//  VNDemoCustomTheme.swift
//  VNDemoApp
//
//  Created by TJ Olsen on 11/2/22.
//

import Foundation
import UIKit
import VNWebSDK

/*
 TODO: A custom theme can be created, if desired, by conforming to VNThemable.
 */
class VNDemoCustomTheme: VNThemable {
	var navigationBarBackground: UIColor {
		return .white
	}
	
	var accent: UIColor {
		return .systemBlue
	}
	
	var backString: String {
		return "Custom Back"
	}
	
	var closeString: String {
		return "Custom Close"
	}
}
