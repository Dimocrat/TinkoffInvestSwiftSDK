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

private enum Constants {
    static let invertURL = "invest-public-api.tinkoff.ru"
    static let investPort = 443
}

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

    lazy var channel = try! GRPCChannelPool.with(target: .hostAndPort(Constants.invertURL, Constants.investPort),
                                                 transportSecurity: .tls(.makeClientConfigurationBackedByNIOSSL()),
                                                 eventLoopGroup: group) {
        $0.idleTimeout = .minutes(30)
        $0.keepalive = ClientConnectionKeepalive(
            interval: .seconds(15),
            timeout: .seconds(10)
          )
    }
    lazy var executor = GRPCExecutor(callOptions: defaulCallOptions)

    // MARK: - Initialization

    init(tokenProvider: TinkoffInvestTokenProvider) {
        self.tokenProvider = tokenProvider
    }

    deinit {
        try? group.syncShutdownGracefully()
    }
}
