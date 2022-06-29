//
//  PerfilScreen.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 28/06/22.
//

import UIKit

class PerfilScreen: BaseView {
    
    private struct Matrics {
        static let heightHeader: CGFloat = 190.0
        static let space: CGFloat = 30.0
        static let heightCollectionView: CGFloat = 450.0
    }
    
    private var menus: [MenuModel] = [
        MenuModel(imageName: "person", description: "Conta"),
        MenuModel(imageName: "bell", description: "Notificações"),
        MenuModel(imageName: "wrench", description: "Configurações"),
        MenuModel(imageName: "lock.shield", description: "Segurança"),
        MenuModel(imageName: "hand.thumbsup", description: "Indique nosso app"),
        MenuModel(imageName: "faceid", description: "Face ID"),
        MenuModel(imageName: "message", description: "Fale com o suporte"),
        MenuModel(imageName: "square.and.arrow.down", description: "Sair"),
    ]
    
    private lazy var headerView: PerfilHeaderView = {
        let view = PerfilHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionView:UICollectionView = {
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .none
        cv.delaysContentTouches = false
        cv.register(PerfilMenuCollectionViewCell.self, forCellWithReuseIdentifier: PerfilMenuCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    override func addElemented() {
        self.addSubview(self.headerView)
        self.addSubview(self.collectionView)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.headerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: Matrics.heightHeader),
            
            self.collectionView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: Matrics.space),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Matrics.space),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Matrics.space),
            self.collectionView.heightAnchor.constraint(equalToConstant: Matrics.heightCollectionView),
            
        ])
    }
}

extension PerfilScreen: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PerfilMenuCollectionViewCell.identifier, for: indexPath) as? PerfilMenuCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        let menu = self.menus[indexPath.row]
        cell.setup(menu)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 29)
    }
}
