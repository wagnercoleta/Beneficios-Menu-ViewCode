//
//  Constants.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 24/06/22.
//

import UIKit

struct CustomColor {
    static let Main = UIColor(named: "main")
    static let Second = UIColor(named: "second")
}

struct CustomFont {
    static let SizeDefault: CGFloat = 15.0
}

struct MatricsGlobal {
    static let margin: CGFloat = 30.0
    static let labelHeight: CGFloat = 25.0
}

enum BeneficioImageEnum: String {
    case Refeicao
    case Alimentacao
    case HomeOffice
    case Construcao
    case Credito
    case Combustivel
    case Viagem
    case Curso
    
    var imageName: String {
        switch self {
            case .Refeicao:
                return "smiley"
            case .Alimentacao:
                return "cart"
            case .HomeOffice:
                return "desktopcomputer"
            case .Construcao:
                return "hammer"
            case .Credito:
                return "creditcard"
            case .Combustivel:
                return "car"
            case .Viagem:
                return "airplane"
            case .Curso:
                return "studentdesk"
        }
    }
}
