//
//  ViewController.swift
//  MRArticleViewController
//
//  Created by Matthew Rigdon on 08/16/2016.
//  Copyright (c) 2016 Matthew Rigdon. All rights reserved.
//

import UIKit
import MRArticleViewController

class MRArticleViewController: ArticleViewController {

    let bodyText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et magna elit. Curabitur eleifend orci quis ligula elementum ullamcorper a sit amet diam. Donec facilisis odio lectus, id viverra massa fermentum non. Mauris efficitur orci nec sem hendrerit hendrerit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi commodo quis nunc egestas porttitor. Fusce facilisis leo sed ipsum pulvinar suscipit. Etiam in orci lacinia, facilisis turpis quis, tincidunt quam. \n\nEtiam nec sollicitudin est. Aliquam convallis dui eget interdum vehicula. Fusce tristique nec ex id euismod. Proin pretium sem ante, vitae ultrices diam finibus ac. Ut lacinia scelerisque sagittis. Ut placerat risus magna, et fermentum nunc malesuada in. Nulla vitae massa facilisis, iaculis sapien commodo, lacinia justo. \n\nVestibulum id tristique enim. Etiam in augue nec ex euismod ullamcorper. Nam tincidunt ultricies ligula nec finibus. Aenean luctus est in ultricies tempus. Vivamus hendrerit posuere lacinia. Morbi rutrum ultrices pretium. Maecenas eleifend gravida augue. Vestibulum pellentesque ligula non molestie interdum.\n\nMorbi semper felis eget luctus feugiat. Praesent neque ligula, pharetra non tincidunt ut, egestas eget turpis. Nullam sagittis nisi vehicula quam efficitur accumsan. Quisque ac arcu tellus. Sed id dignissim est. Nullam eget est ut orci euismod dictum rutrum sed ipsum. Sed ultricies, purus eu fringilla rutrum, lacus justo tincidunt sem, eget mollis libero nisi sed elit.\n\nSed imperdiet nec est quis porttitor. Sed mollis arcu vitae faucibus mollis. Maecenas mauris nisl, porta eget diam non, pharetra condimentum augue. Duis ac ipsum at nibh placerat aliquam ac vitae est. Praesent porta congue rhoncus. Phasellus finibus accumsan gravida. Nam tristique rhoncus interdum. Pellentesque ac tempor magna, iaculis auctor urna. Nunc luctus tortor vitae mauris consequat convallis. Phasellus sed ex nec neque imperdiet consectetur. Donec ultricies tortor ut magna dictum, et ultrices urna tristique."
    
