//
//  TransacaoItemView.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 27/06/22.
//

import UIKit

class TransacaoItemView: BaseView {

    private struct Matrics {
        static let space: CGFloat = 10.0
        static let heightBoxView: CGFloat = 40
        static let heightImage: CGFloat = 25
        static let sizeFontLabel: CGFloat = CustomFont.SizeDefault + 3
    }
    
    private lazy var boxView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "alarm")
        image.tintColor = CustomColor.Main
        return image
    }()
    
    private lazy var stackStoreValue: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var labelStore: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Matrics.sizeFontLabel, weight: .bold)
        label.text = "Restaurante da Doninha da silva coleta mais uma linha"
        label.lineBreakMode = .byTruncatingTail
        label.textColor = CustomColor.Main
        return label
    }()
    
    private lazy var labelValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: Matrics.sizeFontLabel, weight: .bold)
        label.text = "R$ 33,25"
        label.textColor = CustomColor.Main
        return label
    }()
    
    private lazy var labelDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: CustomFont.SizeDefault - 3, weight: .regular)
        label.text = "25/06/2022 - 11:41"
        label.textColor = CustomColor.Main
        return label
    }()
    
    override func addElemented() {
        addSubview(self.boxView)
        self.boxView.addSubview(self.imageView)
        self.stackStoreValue.addArrangedSubview(self.labelStore)
        self.stackStoreValue.addArrangedSubview(self.labelValue)
        self.boxView.addSubview(self.stackStoreValue)
        self.boxView.addSubview(self.labelDate)
    }
    
    override func setupConstraint() {
        NSLayoutConstraint.activate([
            
            self.boxView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.boxView.topAnchor.constraint(equalTo: self.topAnchor),
            self.boxView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.boxView.heightAnchor.constraint(equalToConstant: Matrics.heightBoxView),

            self.imageView.leadingAnchor.constraint(equalTo: self.boxView.leadingAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.boxView.centerYAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: Matrics.heightImage),
            self.imageView.heightAnchor.constraint(equalToConstant: Matrics.heightImage),
            
            self.stackStoreValue.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: Matrics.space),
            self.stackStoreValue.topAnchor.constraint(equalTo: self.boxView.topAnchor),
            self.stackStoreValue.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
            
            self.labelDate.leadingAnchor.constraint(equalTo: self.stackStoreValue.leadingAnchor),
            self.labelDate.topAnchor.constraint(equalTo: self.stackStoreValue.bottomAnchor),
            self.labelDate.trailingAnchor.constraint(equalTo: self.boxView.trailingAnchor),
            
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(_ model: TransacaoModel) {
        self.imageView.image = UIImage(systemName: "\(model.imageName)")
        self.labelStore.text = model.store
        self.labelValue.text = formattedValue(model.value)
        self.labelDate.text = formattedDate(model.data)
    }
}
