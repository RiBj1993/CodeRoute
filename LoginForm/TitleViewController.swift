//
//  TitleController.swift
//  LoginForm
//
//  Created by SwiftR on 10/04/2017.
//  Copyright © 2017 vishalsonawane. All rights reserved.
//
import UIKit
import MIBlurPopup

class TitleViewController: UIViewController {

    @IBOutlet weak var PP: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("pppppppppppppppppppppppppppppppppppp")

        
        let someVar    = UserDefaults.standard.string(forKey: "yourIdentifier")
        PP.text=someVar
        
        
        
        switch someVar! {
        case "LE PERMIS DE CONDUIRE":
            PP.text = "Le permis de conduire est un droit administratif de circuler donnant l'autorisation de conduire certains véhicules dans un pays donné. Il est obligatoire de le posséder pour conduire. Il existe différents types de permis en fonction des catégories de véhicule."
        case "LE VEHICULE" :
            PP.text =   "Un véhicule est un engin mobile, qui permet de déplacer des personnes ou des charges d'un point à un autre. Il est indispensable de connaître toutes les commandes pour conduire."
        
        case "LES FEUX":
                PP.text = "Les feux destinés aux véhicules sont généralement tricolores, auxquels peuvent s'ajouter des flèches directionnelles. Les feux pour piétons sont bicolores et se distinguent souvent par la reproduction d'une silhouette de piéton..."
            
        case "LA SIGNALISATION" :
            PP.text = "La signalisation routière française du code de la route est classifiée en deux catégories : la signalisation dite «horizontale» qui se caractérise par des marquages au sol et la signalisation «verticale» qui est celle des panneaux."
            
        case "CROISEMENT ET DÉPASSEMENT":
            PP.text = "Les lieux et la taille des véhicules peuvent rendre les croisements et les dépassements difficiles. Pour les faire en toute sécurité, il faut connaître les règles du code de la route."
        case "LES RÈGLES DE PRIORITÉS":
            PP.text = "Il existe sur le réseau routier français cinq régimes de priorité : la priorité à droite, le stop, le Cédez-le-passage, la priorité ponctuelle et le caractère prioritaire d'une voie."
        default:
            PP.text = "Type is something else"
        }


        print("pppppppppppppppppppppppppppppppppppp")
        print("pppppppppppppppppppppppppppppppppppp")
        
        print(someVar)
        
        
        
        
        
    }
    

}
