//
//  ViewController.swift
//  TTT
//
//  Created by Najla on 19/12/2021.
//

import UIKit

class ViewController: UIViewController {

    //labels
    @IBOutlet weak var GameNameLabel: UILabel!
    
    @IBOutlet weak var WinnerNameLabel: UILabel!
    
    //buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var Button5: UIButton!
    @IBOutlet weak var Button6: UIButton!
    @IBOutlet weak var Button7: UIButton!
    @IBOutlet weak var Button8: UIButton!
    @IBOutlet weak var Button9: UIButton!
    
    @IBOutlet weak var ResetButton: UIButton!
    
    //players
    var RedPlayer: [Int] = []
    var BluePlayer: [Int] = []
    var player = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //who's the winner?
    func RedPlayerWin() -> Bool{
        return(
            RedPlayer.contains(1) && RedPlayer.contains(2) && RedPlayer.contains(3) ||
            RedPlayer.contains(4) && RedPlayer.contains(5) && RedPlayer.contains(6) ||
            RedPlayer.contains(7) && RedPlayer.contains(8) && RedPlayer.contains(9) ||
            RedPlayer.contains(1) && RedPlayer.contains(4) && RedPlayer.contains(7) ||
            RedPlayer.contains(2) && RedPlayer.contains(5) && RedPlayer.contains(8) ||
            RedPlayer.contains(3) && RedPlayer.contains(6) && RedPlayer.contains(9) ||
            RedPlayer.contains(1) && RedPlayer.contains(5) && RedPlayer.contains(9) ||
            RedPlayer.contains(3) && RedPlayer.contains(5) && RedPlayer.contains(7)
        )
    }//end
    func BluePlayerWin() -> Bool{
        return(
            BluePlayer.contains(1) && BluePlayer.contains(2) && BluePlayer.contains(3) ||
            BluePlayer.contains(4) && BluePlayer.contains(5) && BluePlayer.contains(6) ||
            BluePlayer.contains(7) && BluePlayer.contains(8) && BluePlayer.contains(9) ||
            BluePlayer.contains(1) && BluePlayer.contains(4) && BluePlayer.contains(7) ||
            BluePlayer.contains(2) && BluePlayer.contains(5) && BluePlayer.contains(8) ||
            BluePlayer.contains(3) && BluePlayer.contains(6) && BluePlayer.contains(9) ||
            BluePlayer.contains(1) && BluePlayer.contains(5) && BluePlayer.contains(9) ||
            BluePlayer.contains(3) && BluePlayer.contains(5) && BluePlayer.contains(7)
        )
    }//end
    
    /*
     
     win by :
     - - - OR  | OR -
               |      -
               |        -
     */
    
    func EndGame(){
            if (RedPlayer.count + BluePlayer.count == 9) {
                ResetButton.setTitle("Reset", for: .normal)
                ResetButton.isEnabled = true
                WinnerNameLabel.text = "No winners yet!"
            }else if RedPlayerWin() || BluePlayerWin(){
                if player == 2 {
                    WinnerNameLabel.text = "Player X win"
                }
                else{
                    WinnerNameLabel.text = "Player O win"
                }
                ResetButton.setTitle("Reset", for: .normal)
                ResetButton.isEnabled = true
                enableBtn(enable: false)
            }
        }
    func PlayGame(indx: Int, btn: UIButton!){
        if player == 1 {
            btn.setTitle("X", for: .normal)
            btn.setTitleColor(UIColor.red, for: .normal)
            btn.backgroundColor = .red
            player = 2
            RedPlayer.append(indx)
        }else{
            btn.setTitle("O", for: .normal)
            btn.setTitleColor(UIColor.blue, for: .normal)
            btn.backgroundColor = .blue
            player = 1
            BluePlayer.append(indx)
        }
        btn.isEnabled = false
        EndGame()
    }
    
    //not
    func enableBtn(enable: Bool){
        button1.isEnabled = enable
        Button2.isEnabled = enable
        Button3.isEnabled = enable
        Button4.isEnabled = enable
        Button5.isEnabled = enable
        Button6.isEnabled = enable
        Button7.isEnabled = enable
        Button8.isEnabled = enable
        Button9.isEnabled = enable
        }
    func setButtonColors(){
        button1.backgroundColor = UIColor(named: "SquareColor")
        Button2.backgroundColor = UIColor(named: "SquareColor")
        Button3.backgroundColor = UIColor(named: "SquareColor")
        Button4.backgroundColor = UIColor(named: "SquareColor")
        Button5.backgroundColor = UIColor(named: "SquareColor")
        Button6.backgroundColor = UIColor(named: "SquareColor")
        Button7.backgroundColor = UIColor(named: "SquareColor")
        Button8.backgroundColor = UIColor(named: "SquareColor")
        Button9.backgroundColor = UIColor(named: "SquareColor")
    }

    @IBAction func resetClicked(_ sender: UIButton) {
        //not
        enableBtn(enable: true)
        button1.setTitle("", for: .normal)
        Button2.setTitle("", for: .normal)
        Button3.setTitle("", for: .normal)
        Button4.setTitle("", for: .normal)
        Button5.setTitle("", for: .normal)
        Button6.setTitle("", for: .normal)
        Button7.setTitle("", for: .normal)
        Button8.setTitle("", for: .normal)
        Button9.setTitle("", for: .normal)
        ResetButton.setTitle("", for: .normal)
        ResetButton.isEnabled = false
        WinnerNameLabel.text = ""
        RedPlayer.removeAll()
        BluePlayer.removeAll()
        player = 1
        setButtonColors()
    }//end clicked
    
    
    
    @IBAction func Button1Clicked(_ sender: UIButton) {
        PlayGame(indx: 1, btn: button1)
    }
    
    @IBAction func Button2Clicked(_ sender: Any) {
        PlayGame(indx: 2, btn: Button2)
    }
    
    @IBAction func Button3Clicked(_ sender: UIButton) {
        PlayGame(indx: 3, btn: Button3)
    }
    
    @IBAction func Button4Clicked(_ sender: UIButton) {
        PlayGame(indx: 4, btn: Button4)
    }
    
    @IBAction func Button5Clicked(_ sender: UIButton) {
        PlayGame(indx: 5, btn: Button5)
    }
    
    @IBAction func Button6Clicked(_ sender: UIButton) {
        PlayGame(indx: 6, btn: Button6)
    }
    
    @IBAction func Button7Clicked(_ sender: UIButton) {
        PlayGame(indx: 7, btn: Button7)
    }
    
    @IBAction func Button8Clicked(_ sender: UIButton) {
        PlayGame(indx: 8, btn: Button8)
    }
    
    @IBAction func Button9Clicked(_ sender: UIButton) {
        PlayGame(indx: 9, btn: Button9)
    }
    
}//end class
