//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: stoporders.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Сервис предназначен для работы со стоп-заявками:</br> **1**.
///выставление;</br> **2**. отмена;</br> **3**. получение списка стоп-заявок.
///
/// Usage: instantiate `Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClient`, then call methods of this protocol to make API calls.
internal protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol: GRPCClient {
    var serviceName: String { get }
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? { get }
    
    func postStopOrder(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
        callOptions: CallOptions?
    ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>
    
    func getStopOrders(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
        callOptions: CallOptions?
    ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>
    
    func cancelStopOrder(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
        callOptions: CallOptions?
    ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>
}

extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol {
    internal var serviceName: String {
        return "tinkoff.public.invest.api.contract.v1.StopOrdersService"
    }
    
    ///Метод выставления стоп-заявки.
    ///
    /// - Parameters:
    ///   - request: Request to send to PostStopOrder.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    internal func postStopOrder(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse> {
        return self.makeUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? []
        )
    }
    
    ///Метод получения списка активных стоп заявок по счёту.
    ///
    /// - Parameters:
    ///   - request: Request to send to GetStopOrders.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    internal func getStopOrders(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse> {
        return self.makeUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? []
        )
    }
    
    ///Метод отмены стоп-заявки.
    ///
    /// - Parameters:
    ///   - request: Request to send to CancelStopOrder.
    ///   - callOptions: Call options.
    /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
    internal func cancelStopOrder(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
        callOptions: CallOptions? = nil
    ) -> UnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse> {
        return self.makeUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? []
        )
    }
}

#if compiler(>=5.6)
@available(*, deprecated)
extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClient: @unchecked Sendable {}
#endif // compiler(>=5.6)

@available(*, deprecated, renamed: "Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceNIOClient")
internal final class Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClient: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol {
    private let lock = Lock()
    private var _defaultCallOptions: CallOptions
    private var _interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol?
    internal let channel: GRPCChannel
    internal var defaultCallOptions: CallOptions {
        get { self.lock.withLock { return self._defaultCallOptions } }
        set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
    }
    internal var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? {
        get { self.lock.withLock { return self._interceptors } }
        set { self.lock.withLockVoid { self._interceptors = newValue } }
    }
    
    /// Creates a client for the tinkoff.public.invest.api.contract.v1.StopOrdersService service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    internal init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self._defaultCallOptions = defaultCallOptions
        self._interceptors = interceptors
    }
}

public struct Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceNIOClient: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientProtocol {
    public var channel: GRPCChannel
    public var defaultCallOptions: CallOptions
    public var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol?
    
    /// Creates a client for the tinkoff.public.invest.api.contract.v1.StopOrdersService service.
    ///
    /// - Parameters:
    ///   - channel: `GRPCChannel` to the service host.
    ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
    ///   - interceptors: A factory providing interceptors for each RPC.
    internal init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

#if compiler(>=5.6)
/// Сервис предназначен для работы со стоп-заявками:</br> **1**.
///выставление;</br> **2**. отмена;</br> **3**. получение списка стоп-заявок.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol: GRPCClient {
    static var serviceDescriptor: GRPCServiceDescriptor { get }
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? { get }
    
