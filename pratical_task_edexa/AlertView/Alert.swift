//
//  Alert.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 25/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import Foundation
import UIKit


func showAlert(_ alertMesage : String , controller : UIViewController ){
    let alert = UIAlertController(title: "Alert", message: alertMesage, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            print("Closed Alert")
        }))
    controller.present(alert, animated: true, completion: nil)
}
