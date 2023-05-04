//
//  BaseCombineGRPCService.swift
//  TinkoffInvestSwiftSDK
//
//  Created by m.monakov on 19.01.2022.
//

import CombineGRPC
import Combine
import GRPC
import NIO
import NIOHPACK
import NIOTransportServices

private enum Constants {
    static let invertURL = "invest-public-api.tinkoff.ru"
    static let investPort = 443
}

//class ConnectionStatusManager: ConnectivityStateDelegate {
//    var connectionStateChange: ((_ from: ConnectionState, _ to: ConnectionState) -> Void)?
//    init() { }
//
//    func connectivityStateDidChange(from oldState: ConnectivityState, to newState: ConnectivityState) {
//        connectionStateChange?(oldState.toConnectionState(), newState.toConnectionState())
//    }
//}

class BaseCombineGRPCService {

    // MARK: - Private Properties

    private let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
    private let tokenProvider: TinkoffInvestTokenProvider
    private lazy var defaulCallOptions = CurrentValueSubject<CallOptions, Never>(
        CallOptions(
            customMetadata: [
                "Authorization": "Bearer \(tokenProvider.provideToken())",
                "x-app-name": "JohnReeze.TinkoffInvestSwiftSDK"
            ]
        )
    ).eraseToAnyPublisher()

    // MARK: - Internal Properties
    
    lazy var channel = ClientConnection.usingPlatformAppropriateTLS(for: NIOTSEventLoopGroup(loopCount: 1, defaultQoS: .default)).withKeepalive(.init(interval: .seconds(15), timeout: .seconds(10)))
        .connect(host: Constants.invertURL, port: Constants.investPort)

//    lazy var channel = try! GRPCChannelPool.with(target: .hostAndPort(Constants.invertURL, Constants.investPort),
//                                                 transportSecurity: .tls(.makeClientConfigurationBackedByNIOSSL()),
//                                                 eventLoopGroup: group) {
//        $0.idleTimeout = .minutes(30)
//        $0.keepalive = ClientConnectionKeepalive(
//            interval: .seconds(15),
//            timeout: .seconds(10)
//          )
//    }
    lazy var executor = GRPCExecutor(callOptions: defaulCallOptions)

    // MARK: - Initialization

    init(tokenProvider: TinkoffInvestTokenProvider) {
        self.tokenProvider = tokenProvider
    }

    deinit {
        try? group.syncShutdownGracefully()
    }
}
