// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "PhoneNumberKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_13),
        .tvOS(.v12),
        .watchOS(.v4)
    ],
    products: [
        .library(name: "PhoneNumberKit", targets: ["PhoneNumberKit"]),
        .library(name: "PhoneNumberKit-Static", type: .static, targets: ["PhoneNumberKit"]),
        .library(name: "PhoneNumberKit-Dynamic", type: .dynamic, targets: ["PhoneNumberKit"])
    ],
    targets: [
        .target(name: "PhoneNumberKit",
                path: "PhoneNumberKit",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update_metadata.sh",
                          "Info.plist"],
                resources: [
                    .process("Resources/PhoneNumberMetadata.json")
                ],
                swiftSettings: [
                    .define("BUILD_LIBRARY_FOR_DISTRIBUTION")
                ]
               ),
        .testTarget(name: "PhoneNumberKitTests",
                    dependencies: ["PhoneNumberKit"],
                    path: "PhoneNumberKitTests",
                    exclude: ["Info.plist"])
    ]
)
