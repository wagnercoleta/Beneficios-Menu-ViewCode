//
//  PerfilViewController.swift
//  Menu-ViewCode
//
//  Created by Wagner Coleta on 23/06/22.
//

import UIKit

class PerfilViewController: BaseViewController {

    private var screen: PerfilScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.screen = PerfilScreen()
        self.view = self.screen
    }
}
