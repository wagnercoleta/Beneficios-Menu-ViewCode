//
//  InicioBeneficioView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class InicioBeneficioView: BaseView {

    private struct Matrics {
        
        static let space: CGFloat = 10.0
    }
    
    private var beneficios: [BeneficioModel] = [
        BeneficioModel(imageName: BeneficioImageEnum.Refeicao.text, value: 500, description: "REFEIÇÃO", backgroudColor: .systemRed),
        BeneficioModel(imageName: BeneficioImageEnum.Alimentacao.text, value: 1200, description: "ALIMENTAÇÃO", backgroudColor: .systemGreen),
        BeneficioModel(imageName: BeneficioImageEnum.HomeOffice.text, value: 100.40, description: "HOME-OFFICE", backgroudColor: .systemBlue),
        BeneficioModel(imageName: BeneficioImageEnum.Construcao.text, value: 300, description: "CONSTRUÇÃO", backgroudColor: .systemPurple),
        BeneficioModel(imageName: BeneficioImageEnum.Credito.text, value: 0, description: "CRÉDITO", backgroudColor: .systemTeal),
        BeneficioModel(imageName: BeneficioImageEnum.Combustivel.text, value: 0, description: "COMBUSTÍVEL", backgroudColor: .systemYellow),
        BeneficioModel(imageName: BeneficioImageEnum.Viagem.text, value: 0, description: "VIAGEM", backgroudColor: .systemIndigo),
        BeneficioModel(imageName: BeneficioImageEnum.Curso.text, value: 0, description: "CURSO", backgroudColor: .systemGray)
    ]
    
    private lazy var labelBeneficio: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BENEFÍCIOS"
        label.numberOfLines = 1
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
        cv.register(BeneficioCollectionViewCell.self, forCellWithReuseIdentifier: BeneficioCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    private lazy var stackTotal: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var labelTotal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .regular)
        label.text = "Total em benefícios"
        label.textColor = CustomColor.Main
        return label
    }()
    
    private lazy var labelSoma: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault, weight: .bold)
        label.text = "R$ 2.500,00"
        label.textColor = CustomColor.Main
        return label
    }()
    
    override func addElemented() {
        addSubview(self.labelBeneficio)
        addSubview(self.collectionView)
        self.stackTotal.addArrangedSubview(self.labelTotal)
        self.stackTotal.addArrangedSubview(self.labelSoma)
        addSubview(self.stackTotal)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.labelBeneficio.topAnchor.constraint(equalTo: self.topAnchor),
            self.labelBeneficio.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.labelBeneficio.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.labelBeneficio.heightAnchor.constraint(equalToConstant: MatricsGlobal.labelHeight),
            
            self.collectionView.topAnchor.constraint(equalTo: self.labelBeneficio.bottomAnchor, constant: Matrics.space),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: 203),
            
            self.stackTotal.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: Matrics.space),
            self.stackTotal.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackTotal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -MatricsGlobal.margin),
            self.stackTotal.heightAnchor.constraint(equalToConstant: MatricsGlobal.labelHeight)
        ])
    }
    
    private func getTotalBeneficios() -> Decimal {
        var result: Decimal = 0
        beneficios.forEach { beneficioItem in
            result += beneficioItem.value
        }
        return result
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.labelSoma.text = formattedValue(self.getTotalBeneficios())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InicioBeneficioView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beneficios.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeneficioCollectionViewCell.identifier, for: indexPath) as? BeneficioCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        let beneficio = self.beneficios[indexPath.row]
        cell.setup(beneficio)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: collectionView.frame.height)
    }
}
