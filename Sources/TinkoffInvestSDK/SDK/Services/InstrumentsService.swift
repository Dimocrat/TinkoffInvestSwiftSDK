//
//  InstrumentsService.swift
//  TinkoffInvestSDK
//
//  Created by m.monakov on 22.01.2022.
//

import Combine
import GRPC
import CombineGRPC

public typealias InstrumentIdType = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentIdType
public typealias TradingSchedulesRequest = Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedulesRequest
public typealias InstrumentRequest = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest
public typealias TradingSchedulesResponse = Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedulesResponse
public typealias GetAccruedInterestsRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetAccruedInterestsRequest
public typealias GetAccruedInterestsResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetAccruedInterestsResponse
public typealias GetFuturesMarginRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginRequest
public typealias GetFuturesMarginResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginResponse
public typealias InstrumentResponse = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentResponse
public typealias GetDividendsRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsRequest
public typealias GetDividendsResponse = Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsResponse
public typealias BondResponse = Tinkoff_Public_Invest_Api_Contract_V1_BondResponse
public typealias InstrumentStatus = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentStatus
public typealias BondsResponse = Tinkoff_Public_Invest_Api_Contract_V1_BondsResponse
public typealias CurrencyResponse = Tinkoff_Public_Invest_Api_Contract_V1_CurrencyResponse
public typealias EtfResponse = Tinkoff_Public_Invest_Api_Contract_V1_EtfResponse
public typealias EtfsResponse = Tinkoff_Public_Invest_Api_Contract_V1_EtfsResponse
public typealias FutureResponse = Tinkoff_Public_Invest_Api_Contract_V1_FutureResponse
public typealias FuturesResponse = Tinkoff_Public_Invest_Api_Contract_V1_FuturesResponse
public typealias ShareResponse = Tinkoff_Public_Invest_Api_Contract_V1_ShareResponse
public typealias SharesResponse = Tinkoff_Public_Invest_Api_Contract_V1_SharesResponse
public typealias InstrumentsRequest = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest
public typealias InstrumentsServiceClient = Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsServiceNIOClient
public typealias CurrenciesResponse = Tinkoff_Public_Invest_Api_Contract_V1_CurrenciesResponse

public struct InstrumentParameters {

    /// Тип идентификатора инструмента. Возможные значения: figi, ticker, isin. Подробнее об идентификации инструментов: [Идентификация инструментов](/investAPI/faq_identification/)
    public let idType: InstrumentIdType

    /// Идентификатор class_code. Обязателен при id_type = ticker.
    public let classCode: String

    /// Идентификатор запрашиваемого инструмента.
    public let id: String

    public init(idType: InstrumentIdType = .instrumentIDUnspecified,
                classCode: String = String(),
                id: String = String()) {
        self.idType = idType
        self.classCode = classCode
        self.id = id
    }

    var toInstrumentRequest: InstrumentRequest {
        var request = InstrumentRequest()
        request.id = id
        request.idType = idType
        request.classCode = classCode
        return request
    }
}

public protocol InstrumentsService {

    func getTradingSchedules(request: TradingSchedulesRequest) -> AnyPublisher<TradingSchedulesResponse, RPCError>
    func getAccruedInterests(request: GetAccruedInterestsRequest) -> AnyPublisher<GetAccruedInterestsResponse, RPCError>
    func getFuturesMargin(request: GetFuturesMarginRequest) -> AnyPublisher<GetFuturesMarginResponse, RPCError>
    func getInstrumentBy(params: InstrumentParameters) -> AnyPublisher<InstrumentResponse, RPCError>
    func getDividends(request: GetDividendsRequest) -> AnyPublisher<GetDividendsResponse, RPCError>

    func getBond(params: InstrumentParameters) -> AnyPublisher<BondResponse, RPCError>
    func getBonds(with status: InstrumentStatus) -> AnyPublisher<BondsResponse, RPCError>

    func getCurrency(params: InstrumentParameters) -> AnyPublisher<CurrencyResponse, RPCError>
    func getCurrencies(with status: InstrumentStatus) -> AnyPublisher<CurrenciesResponse, RPCError>

