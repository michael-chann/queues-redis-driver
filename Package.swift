// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "queues-redis-driver",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "QueuesRedisDriver",
            targets: ["QueuesRedisDriver"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/queues.git", from: "1.0.0"),
        .package(url: "https://github.com/michael-chann/redis.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "QueuesRedisDriver",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Queues", package: "queues"),
                .product(name: "Redis", package: "redis"),
            ]
        ),
        .testTarget(
            name: "QueuesRedisDriverTests",
            dependencies: [
                .target(name: "QueuesRedisDriver"),
                .product(name: "XCTVapor", package: "vapor"),
            ]
        ),
    ]
)
