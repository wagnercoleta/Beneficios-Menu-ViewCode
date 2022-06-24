//
//  MenuTabBarController.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class MenuTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }

    private func setupTabBar() {
        
        self.setViewControllers(
            [
                //UINavigationController(rootViewController: BaseViewController(title: "Tela 01", backgroundColor: .blue, image: UIImage(systemName: "star"))),
                InicioViewController(title: "Início", backgroundColor: .white, image: UIImage(systemName: "house")),
                PerfilViewController(title: "Perfil", backgroundColor: .red, image: UIImage(systemName: "person.fill"))
            ],
            animated: false
        )
        
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        
        guard let items = tabBar.items else { return }
        
        guard let count = self.viewControllers?.count else { return }
        for i in 0...count-1 {
            guard let vc = self.viewControllers?[i] as? BaseViewController else { return }
            items[i].title = vc.titleView
            items[i].image = vc.imageView
        }
    }
}