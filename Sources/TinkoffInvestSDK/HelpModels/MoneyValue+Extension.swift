//
//  MoneyValue+Extension.swift
//  TinkoffInvestSwiftSDK
//
//  Created by m.monakov on 18.01.2022.
//

import Foundation

public typealias MoneyValue = Tinkoff_Public_Invest_Api_Contract_V1_MoneyValue
public typealias Quotation = Tinkoff_Public_Invest_Api_Contract_V1_Quotation

public extension MoneyValue {
    var asMoneyAmount: MoneyAmount {
        let value = Decimal(units) + Decimal(sign: nano.signum() == -1 ? .minus : .plus , exponent: -9, significand: Decimal(nano))
        guard let currency = MoneyCurrency(rawValue: currency) else {
            assertionFailure("Did not recognize currency \(currency)")
            return .init(currency: .rub, value: value)
        }
        return .init(currency: currency, value: value)
    }
    
    var asQuotation: Quotation {
        var quotation = Quotation()
        quotation.units = units
        quotation.nano = nano
        return quotation
    }
    
    var asAmount: Decimal {
        let value = Decimal(units) + Decimal(sign: nano.signum() == -1 ? .minus : .plus , exponent: -9, significand: Decimal(nano))
        return value
    }
}

public extension Decimal {

    func rounded(_ roundingMode: NSDecimalNumber.RoundingMode = .bankers) -> Decimal {
        var result = Decimal()
        var number = self
        NSDecimalRound(&result, &number, 0, roundingMode)
        return result
    }
    var whole: Decimal { self < 0 ? rounded(.up) : rounded(.down) }
    var fraction: Decimal { self - whole }

    var asQuotation: Quotation {
        var model = Quotation()
        model.units = (self as NSDecimalNumber).int64Value
        model.nano = (self.fraction * 1_000_000_000 as NSDecimalNumber).int32Value
        return model
    }
}

public extension Quotation {
    var asAmount: Decimal {
        let value = Decimal(units) + Decimal(sign: nano.signum() == -1 ? .minus : .plus , exponent: -9, significand: Decimal(nano))
        return value
    }
}
