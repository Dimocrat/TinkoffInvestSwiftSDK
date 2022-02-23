//
//  OrdersService.swift
//  TinkoffInvestSDK
//
//  Created by Ewg on 08.02.2022.
//

import Foundation

import Combine
import GRPC
import CombineGRPC

public protocol OrdersService: AnyObject {
    ///Метод выставления заявки.
    func postOrder(request: PostOrderRequest) -> AnyPublisher<PostOrderResponse, RPCError>

    ///Метод получения списка активных заявок по счёту.
    func getOrders(request: GetOrdersRequest) -> AnyPublisher<GetOrdersResponse, RPCError>

    ///Метод получения статуса торгового поручения.
    func getOrderState(request: GetOrderStateRequest) -> AnyPublisher<OrderState, RPCError>

    ///Метод отмены биржевой заявки.
    func cancelOrder(request: CancelOrderRequest) -> AnyPublisher<CancelOrderResponse, RPCError>
}

final class GRPCOrdersService: BaseCombineGRPCService, OrdersService {

    // MARK: - Private

    private lazy var client = OrdersServiceClient(channel: channel)

    // MARK: - ordersService

    func postOrder(request: PostOrderRequest) -> AnyPublisher<PostOrderResponse, RPCError> {
        executor.call(client.postOrder)(request)
    }

    func getOrders(request: GetOrdersRequest) -> AnyPublisher<GetOrdersResponse, RPCError> {
        executor.call(client.getOrders)(request)
    }

    func getOrderState(request: GetOrderStateRequest) -> AnyPublisher<OrderState, RPCError> {
        executor.call(client.getOrderState)(request)
    }

    func cancelOrder(request: CancelOrderRequest) -> AnyPublisher<CancelOrderResponse, RPCError> {
        executor.call(client.cancelOrder)(request)
    }
}
