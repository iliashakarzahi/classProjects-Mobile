//
//  ViewController.swift
//  WarApp
//
//  Created by Ilia Shakarzahi on 2/14/18.
//  Copyright © 2018 Ilia Shakarzahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        dealCards()
        player1Count.text = String(UInt32(player1Array.count))
        player2Count.text = String(UInt32(player2Array.count))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var player1Deck = [""]
    var player1Array = [String]()
    var player1CardCount = 0
    
    @IBAction func btnEndGame(_ sender: UIButton) {
        imgCard1.image = nil
        imgCard2.image = nil
        player1Count.text = "26"
        player2Count.text = "26"
    }
    
    var player2Array = [String]()
    var player2CardCount = 0
    
    
  
    @IBAction func btnRestartGame(_ sender: UIButton) {

        if ( player1Array.count != 0 && player2Array.count != 0 ){
            let alertController = UIAlertController(title: "Game Not Over!", message: "Continue playing, or press Reset", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            present(alertController, animated: true, completion:nil)
        }
        else if ( player1Array.count == 0 || player2Array.count == 0 )
        {
dealCards()
        }
        
        
    }
    
    @IBOutlet weak var imgCard1: UIImageView!
    @IBOutlet weak var imgCard2: UIImageView!
    
    @IBAction func btnDraw(_ sender: UIButton) {
        draw()
        player1Count.text = String(UInt32(player1Array.count))
        player2Count.text = String(UInt32(player2Array.count))

        if(player1Array.count == 0)
        {
            lblPlayer1Status.text = "Loser"
            lblPlayer2Status.text = "Winner"
        }
        else if(player2Array.count == 0)
        {
            lblPlayer1Status.text = "Winner"
            lblPlayer2Status.text = "Loser"
        }

        
        else if(player1Array.count > player2Array.count)
        {
            lblPlayer1Status.text = "Winning"
            lblPlayer2Status.text = "Losing"
        }
        else if(player1Array.count < player2Array.count)
            {
                lblPlayer2Status.text = "Winning"
                lblPlayer1Status.text = "Losing"
    }
        else if(player1Array.count == player2Array.count)
        {
            lblPlayer2Status.text = "Tied"
            lblPlayer1Status.text = "Tied"
        }
    }
    
    
    @IBOutlet weak var player2Count: UILabel!
    
    @IBOutlet weak var player1Count: UILabel!
    
    @IBOutlet weak var lblPlayer1Status: UILabel!
    
    @IBOutlet weak var lblPlayer2Status: UILabel!
    
    var card :String = ""
    
    let cardsDictionary: [String: Int] = ["2_of_clubs" : 2, "2_of_diamonds":  2, "2_of_hearts" : 2, "2_of_spades" :2, "3_of_clubs" : 3, "3_of_diamonds" :3 , "3_of_hearts" : 3, "3_of_spades" : 3 , "4_of_clubs" : 4, "4_of_diamonds" : 4, "4_of_hearts" : 4, "4_of_spades" : 4, "5_of_clubs" : 5, "5_of_diamonds" : 5, "5_of_hearts" : 5, "5_of_spades" : 5 , "6_of_clubs" : 6, "6_of_diamonds" : 6, "6_of_hearts" : 6, "6_of_spades" : 6, "7_of_clubs" :7, "7_of_diamonds" : 7, "7_of_hearts" : 7, "7_of_spades" : 7, "8_of_clubs" : 8, "8_of_diamonds" : 8, "8_of_hearts" : 8, "8_of_spades" : 8, "9_of_clubs": 9, "9_of_diamonds" : 9, "9_of_hearts" : 9, "9_of_spades" : 9, "10_of_clubs" : 10, "10_of_diamonds" : 10, "10_of_hearts": 10, "10_of_spades": 10 , "jack_of_clubs" : 11, "jack_of_diamonds" : 11, "jack_of_hearts" : 11, "jack_of_spades" : 11,"queen_of_clubs" : 12, "queen_of_diamonds" : 12,"queen_of_hearts" : 12, "queen_of_spades" : 12,"king_of_clubs" : 13, "king_of_diamonds" : 13,"king_of_hearts" : 13, "king_of_spades" : 13,"ace_of_clubs" : 14, "ace_of_diamonds" : 14 ,"ace_of_hearts" : 14, "ace_of_spades" : 14,"joker_red" : 0,"joker_black" : 0]
    
    
    func dealCards() {
         var cardsArray = ["2_of_clubs","2_of_diamonds", "2_of_hearts", "2_of_spades", "3_of_clubs", "3_of_diamonds", "3_of_hearts", "3_of_spades", "4_of_clubs", "4_of_diamonds", "4_of_hearts", "4_of_spades", "5_of_clubs", "5_of_diamonds", "5_of_hearts", "5_of_spades", "6_of_clubs", "6_of_diamonds", "6_of_hearts", "6_of_spades", "7_of_clubs", "7_of_diamonds", "7_of_hearts", "7_of_spades", "8_of_clubs", "8_of_diamonds", "8_of_hearts", "8_of_spades", "9_of_clubs", "9_of_diamonds", "9_of_hearts", "9_of_spades", "10_of_clubs", "10_of_diamonds", "10_of_hearts", "10_of_spades", "jack_of_clubs", "jack_of_diamonds", "jack_of_hearts", "jack_of_spades","queen_of_clubs", "queen_of_diamonds","queen_of_hearts", "queen_of_spades","king_of_clubs", "king_of_diamonds","king_of_hearts", "king_of_spades","ace_of_clubs", "ace_of_diamonds","ace_of_hearts", "ace_of_spades","joker_red","joker_black"]
        
        
        for _ in 0..<26 {
            var cardsArrayCount: Int = cardsArray.count
            
            let randomCardIndex = Int(arc4random_uniform(UInt32(cardsArrayCount)))
            player1Array.append(cardsArray[randomCardIndex])
            cardsArray.remove(at: randomCardIndex)
            
            cardsArrayCount = cardsArray.count
            let randomCardIndex2 = Int(arc4random_uniform(UInt32(cardsArrayCount)))
            player2Array.append(cardsArray[randomCardIndex2])
            cardsArray.remove(at: randomCardIndex2)
        
        }
        print("\(player1Array)")

        print("\(player2Array)")
        
        let isEqual : Bool = player1Array == player2Array
        
        
        print("\(isEqual)")

    }
    
    var CardsDrawn = [String]()
    func draw() {
        
        //var CardsDrawn = [String]()
        if (isGameOver() == true){
            let alertController = UIAlertController(title: "Game Over!", message: "Press restart to start a new game.", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            present(alertController, animated: true, completion:nil)
        }
        CardsDrawn.append(player1Array[0])
        CardsDrawn.append(player2Array[0])
        player1Array.remove(at: 0)
        player2Array.remove(at: 0)

        
        print("\(CardsDrawn)")
        
        
        imgCard1.image = UIImage(named: CardsDrawn[0])
        imgCard2.image = UIImage(named: CardsDrawn[1])
     //   player1Count.text = String(Int(UInt32(player1Array.count)))
       // player2Count.text = String(UInt32(player2Array.count))

        let card1 : String = CardsDrawn[0]
        let card2 : String = CardsDrawn[1]
    
        print(cardsDictionary["card1"] ?? <#default value#>)
        print("\(cardsDictionary[card2])")
        let cardAtIndex0 : Int = cardsDictionary[String(CardsDrawn[0])]!
        let cardAtIndex1 : Int = cardsDictionary[String(CardsDrawn[1])]!


        if (cardAtIndex0 > cardAtIndex1)
        {
            player1Array.append(CardsDrawn[0])
            player1Array.append(CardsDrawn[1])
            CardsDrawn.removeAll()
        }
        else if (cardAtIndex0 < cardAtIndex1) {
            player2Array.append(CardsDrawn[0])
            player2Array.append(CardsDrawn[1])
            CardsDrawn.removeAll()
        }
        else if (cardAtIndex0 == cardAtIndex1){
          print("war")
            //CardsDrawn.removeAll()
            imgCard1.image = #imageLiteral(resourceName: "back_blue")
            imgCard2.image = #imageLiteral(resourceName: "back_blue")
            
             war()
            
        }
        CardsDrawn.removeAll()
    
    }
    
//    func display(card : String) {
//        <#function body#>
//    }
//
    func war() {
        CardsDrawn.append(player1Array[0])
        CardsDrawn.append(player2Array[0])
        player1Array.remove(at: 0)
        player2Array.remove(at: 0)
        
        
        CardsDrawn.append(player1Array[0])
        CardsDrawn.append(player2Array[0])
        player1Array.remove(at: 0)
        player2Array.remove(at: 0)
        
        let cardAtIndex4 : Int = cardsDictionary[String(CardsDrawn[4])]!
        let cardAtIndex5 : Int = cardsDictionary[String(CardsDrawn[5])]!
        
        imgCard1.image = UIImage(named: CardsDrawn[4])
        imgCard2.image = UIImage(named: CardsDrawn[5])
        
        if ( cardAtIndex4 > cardAtIndex5){
            player1Array.append(CardsDrawn[0])
            player1Array.append(CardsDrawn[1])
            player1Array.append(CardsDrawn[2])
            player1Array.append(CardsDrawn[3])
            player1Array.append(CardsDrawn[4])
            player1Array.append(CardsDrawn[5])
            CardsDrawn.removeAll()
        }
        else if ( cardAtIndex4 < cardAtIndex5){
            
            player2Array.append(CardsDrawn[0])
            player2Array.append(CardsDrawn[1])
            player2Array.append(CardsDrawn[2])
            player2Array.append(CardsDrawn[3])
            player2Array.append(CardsDrawn[4])
            player2Array.append(CardsDrawn[5])
            CardsDrawn.removeAll()
        }
        else if ( cardAtIndex4 == cardAtIndex5){
            war()
        }
    }
    func isGameOver() -> Bool {
        var isGameOver = false
        if ( player1Array.count == 0 || player2Array.count == 0 ){
            isGameOver = true
        }
        
        return isGameOver
    }
    

}