    override func viewDidLoad() {
        imageView.image = UIImage(named: "inception")!
        let someVar :String? = UserDefaults.standard.string(forKey: "yourIdentifier")
        headline = someVar!
        date = NSDate() as Date
        //   body = bodyText
        autoColored = true
        
        print("********** esm el cour ******************")
        print(someVar)
        print("**********   ******************")
        
        
        switch someVar! {
        case "LE PERMIS DE CONDUIRE":
            imageView.image = UIImage(named: "cour1")!
            author = "Epreuves théoriques générales  et Epreuve pratique"
            
            body = "Epreuves théoriques générales :On l'appelle communément épreuve du code de la route.Elle se présente sous la forme de 40 questions à choix multiple. Le candidat doit obtenir au moins 35 bonnes réponses pour être admis à cette épreuve. Elle est indispensable pour passer à l'épreuve pratique. Ce code est valable trois ans, durée pendant laquelle l'élève devra avoir obtenu son permis de conduire.Epreuve pratique:La durée de l'examen est de 35 minutes avec 25 minutes de conduite effective, de manoeuvres et des questions concernant le véhicule et la sécurité routière. L'inspecteur va évaluer les capacités du candidat sur différents réseaux routiers.A l'issue de l'épreuve, en cas de réussite, un certificat provisoire valable deux mois est délivré aux candidats. Ce certificat tient lieu de permis en attendant que la préfecture réalise le document original.La durée de la formation pratique est de 20h minimum. C'est l'enseignant de la conduite qui lors de l'évaluation initiale de départ définira le nombre d'heures nécessaires en fonction des attitudes du candidat. Celle-ci est variable selon les qualités de l'élève.Un livret d'apprentissage est remis à chaque élève. Ce document justifie que la personne est en phase d'apprentissage du permis, dans une auto-école. Ce livret permet à l'élève d'évaluer sa progression"
        case "LA SIGNALISATION" :
            imageView.image = UIImage(named: "cour3")!
            author = "Epreuves théoriques générales  et Epreuve pratique"
            body = "\n SIGNALISATION HORIZONTALE : \n La signalisation routière horizontale regroupe tous les différents marquages au sol.\n PANNEAUX DE DANGER:\n Les panneaux de danger ont la forme de triangles équilatéraux blanc entourés par une bande rouge.\n SIGNAUX D’INTERSECTION ET DE PRIORITÉ: \n Ils peuvent avoir la forme de triangle, de losange ou d'octogone \n PANNEAUX DE PRESCRIPTION: \n Les panneaux de prescription portent à la connaissance des usagers les interdictions et obligations particulières résultant de mesures réglementaires \n SIGNAUX D'INDICATION: \n L'objet de la signalisation d'indication est de porter à la connaissance des usagers de la route des informations utiles à la conduite des véhicules. \n SIGNAUX DE DIRECTION: \n Les signaux de direction sont soit réctangulaire, soit ont la forme d’un rectangle allongé à grand côté horizontal et se terminant pas une pointe  \n PANNEAUX D'INFORMATION: \n Les panneaux routiers d'informations informent les usagers de la route sur un lieu ou un itinéraire à caractère touristique  \n IDÉOGRAMMES, EMBLÈMES ET LOGOTYPES : \n Les Idéogrammes, emblèmes et logotypes sont des représentation symbolique qui peuvent accompagner des indications de direction ou de localisation. \n SYMBOLES: \n Les symboles sont des pictogrammes associés ou non à des mentions .  \n BALISES : \n Les balises sont des dispositifs implantés pour guider les usagers ou leur signaler un risque particulier sur un itinéraire traité de façon homogène  \n PANONCEAUX:  \n Les panonceaux sont destinés à donner aux usagers des indications complémentaires à celles du panneau qu’ils complètent  \n FEUX ET SIGNAUX LUMINEUX : \n Un feu ou signal lumineux est un dispositif lumineux destiné à régler la circulation \n  PANNEAUX ET DISPOSITIFS DE SIGNALISATION TEMPORAIRE\n a signalisation temporaire sert à avertir et guider l'usager d'un obstacle ou d'un danger temporaire  \n FEUX DE BALISAGE ET D'ALERTE \n Les feux de balisage et d’alerte sont des feux circulaire jaune. Ils sont utilisés pour renforcer la perception de signaux ou pour la signalisation \n  SIGNAUX VARIABLES : \n Les panneaux à messages variables sont des panneaux de signalisation routière conçus pour alerter ou informer l'usager de la route  \n MARQUES SUR CHAUSSÉES  \n es marques sur chaussées ont pour but d'indiquer sans ambiguïté les parties de la chaussée réservées aux différents sens de la circulation  \n PANNEAUX DE JALONNEMENT PIÉTONNIER  \n  Les panneaux de jalonnement piétonnier jalonnent vers soit un poste d'appel d'urgence soit une issue de secours  \n PANNEAUX DE JALONNEMENT DES AMÉNAGEMENTS CYCLABLES \n Les panneaux de jalonnement d'un aménagement cyclable donnent aux usagers cyclistes les informations utiles leur permettant de repérer l'itinéraire"
            
        case "LE VEHICULE" :
            imageView.image = UIImage(named: "cour2")!
            author = "Epreuves théoriques générales  et Epreuve pratique"
            body = "Les feux destinés aux véhicules sont généralement tricolores, auxquels peuvent s'ajouter des flèches directionnelles. Les feux pour piétons sont bicolores et se distinguent souvent par la reproduction d'une silhouette de piéton..."
            

        case "LES FEUX":
            imageView.image = UIImage(named: "cour6")!
            author = "Epreuves théoriques générales  et Epreuve pratique"
            body = "Les feux destinés aux véhicules sont généralement tricolores, auxquels peuvent s'ajouter des flèches directionnelles. Les feux pour piétons sont bicolores et se distinguent souvent par la reproduction d'une silhouette de piéton..."
            
            
        case "CROISEMENT ET DÉPASSEMENT":
            imageView.image = UIImage(named: "cour7")!
            author = "Epreuves théoriques générales  et Epreuve pratique"
            body = "Les lieux et la taille des véhicules peuvent rendre les croisements et les dépassements difficiles. Pour les faire en toute sécurité, il faut connaître les règles du code de la route."
        case "LES RÈGLES DE PRIORITÉS":
            imageView.image = UIImage(named: "cour4")!
            author = "Epreuves théoriques générales  et Epreuve pratique"
            body = "Il existe sur le réseau routier français cinq régimes de priorité : la priorité à droite, le stop, le Cédez-le-passage, la priorité ponctuelle et le caractère prioritaire d'une voie."
            
            
            
        default:
            body = "Type is something else"
        }
        
        
        
        
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

