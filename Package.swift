// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "ReusableViewExtensions",
    products: [
        .library(
            name: "ReusableViewExtensions", targets: ["ReusableViewExtensions"])
        ],
        dependencies: [ ],
        targets: [
            .target(
                name: "ReusableViewExtensions",
                path: "ReusableViewExtensions",
                sources: ["Classes"]),
    ]
)