    func makePostStopOrderCall(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>
    
    func makeGetStopOrdersCall(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>
    
    func makeCancelStopOrderCall(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
        callOptions: CallOptions?
    ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol {
    internal static var serviceDescriptor: GRPCServiceDescriptor {
        return Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.serviceDescriptor
    }
    
    internal var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? {
        return nil
    }
    
    internal func makePostStopOrderCall(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse> {
        return self.makeAsyncUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? []
        )
    }
    
    internal func makeGetStopOrdersCall(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse> {
        return self.makeAsyncUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? []
        )
    }
    
    internal func makeCancelStopOrderCall(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
        callOptions: CallOptions? = nil
    ) -> GRPCAsyncUnaryCall<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse> {
        return self.makeAsyncUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol {
    internal func postStopOrder(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
        callOptions: CallOptions? = nil
    ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse {
        return try await self.performAsyncUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? []
        )
    }
    
    internal func getStopOrders(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
        callOptions: CallOptions? = nil
    ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse {
        return try await self.performAsyncUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? []
        )
    }
    
    internal func cancelStopOrder(
        _ request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
        callOptions: CallOptions? = nil
    ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse {
        return try await self.performAsyncUnaryCall(
            path: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder.path,
            request: request,
            callOptions: callOptions ?? self.defaultCallOptions,
            interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? []
        )
    }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClient: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncClientProtocol {
    internal var channel: GRPCChannel
    internal var defaultCallOptions: CallOptions
    internal var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol?
    
    internal init(
        channel: GRPCChannel,
        defaultCallOptions: CallOptions = CallOptions(),
        interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol? = nil
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptors = interceptors
    }
}

#endif // compiler(>=5.6)

public protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientInterceptorFactoryProtocol: GRPCSendable {
    
    /// - Returns: Interceptors to use when invoking 'postStopOrder'.
    func makePostStopOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>]
    
    /// - Returns: Interceptors to use when invoking 'getStopOrders'.
    func makeGetStopOrdersInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>]
    
    /// - Returns: Interceptors to use when invoking 'cancelStopOrder'.
    func makeCancelStopOrderInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>]
}

internal enum Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata {
    internal static let serviceDescriptor = GRPCServiceDescriptor(
        name: "StopOrdersService",
        fullName: "tinkoff.public.invest.api.contract.v1.StopOrdersService",
        methods: [
            Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.postStopOrder,
            Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.getStopOrders,
            Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceClientMetadata.Methods.cancelStopOrder,
        ]
    )
    
    internal enum Methods {
        internal static let postStopOrder = GRPCMethodDescriptor(
            name: "PostStopOrder",
            path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/PostStopOrder",
            type: GRPCCallType.unary
        )
        
        internal static let getStopOrders = GRPCMethodDescriptor(
            name: "GetStopOrders",
            path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/GetStopOrders",
            type: GRPCCallType.unary
        )
        
        internal static let cancelStopOrder = GRPCMethodDescriptor(
            name: "CancelStopOrder",
            path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/CancelStopOrder",
            type: GRPCCallType.unary
        )
    }
}

/// Сервис предназначен для работы со стоп-заявками:</br> **1**.
///выставление;</br> **2**. отмена;</br> **3**. получение списка стоп-заявок.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceProvider: CallHandlerProvider {
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerInterceptorFactoryProtocol? { get }
    
    ///Метод выставления стоп-заявки.
    func postStopOrder(request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>
    
    ///Метод получения списка активных стоп заявок по счёту.
    func getStopOrders(request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>
    
    ///Метод отмены стоп-заявки.
    func cancelStopOrder(request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>
}

extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceProvider {
    internal var serviceName: Substring {
        return Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerMetadata.serviceDescriptor.fullName[...]
    }
    
    /// Determines, calls and returns the appropriate request handler, depending on the request's method.
    /// Returns nil for methods not handled by this service.
    internal func handle(
        method name: Substring,
        context: CallHandlerContext
    ) -> GRPCServerHandlerProtocol? {
        switch name {
        case "PostStopOrder":
            return UnaryServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest>(),
                responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>(),
                interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? [],
                userFunction: self.postStopOrder(request:context:)
            )
            
        case "GetStopOrders":
            return UnaryServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest>(),
                responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>(),
                interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? [],
                userFunction: self.getStopOrders(request:context:)
            )
            
        case "CancelStopOrder":
            return UnaryServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest>(),
                responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>(),
                interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? [],
                userFunction: self.cancelStopOrder(request:context:)
            )
            
        default:
            return nil
        }
    }
}

#if compiler(>=5.6)

/// Сервис предназначен для работы со стоп-заявками:</br> **1**.
///выставление;</br> **2**. отмена;</br> **3**. получение списка стоп-заявок.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncProvider: CallHandlerProvider {
    static var serviceDescriptor: GRPCServiceDescriptor { get }
    var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerInterceptorFactoryProtocol? { get }
    
    ///Метод выставления стоп-заявки.
    @Sendable func postStopOrder(
        request: Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest,
        context: GRPCAsyncServerCallContext
    ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse
    
    ///Метод получения списка активных стоп заявок по счёту.
    @Sendable func getStopOrders(
        request: Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest,
        context: GRPCAsyncServerCallContext
    ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse
    
    ///Метод отмены стоп-заявки.
    @Sendable func cancelStopOrder(
        request: Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest,
        context: GRPCAsyncServerCallContext
    ) async throws -> Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceAsyncProvider {
    internal static var serviceDescriptor: GRPCServiceDescriptor {
        return Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerMetadata.serviceDescriptor
    }
    
    internal var serviceName: Substring {
        return Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerMetadata.serviceDescriptor.fullName[...]
    }
    
    internal var interceptors: Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerInterceptorFactoryProtocol? {
        return nil
    }
    
    internal func handle(
        method name: Substring,
        context: CallHandlerContext
    ) -> GRPCServerHandlerProtocol? {
        switch name {
        case "PostStopOrder":
            return GRPCAsyncServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest>(),
                responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>(),
                interceptors: self.interceptors?.makePostStopOrderInterceptors() ?? [],
                wrapping: self.postStopOrder(request:context:)
            )
            
        case "GetStopOrders":
            return GRPCAsyncServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest>(),
                responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>(),
                interceptors: self.interceptors?.makeGetStopOrdersInterceptors() ?? [],
                wrapping: self.getStopOrders(request:context:)
            )
            
        case "CancelStopOrder":
            return GRPCAsyncServerHandler(
                context: context,
                requestDeserializer: ProtobufDeserializer<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest>(),
                responseSerializer: ProtobufSerializer<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>(),
                interceptors: self.interceptors?.makeCancelStopOrderInterceptors() ?? [],
                wrapping: self.cancelStopOrder(request:context:)
            )
            
        default:
            return nil
        }
    }
}

#endif // compiler(>=5.6)

internal protocol Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerInterceptorFactoryProtocol {
    
    /// - Returns: Interceptors to use when handling 'postStopOrder'.
    ///   Defaults to calling `self.makeInterceptors()`.
    func makePostStopOrderInterceptors() -> [ServerInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderResponse>]
    
    /// - Returns: Interceptors to use when handling 'getStopOrders'.
    ///   Defaults to calling `self.makeInterceptors()`.
    func makeGetStopOrdersInterceptors() -> [ServerInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersResponse>]
    
    /// - Returns: Interceptors to use when handling 'cancelStopOrder'.
    ///   Defaults to calling `self.makeInterceptors()`.
    func makeCancelStopOrderInterceptors() -> [ServerInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest, Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderResponse>]
}

internal enum Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerMetadata {
    internal static let serviceDescriptor = GRPCServiceDescriptor(
        name: "StopOrdersService",
        fullName: "tinkoff.public.invest.api.contract.v1.StopOrdersService",
        methods: [
            Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerMetadata.Methods.postStopOrder,
            Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerMetadata.Methods.getStopOrders,
            Tinkoff_Public_Invest_Api_Contract_V1_StopOrdersServiceServerMetadata.Methods.cancelStopOrder,
        ]
    )
    
    internal enum Methods {
        internal static let postStopOrder = GRPCMethodDescriptor(
            name: "PostStopOrder",
            path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/PostStopOrder",
            type: GRPCCallType.unary
        )
        
        internal static let getStopOrders = GRPCMethodDescriptor(
            name: "GetStopOrders",
            path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/GetStopOrders",
            type: GRPCCallType.unary
        )
        
        internal static let cancelStopOrder = GRPCMethodDescriptor(
            name: "CancelStopOrder",
            path: "/tinkoff.public.invest.api.contract.v1.StopOrdersService/CancelStopOrder",
            type: GRPCCallType.unary
        )
    }
}
