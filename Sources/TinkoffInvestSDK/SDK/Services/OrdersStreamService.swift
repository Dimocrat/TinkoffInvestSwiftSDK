//
//  File.swift
//  
//
//  Created by Дмитрий Ли on 01.03.2022.
//

import Combine
import GRPC
import CombineGRPC
import Foundation

public protocol OrdersStreamService: AnyObject {
    ///Метод выставления заявки.
    func subscribeToOrders() -> AnyPublisher<TradesStreamResponse, RPCError>
}

final class GRPCOrdersStreamService: BaseCombineGRPCService, OrdersStreamService {
    // MARK: - Private
    
    private lazy var client = OrdersStreamServiceClient(channel: channel)

    private var currentRequestPublsher: AnyPublisher<TradesStreamRequest, Error> {
        return inputSubject.eraseToAnyPublisher()
    }

    private var inputSubject = CurrentValueSubject<TradesStreamRequest, Error>(TradesStreamRequest())
    private var currentResponsePublisher: AnyPublisher<TradesStreamResponse, RPCError>?

    // MARK: - MarketDataStreamService
    
    func subscribeToOrders() -> AnyPublisher<TradesStreamResponse, RPCError> {
        return performTrades(action: .subscribe)
    }
    
    func cancelAllSubscribtions() {
        inputSubject.send(completion: .finished)
        currentResponsePublisher = nil
    }

    // MARK: - Private help methods

    private func performTrades(action: SubscriptionAction) -> AnyPublisher<TradesStreamResponse, RPCError> {
        let subscribeRequest = TradesStreamRequest()
        return makeMarket(request: subscribeRequest)
    }

    private func makeMarket(request: TradesStreamRequest) -> AnyPublisher<TradesStreamResponse, RPCError>  {
        if let currentResponsePublisher = currentResponsePublisher {
            inputSubject.send(request)
            return currentResponsePublisher
        }

        inputSubject.send(request)

        let responsePublisher = executor.call(client.tradesStream)(request)
        
        self.currentResponsePublisher = responsePublisher
        return responsePublisher
    }
}
