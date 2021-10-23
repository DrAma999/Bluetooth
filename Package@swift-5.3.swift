// swift-tools-version:5.3
import PackageDescription

//#if os(Linux)
//let libraryType: PackageDescription.Product.Library.LibraryType = .dynamic
//#else
//let libraryType: PackageDescription.Product.Library.LibraryType = .static
//#endif

let package = Package(
    name: "Bluetooth",
    products: [
        .library(
            name: "Bluetooth",
            type: .static,
            targets: ["Bluetooth"]
        ),
        .library(
            name: "BluetoothGAP",
            type: .static,
            targets: ["BluetoothGAP"]
        ),
        .library(
            name: "BluetoothGATT",
            type: .static,
            targets: ["BluetoothGATT"]
        ),
        .library(
            name: "BluetoothHCI",
            type: .static,
            targets: ["BluetoothHCI"]
        )
    ],
    targets: [
        .target(
            name: "Bluetooth"
        ),
        .target(
            name: "BluetoothGAP",
            dependencies: [
                "Bluetooth"
            ]
        ),
        .target(
            name: "BluetoothGATT",
            dependencies: [
                "Bluetooth",
            ]
        ),
        .target(
            name: "BluetoothHCI",
            dependencies: [
                "Bluetooth",
                "BluetoothGAP"
            ]
        ),
        .testTarget(
            name: "BluetoothTests",
            dependencies: [
                "Bluetooth",
                "BluetoothGAP",
                "BluetoothGATT",
                "BluetoothHCI"
            ]
        )
    ]
)
