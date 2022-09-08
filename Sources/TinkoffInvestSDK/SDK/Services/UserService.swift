//
//  UserService.swift
//  TinkoffInvestSwiftSDK
//
//  Created by m.monakov on 19.01.2022.
//

import Combine
import GRPC
import CombineGRPC

public typealias GetAccountsResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsResponse
public typealias GetInfoResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetInfoResponse
public typealias GetMarginAttributesResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesResponse
public typealias GetUserTariffResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffResponse
public typealias UsersServiceClient = Tinkoff_Public_Invest_Api_Contract_V1_UsersServiceNIOClient
public typealias GetAccountsRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest
public typealias GetMarginAttributesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest
public typealias GetUserTariffRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest

public protocol UserService {
    func getAccounts() -> AnyPublisher<GetAccountsResponse, RPCError>

    func getUserInfo() -> AnyPublisher<GetInfoResponse, RPCError>

    func getMarginAttributes(accountID: String) -> AnyPublisher<GetMarginAttributesResponse, RPCError>

    func getUserTariffRequest() -> AnyPublisher<GetUserTariffResponse, RPCError>
}

final class GRPCUserService: BaseCombineGRPCService, UserService {

    private lazy var client = UsersServiceClient(channel: channel)

    // MARK: - UserService

    func getAccounts() -> AnyPublisher<GetAccountsResponse, RPCError> {
        return executor.call(client.getAccounts)(GetAccountsRequest())
    }

    func getUserInfo() -> AnyPublisher<GetInfoResponse, RPCError> {
        return executor.call(client.getInfo)(.init())
    }

    func getMarginAttributes(accountID: String) -> AnyPublisher<GetMarginAttributesResponse, RPCError> {
        var request = GetMarginAttributesRequest()
        request.accountID = accountID
        return executor.call(client.getMarginAttributes)(request)
    }

    func getUserTariffRequest() -> AnyPublisher<GetUserTariffResponse, RPCError> {
        return executor.call(client.getUserTariff)(GetUserTariffRequest())
    }
}
