////
////  DescPanelRender.swift
////  DavisCraft
////
////  Created by Kim Nguyen on 11/8/15.
////  Copyright © 2015 UCDClassNitta. All rights reserved.
////
//
import SpriteKit
import UIKit
import Foundation

//option + command + <- 
//that Hides blocks of code!!

class ActionPanelRender: IconsRender {
    var mapRender = MapRender() //added this to place on map but not sure if needed
    let  size = 41.5 //sets the size of all the icons
    var selectedAsset : SKNode!
    let scene1 = scene
    var Button1 = UIButton()
    var Button2 = UIButton()
    var Button3 = UIButton()
    var Button4 = UIButton()
    var Button5 = UIButton()
    var Button6 = UIButton()
    var Button7 = UIButton() //for walls when we implement them as something peasants can make
    var Button8 = UIButton() //the cancel button is set to this
    
    func createBorder(){
        let border = UIImageView(image: UIImage(named: "Border.png")) // Whatever image you want
        self.addSubview(border)
        border.frame = CGRectMake(0, 5, self.bounds.size.width, self.bounds.size.height - 20)
        self.sendSubviewToBack(border)
    }

    func labelPrint(curObject: SKNode){ //containsa switch statement dependent on the type, set buttons to correct icons
        selectedAsset = curObject
        
        switch curObject{
        case is Peasant:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Peasant {
                let (iDictionary, iNames) = readIcons()
                
                let humanMove = UIButton()
                humanMove.setImage(UIImage(CGImage: iDictionary![iNames[85]]!), forState: UIControlState.Normal)
                let repair = UIButton()
                repair.setImage(UIImage(CGImage: iDictionary![iNames[87]]!), forState: UIControlState.Normal)
                let mine = UIButton()
                mine.setImage(UIImage(CGImage: iDictionary![iNames[88]]!), forState: UIControlState.Normal)
                let buildSimple = UIButton()
                buildSimple.setImage(UIImage(CGImage: iDictionary![iNames[89]]!), forState: UIControlState.Normal)
                let humanWeapon1 = UIButton()
                humanWeapon1.setImage(UIImage(CGImage: iDictionary![iNames[118]]!), forState: UIControlState.Normal)
                let humanArmor1 = UIButton()
                humanArmor1.setImage(UIImage(CGImage: iDictionary!["human-armor-1"]!), forState: UIControlState.Normal)
                
                humanMove.frame = CGRect(x: 13, y: 15, width: size, height: size)
                repair.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                mine.frame = CGRect(x: 24 + size * 2, y: 15, width: size, height: size)
                buildSimple.frame = CGRect(x: 13, y: 25 + size, width: size, height: size)
                humanWeapon1.frame = CGRect(x: 18 + size, y: 25 + size, width: size, height: size)
                humanArmor1.frame = CGRect(x: 24 + size * 2, y: 25 + size, width: size, height: size)
                
                humanMove.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanMove.addTarget(self, action: "moveHere:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "attackThis:", forControlEvents: UIControlEvents.TouchUpInside)
                humanArmor1.addTarget(self, action: "stayHere:", forControlEvents: UIControlEvents.TouchUpInside)
                repair.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                repair.addTarget(self, action: "repairThis:", forControlEvents: UIControlEvents.TouchUpInside)
                mine.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                mine.addTarget(self, action: "mineThis:", forControlEvents: UIControlEvents.TouchUpInside)
                buildSimple.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                buildSimple.addTarget(self, action: "createBuildings:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = humanMove
                Button2 = repair
                Button3 = mine
                Button4 = buildSimple
                Button5 = humanWeapon1
                Button6 = humanArmor1
                
                self.addSubview(Button1)
                self.addSubview(Button2)
                self.addSubview(Button3)
                self.addSubview(Button4)
                self.addSubview(Button5)
                self.addSubview(Button6)
                
            }
        case is Footman:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Footman {
                let (iDictionary, iNames) = readIcons()
                
                let humanMove = UIButton()
                humanMove.setImage(UIImage(CGImage: iDictionary![iNames[85]]!), forState: UIControlState.Normal)
                let humanPatrol = UIButton()
                humanPatrol.setImage(UIImage(CGImage: iDictionary!["human-patrol"]!), forState: UIControlState.Normal)
                let humanWeapon1 = UIButton()
                humanWeapon1.setImage(UIImage(CGImage: iDictionary![iNames[118]]!), forState: UIControlState.Normal)
                let humanArmor1 = UIButton()
                humanArmor1.setImage(UIImage(CGImage: iDictionary!["human-armor-1"]!), forState: UIControlState.Normal)
                
                humanMove.frame = CGRect(x: 13, y: 15, width: size, height: size)
                humanPatrol.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                humanWeapon1.frame = CGRect(x: 18 + size, y: 25 + size, width: size, height: size)
                humanArmor1.frame = CGRect(x: 24 + size * 2, y: 25 + size, width: size, height: size)
                
                humanMove.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanMove.addTarget(self, action: "moveHere:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "attackThis:", forControlEvents: UIControlEvents.TouchUpInside)
                humanPatrol.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanPatrol.addTarget(self, action: "patrolHere:", forControlEvents: UIControlEvents.TouchUpInside)
                humanArmor1.addTarget(self, action: "stayHere:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = humanMove
                Button2 = humanPatrol
                Button3 = humanWeapon1
                Button4 = humanArmor1
                
                self.addSubview(Button1)
                self.addSubview(Button2)
                self.addSubview(Button3)
                self.addSubview(Button4)
            }
        case is Ranger:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Ranger {
                let (iDictionary, iNames) = readIcons()
                let humanMove = UIButton()
                humanMove.setImage(UIImage(CGImage: iDictionary![iNames[85]]!), forState: UIControlState.Normal)
                let humanPatrol = UIButton()
                humanPatrol.setImage(UIImage(CGImage: iDictionary!["human-patrol"]!), forState: UIControlState.Normal)
                let humanWeapon1 = UIButton()
                humanWeapon1.setImage(UIImage(CGImage: iDictionary![iNames[118]]!), forState: UIControlState.Normal)
                let humanArmor1 = UIButton()
                humanArmor1.setImage(UIImage(CGImage: iDictionary!["human-armor-1"]!), forState: UIControlState.Normal)
                
                humanMove.frame = CGRect(x: 13, y: 15, width: size, height: size)
                humanPatrol.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                humanWeapon1.frame = CGRect(x: 18 + size, y: 25 + size, width: size, height: size)
                humanArmor1.frame = CGRect(x: 24 + size * 2, y: 25 + size, width: size, height: size)
                
                humanMove.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanMove.addTarget(self, action: "moveHere:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "attackThis:", forControlEvents: UIControlEvents.TouchUpInside)
                humanPatrol.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanPatrol.addTarget(self, action: "patrolHere:", forControlEvents: UIControlEvents.TouchUpInside)
                humanArmor1.addTarget(self, action: "stayHere:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = humanMove
                Button2 = humanPatrol
                Button3 = humanWeapon1
                Button4 = humanArmor1
                
                self.addSubview(Button1)
                self.addSubview(Button2)
                self.addSubview(Button3)
                self.addSubview(Button4)            }
        case is Archer:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Archer {
                let (iDictionary, iNames) = readIcons()
                let humanMove = UIButton()
                humanMove.setImage(UIImage(CGImage: iDictionary![iNames[85]]!), forState: UIControlState.Normal)
                let humanPatrol = UIButton()
                humanPatrol.setImage(UIImage(CGImage: iDictionary!["human-patrol"]!), forState: UIControlState.Normal)
                let humanWeapon1 = UIButton()
                humanWeapon1.setImage(UIImage(CGImage: iDictionary![iNames[118]]!), forState: UIControlState.Normal)
                let humanArmor1 = UIButton()
                humanArmor1.setImage(UIImage(CGImage: iDictionary!["human-stand-ground"]!), forState: UIControlState.Normal)
                
                humanMove.frame = CGRect(x: 13, y: 15, width: size, height: size)
                humanPatrol.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                humanWeapon1.frame = CGRect(x: 18 + size, y: 25 + size, width: size, height: size)
                humanArmor1.frame = CGRect(x: 24 + size * 2, y: 25 + size, width: size, height: size)
                
                humanMove.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanMove.addTarget(self, action: "moveHere:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanWeapon1.addTarget(self, action: "attackThis:", forControlEvents: UIControlEvents.TouchUpInside)
                humanPatrol.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                humanPatrol.addTarget(self, action: "patrolHere:", forControlEvents: UIControlEvents.TouchUpInside)
                humanArmor1.addTarget(self, action: "stayHere:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = humanMove
                Button2 = humanPatrol
                Button3 = humanWeapon1
                Button4 = humanArmor1
                
                self.addSubview(Button1)
                self.addSubview(Button2)
                self.addSubview(Button3)
                self.addSubview(Button4)
            }
        case is TownHall:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? TownHall {
                let (iDictionary, iNames) = readIcons()
                
                let BuildPeasant = UIButton()
                BuildPeasant.setImage(UIImage(CGImage: iDictionary![iNames[2]]!), forState: UIControlState.Normal)
                let BuildKeep = UIButton()
                BuildKeep.setImage(UIImage(CGImage: iDictionary![iNames[43]]!), forState: UIControlState.Normal)
                
                BuildPeasant.frame = CGRect(x: 13, y: 15, width: size, height: size)
                BuildKeep.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                
                BuildPeasant.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildPeasant.addTarget(self, action: "buildPeasant:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildKeep.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildKeep.addTarget(self, action: "buildKeep:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = BuildPeasant
                Button2 = BuildKeep
                
                self.addSubview(Button1)
                self.addSubview(Button2)
            }
        case is GoldMine: //doesnt have any buttons that I am aware of
            removeCurPanel()
            createBorder()
            if let _ = curObject as? GoldMine {
            }
        case is Barracks:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Barracks {
                let (iDictionary, _) = readIcons()
                
                let BuildFootman = UIButton()
                BuildFootman.setImage(UIImage(CGImage: iDictionary!["footman"]!), forState: UIControlState.Normal)
                let BuildArcher = UIButton()
                BuildArcher.setImage(UIImage(CGImage: iDictionary!["archer"]!), forState: UIControlState.Normal)
                
                BuildFootman.frame = CGRect(x: 13, y: 15, width: size, height: size)
                BuildArcher.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                
                BuildFootman.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildFootman.addTarget(self, action: "buildFootman:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildArcher.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildArcher.addTarget(self, action: "buildArcher:", forControlEvents: UIControlEvents.TouchUpInside)
                

                
                Button1 = BuildFootman
                Button2 = BuildArcher
                
                self.addSubview(Button1)
                self.addSubview(Button2)
            }
        case is BlackSmith: //will need to call Upgrade for archer and Upgrade for footman
            removeCurPanel()
            createBorder()
            if let _ = curObject as? BlackSmith {
                let (iDictionary, _) = readIcons()
                
                let WeaponUpgrade2 = UIButton()
                WeaponUpgrade2.setImage(UIImage(CGImage: iDictionary!["human-weapon-2"]!), forState: UIControlState.Normal)
                let ArmorUpgrade2 = UIButton()
                ArmorUpgrade2.setImage(UIImage(CGImage: iDictionary!["human-armor-2"]!), forState: UIControlState.Normal)
                
                WeaponUpgrade2.frame = CGRect(x: 13, y: 15, width: size, height: size)
                ArmorUpgrade2.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                
                WeaponUpgrade2.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                WeaponUpgrade2.addTarget(self, action: "upgradeWeapon2:", forControlEvents: UIControlEvents.TouchUpInside)
                ArmorUpgrade2.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                ArmorUpgrade2.addTarget(self, action: "upgradeArmor2:", forControlEvents: UIControlEvents.TouchUpInside)

                Button1 = WeaponUpgrade2
                Button2 = ArmorUpgrade2
                
                self.addSubview(Button1)
                self.addSubview(Button2)}
        case is Castle:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Castle {
                let (iDictionary, iNames) = readIcons()
                
                let BuildPeasant = UIButton()
                BuildPeasant.setImage(UIImage(CGImage: iDictionary![iNames[2]]!), forState: UIControlState.Normal)
                
                BuildPeasant.frame = CGRect(x: 13, y: 15, width: size, height: size)
                
                BuildPeasant.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildPeasant.addTarget(self, action: "buildPeasant:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = BuildPeasant
                
                self.addSubview(Button1)}
        case is Farm: //no buttons that I know of
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Farm {
            }
        case is GuardTower: //no buttons that I know of
            removeCurPanel()
            createBorder()
            if let _ = curObject as? GuardTower {
            }
        case is Keep:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? Keep {
                let (iDictionary, iNames) = readIcons()
                
                let BuildPeasant = UIButton()
                BuildPeasant.setImage(UIImage(CGImage: iDictionary![iNames[2]]!), forState: UIControlState.Normal)
                let BuildCastle = UIButton()
                BuildCastle.setImage(UIImage(CGImage: iDictionary!["castle"]!), forState: UIControlState.Normal)
                
                BuildPeasant.frame = CGRect(x: 13, y: 15, width: size, height: size)
                BuildCastle.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                
                BuildPeasant.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildPeasant.addTarget(self, action: "buildPeasant:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildCastle.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildCastle.addTarget(self, action: "buildCastle:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = BuildPeasant
                Button2 = BuildCastle
                
                self.addSubview(Button1)
                self.addSubview(Button2)
            }
        case is LumberMill: //check images see if they are correct
            removeCurPanel()
            createBorder()
            if let _ = curObject as? LumberMill {
                let (iDictionary, _) = readIcons()
                
                let ArrowUpgrade2 = UIButton()
                ArrowUpgrade2.setImage(UIImage(CGImage: iDictionary!["human-arrow-2"]!), forState: UIControlState.Normal)
                let BuildRanger = UIButton()
                BuildRanger.setImage(UIImage(CGImage: iDictionary!["ranger"]!), forState: UIControlState.Normal)
                
                ArrowUpgrade2.frame = CGRect(x: 13, y: 15, width: size, height: size)
                BuildRanger.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                
                ArrowUpgrade2.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                ArrowUpgrade2.addTarget(self, action: "upgradeArrow2:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildRanger.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                BuildRanger.addTarget(self, action: "buildRanger:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = ArrowUpgrade2
                Button2 = BuildRanger
                
                self.addSubview(Button1)
                self.addSubview(Button2)
            }
        case is ScoutTower:
            removeCurPanel()
            createBorder()
            if let _ = curObject as? ScoutTower {
                let (iDictionary, _) = readIcons()
                
                let guardTower = UIButton()
                guardTower.setImage(UIImage(CGImage: iDictionary!["human-guard-tower"]!), forState: UIControlState.Normal)
                let cannonTower = UIButton()
                cannonTower.setImage(UIImage(CGImage: iDictionary!["human-cannon-tower"]!), forState: UIControlState.Normal)
                
                guardTower.frame = CGRect(x: 13, y: 15, width: size, height: size)
                cannonTower.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
                
                guardTower.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                guardTower.addTarget(self, action: "buildGuardTower:", forControlEvents: UIControlEvents.TouchUpInside)
                cannonTower.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
                cannonTower.addTarget(self, action: "buildCannonTower:", forControlEvents: UIControlEvents.TouchUpInside)
                
                Button1 = guardTower
                Button2 = cannonTower
                
                self.addSubview(Button1)
                self.addSubview(Button2)}
        default:
            removeCurPanel()
            createBorder()
            drawHPBar(0, yDir: 0, width: 0, height: 0)
        }//end of switch
    }//end of functio
    
    
    
    // These following functions get called when a button gets pressed. On the right shows the case where they are effected.
    
    
    func cancelMenu(sender: UIButton!){ //presents the cancelMenu screen
        //curObject: SKNode
        let (iDictionary, _) = readIcons()
        removeCurPanel()
        createBorder()
        let cancelButton = UIButton()
        cancelButton.setImage(UIImage(CGImage: iDictionary!["cancel"]!), forState: UIControlState.Normal)
        cancelButton.frame = CGRect(x: size * 3.5, y: size * 2.3, width: size / 2, height: size / 2)
        cancelButton.setBackgroundImage(UIImage(named: "Border.png"), forState: .Normal)
        cancelButton.addTarget(self, action: "returnBack:", forControlEvents: .TouchUpInside)
        Button8 = cancelButton
        self.addSubview(Button8)
    } //called by all Buttons besides Cancel
    
    func returnBack(sender:UIButton!){labelPrint(selectedAsset)} //called by Cancel button to return Back to previous menu
    
    func createBuildings(sender:UIButton!){ //walls will need to be here as well, so there should be eight buttons
        let (iDictionary, _) = readIcons()

        let BuildTownHall = UIButton()
        BuildTownHall.setImage(UIImage(CGImage: iDictionary!["town-hall"]!), forState: UIControlState.Normal)
        let BuildFarm = UIButton()
        BuildFarm.setImage(UIImage(CGImage: iDictionary!["chicken-farm"]!), forState: UIControlState.Normal)
        let BuildBarracks = UIButton()
        BuildBarracks.setImage(UIImage(CGImage: iDictionary!["human-barracks"]!), forState: UIControlState.Normal)
        let BuildLumberMill = UIButton()
        BuildLumberMill.setImage(UIImage(CGImage: iDictionary!["human-lumber-mill"]!), forState: UIControlState.Normal)
        let BuildScoutTower = UIButton()
        BuildScoutTower.setImage(UIImage(CGImage: iDictionary!["scout-tower"]!), forState: UIControlState.Normal)
        let BuildBlacksmith = UIButton()
        BuildBlacksmith.setImage(UIImage(CGImage: iDictionary!["human-blacksmith"]!), forState: UIControlState.Normal)
        
        BuildTownHall.frame = CGRect(x: 13, y: 15, width: size, height: size)
        BuildFarm.frame = CGRect(x: 18 + size, y: 15, width: size, height: size)
        BuildBarracks.frame = CGRect(x: 24 + size * 2, y: 15, width: size, height: size)
        BuildLumberMill.frame = CGRect(x: 13, y: 25 + size, width: size, height: size)
        BuildScoutTower.frame = CGRect(x: 18 + size, y: 25 + size, width: size, height: size)
        BuildBlacksmith.frame = CGRect(x: 24 + size * 2, y: 25 + size, width: size, height: size)
        
        BuildTownHall.addTarget(self, action: "buildTownHall:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildFarm.addTarget(self, action: "buildFarm:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildBarracks.addTarget(self, action: "buildBarracks:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildLumberMill.addTarget(self, action: "buildLumberMill:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildScoutTower.addTarget(self, action: "buildScoutTower:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildBlacksmith.addTarget(self, action: "buildBlacksmith:", forControlEvents: UIControlEvents.TouchUpInside)
        
        BuildTownHall.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildFarm.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildBarracks.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildLumberMill.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildScoutTower.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        BuildBlacksmith.addTarget(self, action: "cancelMenu:", forControlEvents: UIControlEvents.TouchUpInside)
        
        Button1 = BuildTownHall
        Button2 = BuildFarm
        Button3 = BuildBarracks
        Button4 = BuildLumberMill
        Button5 = BuildScoutTower
        Button6 = BuildBlacksmith
        
        self.addSubview(Button1)
        self.addSubview(Button2)
        self.addSubview(Button3)
        self.addSubview(Button4)
        self.addSubview(Button5)
        self.addSubview(Button6)

    } //called by Peasant
    
    func buildTownHall(sender:UIButton!){ scene1!.printMe("buildTownHall")} //called by Peasant's build button
    
    func buildFarm(sender:UIButton!){scene1!.printMe("buildFarm")} //called by Peasant's build button
    
    func buildBarracks(sender:UIButton!){scene1!.printMe("buildBarracks")}//called by Peasant's build button
    
    func buildLumberMill(sender:UIButton!){scene1!.printMe("buildLumberMill")}//called by Peasant's build button
    
    func buildScoutTower(sender:UIButton!){scene1!.printMe("buildScoutTower")}//called by Peasant's build button
    
    func buildBlacksmith(sender:UIButton!){scene1!.printMe("buildBlacksmith")}//called by Peasant's build button

    func moveHere(sender:UIButton!){scene1!.printMe("moveHere")}//called by all Units (Peasant, Footman, Ranger, Archer)
    
    func attackThis(sender:UIButton!){scene1!.printMe("attackThis")}//called by all Units
    
    func mineThis(sender:UIButton!){scene1!.printMe("mineThis")}//called by Peasant
    
    func repairThis(sender:UIButton!){scene1!.printMe("repairThis")}//called by Peasants
    
    func stayHere(sender:UIButton!){scene1!.printMe("stayHere")}//called by all Units
    
    func patrolHere(sender:UIButton!){scene1!.printMe("patrolHere")}//called by all Units but Peasant
    
    func buildPeasant(sender:UIButton!){scene1!.printMe("buildPeasant")}//called by TownHall, Keep, and Castle
    
    func buildKeep(sender:UIButton!){scene1!.printMe("buildKeep")}//called by TownHall
    
    func buildFootman(sender:UIButton!){scene1!.printMe("buildFootman")}//called by Barracks

    func buildArcher(sender:UIButton!){scene1!.printMe("buildArcher")}//called by Barracks
    
    func upgradeWeapon2(sender:UIButton!){scene1!.printMe("upgradeWeapon2")}//called by Blacksmith
    
    func upgradeArmor2(sender:UIButton!){scene1!.printMe("upgradeArmor2")}//called by Blacksmith
    
    func buildCastle(sender:UIButton!){scene1!.printMe("buildCastle")}//called by Keep
    
    func buildRanger(sender:UIButton!){scene1!.printMe("buildRanger")}//called by LumberMill
    
    func upgradeArrow2(sender:UIButton!){scene1!.printMe("upgradeArrow2")}//called by LumberMill
    
    func buildGuardTower(sender:UIButton!){scene1!.printMe("buildGuardTower")}//called by ScoutTower
    
    func buildCannonTower(sender:UIButton!){scene1!.printMe("buildCannonTower")}//called by ScoutTower
    
}