    func getEtf(params: InstrumentParameters) -> AnyPublisher<EtfResponse, RPCError>
    func getEtfs(with status: InstrumentStatus) -> AnyPublisher<EtfsResponse, RPCError>

    func getFuture(params: InstrumentParameters) -> AnyPublisher<FutureResponse, RPCError>
    func getFutures(with status: InstrumentStatus) -> AnyPublisher<FuturesResponse, RPCError>

    func getShare(params: InstrumentParameters) -> AnyPublisher<ShareResponse, RPCError>
    func getShares(with status: InstrumentStatus) -> AnyPublisher<SharesResponse, RPCError>
}

final class GRPCInstrumentsService: BaseCombineGRPCService, InstrumentsService {

    private lazy var client = InstrumentsServiceClient(channel: channel)

    // MARK: - InstrumentsService

    func getTradingSchedules(request: TradingSchedulesRequest) -> AnyPublisher<TradingSchedulesResponse, RPCError> {
        return executor.call(client.tradingSchedules)(request)
    }

    func getAccruedInterests(request: GetAccruedInterestsRequest) -> AnyPublisher<GetAccruedInterestsResponse, RPCError> {
        return executor.call(client.getAccruedInterests)(request)
    }

    func getFuturesMargin(request: GetFuturesMarginRequest) -> AnyPublisher<GetFuturesMarginResponse, RPCError> {
        return executor.call(client.getFuturesMargin)(request)
    }

    func getInstrumentBy(params: InstrumentParameters) -> AnyPublisher<InstrumentResponse, RPCError> {
        return executor.call(client.getInstrumentBy(_:callOptions:))(params.toInstrumentRequest)
    }

    func getDividends(request: GetDividendsRequest) -> AnyPublisher<GetDividendsResponse, RPCError> {
        return executor.call(client.getDividends(_:callOptions:))(request)
    }

    // MARK: - Bonds

    func getBond(params: InstrumentParameters) -> AnyPublisher<BondResponse, RPCError> {
        return executor.call(client.bondBy)(params.toInstrumentRequest)
    }

    func getBonds(with status: InstrumentStatus) -> AnyPublisher<BondsResponse, RPCError> {
        var request = InstrumentsRequest()
        request.instrumentStatus = status
        return executor.call(client.bonds)(request)
    }

    // MARK: - Currencies

    func getCurrency(params: InstrumentParameters) -> AnyPublisher<CurrencyResponse, RPCError> {
        return executor.call(client.currencyBy)(params.toInstrumentRequest)
    }

    func getCurrencies(with status: InstrumentStatus) -> AnyPublisher<CurrenciesResponse, RPCError> {
        var request = InstrumentsRequest()
        request.instrumentStatus = status
        return executor.call(client.currencies)(request)
    }

    // MARK: - Etfs

    func getEtf(params: InstrumentParameters) -> AnyPublisher<EtfResponse, RPCError> {
        return executor.call(client.etfBy)(params.toInstrumentRequest)
    }

    func getEtfs(with status: InstrumentStatus) -> AnyPublisher<EtfsResponse, RPCError> {
        var request = InstrumentsRequest()
        request.instrumentStatus = status
        return executor.call(client.etfs)(request)
    }

    // MARK: - Futures

    func getFuture(params: InstrumentParameters) -> AnyPublisher<FutureResponse, RPCError> {
        return executor.call(client.futureBy)(params.toInstrumentRequest)
    }

    func getFutures(with status: InstrumentStatus) -> AnyPublisher<FuturesResponse, RPCError> {
        var request = InstrumentsRequest()
        request.instrumentStatus = status
        return executor.call(client.futures)(request)
    }

    // MARK: - Shares

    func getShare(params: InstrumentParameters) -> AnyPublisher<ShareResponse, RPCError> {
        return executor.call(client.shareBy)(params.toInstrumentRequest)
    }

    func getShares(with status: InstrumentStatus) -> AnyPublisher<SharesResponse, RPCError> {
        var request = InstrumentsRequest()
        request.instrumentStatus = status
        return executor.call(client.shares)(request)
    }
}
