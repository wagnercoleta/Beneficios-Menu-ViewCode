//
//  InicioScreen.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class InicioScreen: BaseView {

    private struct Metrics {
        static let space: CGFloat = 10.0
    }
    
    private lazy var headerView: InicioHeaderView = {
        let view = InicioHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var beneficioView: InicioBeneficioView = {
        let view = InicioBeneficioView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var acaoView: InicioAcaoView = {
        let view = InicioAcaoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var transacaoView: InicioTransacaoView = {
        let view = InicioTransacaoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .lightGray
        return view
    }()

    override func addElemented() {
        self.addSubview(self.headerView)
        self.addSubview(self.beneficioView)
        self.addSubview(self.acaoView)
        self.addSubview(self.transacaoView)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: MatricsGlobal.margin),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: MatricsGlobal.margin),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -MatricsGlobal.margin),
            self.headerView.heightAnchor.constraint(equalToConstant: 50),
            
            self.beneficioView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: Metrics.space * 2),
            self.beneficioView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
            self.beneficioView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.beneficioView.heightAnchor.constraint(equalToConstant: 275),
            
            self.acaoView.topAnchor.constraint(equalTo: self.beneficioView.bottomAnchor, constant: Metrics.space * 2),
            self.acaoView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
            self.acaoView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor),
            self.acaoView.heightAnchor.constraint(equalToConstant: 160),
            
            self.transacaoView.topAnchor.constraint(equalTo: self.acaoView.bottomAnchor, constant: Metrics.space * 2),
            self.transacaoView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
            self.transacaoView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor),
            self.transacaoView.heightAnchor.constraint(equalToConstant: 190)
        ])
    }
}
