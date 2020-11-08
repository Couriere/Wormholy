//
//  URLSessionConfiguration+Wormholy.swift
//  Wormholy-iOS
//
//  Created by Vladimir Kazantsev on 08.11.2020.
//  Copyright © 2020 Wormholy. All rights reserved.
//

import Foundation

extension URLSessionConfiguration {

	// Swizzling
	static let configurationInitsSwizzle: Void = {
		swizzleClassMethod( #selector( getter: URLSessionConfiguration.default ), #selector( getter: URLSessionConfiguration.wormholy_defaultSessionConfiguration ))
		swizzleClassMethod( #selector( getter: URLSessionConfiguration.ephemeral ), #selector( getter: URLSessionConfiguration.wormholy_ephemeralSessionConfiguration ))
	}()

	class func swizzleClassMethod( _ originalSelector: Selector, _ swizzledSelector: Selector ) {
		let klass: AnyClass = object_getClass( self )!

		let swizzledMethod = class_getClassMethod( klass, swizzledSelector )!
		let originalMethod = class_getClassMethod( klass, originalSelector )!

		method_exchangeImplementations( originalMethod, swizzledMethod )
	}

	@objc private class var wormholy_defaultSessionConfiguration: URLSessionConfiguration {
		let configuration = URLSessionConfiguration.wormholy_defaultSessionConfiguration // Original method
		Wormholy.enable( true, sessionConfiguration: configuration )
		return configuration
	}

	@objc private class var wormholy_ephemeralSessionConfiguration: URLSessionConfiguration {
		let configuration = URLSessionConfiguration.wormholy_ephemeralSessionConfiguration // Original method
		Wormholy.enable( true, sessionConfiguration: configuration )
		return configuration
	}
}
