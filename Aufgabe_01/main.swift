//
//  main.swift
//  Aufgabe_01
//
//  Created by Simon Herzog on 04.03.21.
//


import Foundation

struct PropertyCalculator {
    //Die Eigenschaften vom Typ Double, damit z.B. auch 15,3 Meter oder 11,34€ eingegeben werden können
    
    //Länge des Grundstücks
    var propertyLength = 0.0
    //Breite des Grundstücks
    var propertyWidth = 0.0
    //Preis pro Qudratmeter
    var priceSquareMeter = 0.0
    //Nettopreis des Grundstückes
    var netPriceProperty = 0.0
    
    //Methode zum Einlesen der Daten
    //Die Daten werden als String eingelesen und direkt in ein Double gecastet und den vars zugewiesen
    mutating func readPropertyData() {
        print("### Grundstücksrechner ###\n")
        print("Hinweis: Bitte geben Sie für ein Komma einen Punkt . ein, da sonst Fehler auftreten können!\n")
        print("Länge Grundstück in Meter: \t\t\t", terminator: "")
        propertyLength = Double(readLine()!)!
        print("Breite Grundstück in Meter: \t\t", terminator: "")
        propertyWidth = Double(readLine()!)!
        print("Quadratmeterpreis: \t\t\t\t\t", terminator: "")
        priceSquareMeter = Double(readLine()!)!
        print("--------------\n")

    }
    
    //Methode zur Berechnung der Grundstücksgröße und des Nettopreises
    mutating func calcPropertyPrice() {
        //Nettopreisberechnung = Preis pro qm * (breite * länge)
        netPriceProperty = priceSquareMeter * (propertyWidth * propertyLength)
        //Ausgabe der Grundstücksgröße und des Netto-Preises, gerundet auf 2 Nachkommastellen, wobei Quadratmeter direkt berechnet werden
        print("Grundstückgröße:\t\t\t\t" + String(format: "%.2f", propertyWidth * propertyLength) + " qm")
        print("Grundstückspreis:\t\t\t\t" + String(format: "%.2f", netPriceProperty) + " €")
        print("--------------\n")
    }
    
    //Methode zur Berechnung des Preises inkl. Provision & MwSt
    mutating func calcPriceWithVatAndBrokerage() {
        //Lokale Konstante für Provision von 5%
        let brokerage = 1.05
        //Lokale Konstante für Mehrwertsteuer von 19%
        let vat = 1.19
        //Direkte Berechnung  des "Provisionspreises" und Ausgabe
        print("Preis inkl. Provision:\t\t\t " + String(format: "%.2f", netPriceProperty * brokerage) + " €")
        //Direkte Berechnung des "MwSt-Preises" und Ausgabe
        print("Preis inkl. Provision & MwSt.:\t " + String(format: "%.2f", vat * (netPriceProperty * brokerage)) + " €")
        print("--------------\n")

    }
    
    
}
//Instanz der struct PropertyCalculator erstellen
var neuesGrundstueck = PropertyCalculator()
//An Instanz die Methoden aufrufen
neuesGrundstueck.readPropertyData()
neuesGrundstueck.calcPropertyPrice()
neuesGrundstueck.calcPriceWithVatAndBrokerage()
