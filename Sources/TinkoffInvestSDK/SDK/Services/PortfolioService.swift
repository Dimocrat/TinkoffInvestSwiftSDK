//
//  PortfolioService.swift
//  TinkoffInvestSwiftSDK
//
//  Created by m.monakov on 19.01.2022.
//

import Combine
import GRPC
import CombineGRPC

public typealias PositionsResponse = Tinkoff_Public_Invest_Api_Contract_V1_PositionsResponse
public typealias PortfolioResponse = Tinkoff_Public_Invest_Api_Contract_V1_PortfolioResponse
public typealias WithdrawLimitsResponse = Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsResponse
public typealias OperationsRequest = Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest
public typealias OperationsResponse = Tinkoff_Public_Invest_Api_Contract_V1_OperationsResponse
public typealias OperationsServiceClient = Tinkoff_Public_Invest_Api_Contract_V1_OperationsServiceNIOClient
public typealias PositionsRequest = Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest
public typealias WithdrawLimitsRequest = Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest
public typealias PortfolioRequest = Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest
public typealias GetOperationsByCursorRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorRequest
public typealias GetOperationsByCursorResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorResponse

public protocol PortfolioService: AnyObject {

    func getPortfolio(accountID: String) -> AnyPublisher<PortfolioResponse, RPCError>

    func getPositions(accountID: String) -> AnyPublisher<PositionsResponse, RPCError>

    func getWithdrawLimits(accountID: String) -> AnyPublisher<WithdrawLimitsResponse, RPCError>

    func getOperations(request: OperationsRequest) -> AnyPublisher<OperationsResponse, RPCError>
    
    func getOperationsByCursor(request: GetOperationsByCursorRequest) -> AnyPublisher<GetOperationsByCursorResponse, RPCError>
}

final class GRPCPortfolioService: BaseCombineGRPCService, PortfolioService {

    // MARK: - Private

    private lazy var client = OperationsServiceClient(channel: channel)

    // MARK: - PortfolioService

    func getPortfolio(accountID: String) -> AnyPublisher<PortfolioResponse, RPCError> {
        var request = PortfolioRequest()
        request.accountID = accountID
        return executor.call(client.getPortfolio)(request)
    }

    func getPositions(accountID: String) -> AnyPublisher<PositionsResponse, RPCError> {
        var request = PositionsRequest()
        request.accountID = accountID
        return executor.call(client.getPositions)(request)
    }

    func getWithdrawLimits(accountID: String) -> AnyPublisher<WithdrawLimitsResponse, RPCError> {
        var request = WithdrawLimitsRequest()
        request.accountID = accountID
        return executor.call(client.getWithdrawLimits)(request)
    }

    func getOperations(request: OperationsRequest) -> AnyPublisher<OperationsResponse, RPCError> {
        return executor.call(client.getOperations)(request)
    }
    
    func getOperationsByCursor(request: GetOperationsByCursorRequest) -> AnyPublisher<GetOperationsByCursorResponse, RPCError> {
        return executor.call(client.getOperationsByCursor)(request)
    }
}
