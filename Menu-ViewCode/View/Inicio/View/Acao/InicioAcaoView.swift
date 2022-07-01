//
//  InicioAcaoView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class InicioAcaoView: BaseView {
    
    private struct Matrics {
        static let space: CGFloat = 25.0
        static let heightAcaoView: CGFloat = 40
        static let heightLine: CGFloat = 0.4
    }
    
    private lazy var labelAcao: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AÇÕES"
        label.textColor = CustomColor.Main
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .bold)
        return label
    }()
   
    private lazy var viewAcaoTransf: AcaoItemView = {
        let view = AcaoItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var lineViewTransf: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.Main
        return view
    }()
    
    private lazy var viewAcaoPay: AcaoItemView = {
        let view = AcaoItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var lineViewPay: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = CustomColor.Main
        return view
    }()
    
    override func addElemented() {
        addSubview(self.labelAcao)
        addSubview(self.viewAcaoTransf)
        addSubview(self.lineViewTransf)
        addSubview(self.viewAcaoPay)
        addSubview(self.lineViewPay)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.labelAcao.pin
            .top(to: self.edge.top)
            .left(to: self.edge.left)
            .right(to: self.edge.right)
        
        self.viewAcaoTransf.pin
            .top(to: self.labelAcao.edge.bottom).marginTop(Matrics.space)
            .left(to: self.edge.left)
            .right(to: self.edge.right)
            .height(Matrics.heightAcaoView)
        
        self.lineViewTransf.pin
            .left(to: self.edge.left)
            .top(to: self.viewAcaoTransf.edge.bottom).marginTop(Matrics.space / 2)
            .right(to: self.edge.right)
            .height(Matrics.heightLine)
        
        self.viewAcaoPay.pin
            .top(to: self.lineViewTransf.edge.bottom).marginTop(Matrics.space / 2)
            .left(to: self.edge.left)
            .right(to: self.edge.right)
            .height(Matrics.heightAcaoView)
        
        self.lineViewPay.pin
            .left(to: self.edge.left)
            .top(to: self.viewAcaoPay.edge.bottom).marginTop(Matrics.space / 2)
            .right(to: self.edge.right)
            .height(Matrics.heightLine)
    }
    
    override func setupConstraint() {
//        NSLayoutConstraint.activate([
//
//            self.labelAcao.topAnchor.constraint(equalTo: self.topAnchor),
//            self.labelAcao.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.labelAcao.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//
//            self.viewAcaoTransf.topAnchor.constraint(equalTo: self.labelAcao.bottomAnchor, constant: Matrics.space ),
//            self.viewAcaoTransf.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.viewAcaoTransf.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.viewAcaoTransf.heightAnchor.constraint(equalToConstant: Matrics.heightAcaoView),
//
//            self.lineViewTransf.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.lineViewTransf.topAnchor.constraint(equalTo: self.viewAcaoTransf.bottomAnchor, constant: Matrics.space / 2),
//            self.lineViewTransf.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.lineViewTransf.heightAnchor.constraint(equalToConstant: Matrics.heightLine),
//
//            self.viewAcaoPay.topAnchor.constraint(equalTo: self.lineViewTransf.bottomAnchor, constant: Matrics.space / 2),
//            self.viewAcaoPay.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.viewAcaoPay.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.viewAcaoPay.heightAnchor.constraint(equalToConstant: Matrics.heightAcaoView),
//
//            self.lineViewPay.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.lineViewPay.topAnchor.constraint(equalTo: self.viewAcaoPay.bottomAnchor, constant: Matrics.space / 2),
//            self.lineViewPay.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            self.lineViewPay.heightAnchor.constraint(equalToConstant: Matrics.heightLine),
//        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewAcaoTransf.setup(imageName: "arrow.up.arrow.down.circle", description: "Transferir saldo entre benefícios")
        self.viewAcaoPay.setup(imageName: "dollarsign.circle", description: "Pagamentos")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
