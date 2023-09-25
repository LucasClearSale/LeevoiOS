//
//  ViewController.swift
//  LeevoiOS
//
//  Created by lucas.carvalho on 25/09/23.
//

import UIKit
import CSLivenessSDK

class ViewController: UIViewController {

    private let sdk = CSLiveness(configurations: CSLivenessConfigurations(
        clientId: "",
        clientSecret: "",
        identifierId: "",
        cpf: "")
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sdk.delegate = self
    }

    @IBAction func didTapButton(_ sender: Any) {
        DeviceOrientation.shared.set(orientation: .portrait)
        sdk.start(viewController: self, animated: true)
    }
}

// MARK: Extensions
extension ViewController: CSLivenessDelegate {
    func liveness(didOpen: Bool) {
        print("LeevoiOS - SDK Open " + didOpen.description)
    }
    
    func liveness(success: CSLivenessResult) {
        print("LeevoiOS - SDK Success " + success.description)
    }
    
    func liveness(error: CSLivenessError) {
        print("LeevoiOS - SDK Error " + error.rawValue)
    }
}
