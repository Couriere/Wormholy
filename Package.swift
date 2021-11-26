// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "Wormholy",
	products: [
		// Products define the executables and libraries produced by a package, and make them visible to other packages.
		.library( name: "Wormholy", type: .dynamic, targets: [ "Wormholy" ] ),
	],
	dependencies: [
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages which this package depends on.
		.target(
			name: "Wormholy",
			dependencies: [],
			path: "Sources"),
		.testTarget( name: "WormholyTests", dependencies: ["Wormholy"], path: "Tests" ),
	],
	swiftLanguageVersions: [.v5]
)
