//
//  InicioTransacaoView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class InicioTransacaoView: BaseView {

    private struct Matrics {
        static let space: CGFloat = 25.0
        static let heightCollectionView: CGFloat = 200
    }
    
    private var transacoes: [TransacaoModel] = [
        TransacaoModel(imageName: BeneficioImageEnum.Refeicao.imageName, store: "Restaurante da esquina", value: 19.90, data: getDate(hour: 24)),
        TransacaoModel(imageName: BeneficioImageEnum.Refeicao.imageName, store: "Pizza contagem", value: 89.99, data: getDate(hour: 26)),
        TransacaoModel(imageName: BeneficioImageEnum.Alimentacao.imageName, store: "Supermercado da esquina", value: 375.43, data: getDate(hour: 48)),
        TransacaoModel(imageName: BeneficioImageEnum.Combustivel.imageName, store: "Posto da esquina", value: 200.00, data: getDate(hour: 55)),
        TransacaoModel(imageName: BeneficioImageEnum.Construcao.imageName, store: "Deposito nossa construção", value: 120.50, data: getDate(hour: 74)),
        TransacaoModel(imageName: BeneficioImageEnum.Refeicao.imageName, store: "Restaurante da esquina", value: 25.70, data: getDate(hour: 124)),
    ]
    
    private lazy var labelTransacao: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ÚLTIMAS TRANSAÇÕES"
        label.textColor = CustomColor.Main
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .bold)
        return label
    }()

    private lazy var collectionView:UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .none
        cv.delaysContentTouches = false
        cv.register(TransacaoCollectionViewCell.self, forCellWithReuseIdentifier: TransacaoCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func addElemented() {
        addSubview(self.labelTransacao)
        addSubview(self.collectionView)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.labelTransacao.topAnchor.constraint(equalTo: self.topAnchor),
            self.labelTransacao.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.labelTransacao.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.collectionView.topAnchor.constraint(equalTo: self.labelTransacao.bottomAnchor, constant: Matrics.space),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: Matrics.heightCollectionView),
            
        ])
    }
}

extension InicioTransacaoView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.transacoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransacaoCollectionViewCell.identifier, for: indexPath) as? TransacaoCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        let model = self.transacoes[indexPath.row]
        cell.setup(model)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 45)
    }
}
