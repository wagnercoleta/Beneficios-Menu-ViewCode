//
//  InicioScreen.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class InicioScreen: UIView {

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

    private func addElemented() {
        self.addSubview(self.headerView)
        self.addSubview(self.beneficioView)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.headerView.topAnchor.constraint(equalTo: self.topAnchor, constant: MetricsGlobal.margin),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: MetricsGlobal.margin),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -MetricsGlobal.margin),
            self.headerView.heightAnchor.constraint(equalToConstant: 50),
            
            self.beneficioView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: Metrics.space * 2),
            self.beneficioView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
            self.beneficioView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.beneficioView.heightAnchor.constraint(equalToConstant: 300),
            
            
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .white
        self.addElemented()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
