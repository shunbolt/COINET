//
//  CoinCollectionViewCell.swift
//  Projet_transverse
//
//  Created by Jérôme COFFIN on 31/03/2018.
//  Copyright © 2018 Jérôme COFFIN. All rights reserved.
//

import UIKit


class CoinCollectionViewCell: UICollectionViewCell {
    
    var apiURL = URL(string : "")
    @IBOutlet weak var etherValueLabel: UILabel!
    var doubleWithNoCurrencySign:Double?
    @IBOutlet weak var displayCurName: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    // MARK: - LayoutSubviews
    override func layoutSubviews() {
        
        // Safely unwrap the API URL since it could be nil
        guard let apiURL = apiURL else {
            return
        }
        
        // Make the GET request for our API URL to get the value NSNumber
        makeValueGETRequest(url: apiURL) { (value) in
            
            // Must update the UI on the main thread since makeValueGetRequest is a background operation
            DispatchQueue.main.async {
                // Set the etherValueLabel with the formatted USD value or "Failed" in the case of failure
                self.etherValueLabel.text = self.formatAsCurrencyString(value: value) ?? "Failed"
            }
        }
    }
    
    //MARK: - The graph
    
    //@IBOutlet weak var chtChart: LineChartView!
    
    //var numbers = [Double]()
    //let component = DateComponents()
    
    // Get all the values for the graph
    /*func prepareForGraph() {
        
        var myString:String = ""
        
        //let timestamp = component.date?.timeIntervalSince1970
        var todayTimestamp = Date().timeIntervalSince1970
        var timestamp = ""
        
        for i in 0..<5 {
            
            todayTimestamp = todayTimestamp - Double(i) * 1000
            
            var myURL = "https://min-api.cryptocompare.com/data/pricehistorical?fsym=BTC&tsyms=USD&ts="
            
            timestamp = String(todayTimestamp)
            
            if let dotRange = timestamp.range(of: ".") {
                timestamp.removeSubrange(dotRange.lowerBound..<timestamp.endIndex)
            }
            
            myURL = myURL + String(describing: timestamp)
            print(myURL)
            
            
            
            makeValueGETRequestArray(url: URL(string: myURL)!) { (myValue) in
                
                myString = myValue?.description ?? "FAIL"
                myString.remove(at: myString.startIndex)
                myString.remove(at: myString.startIndex)
                myString.remove(at: myString.startIndex)
                myString.remove(at: myString.startIndex)
                myString.remove(at: myString.startIndex)
                myString.remove(at: myString.startIndex)
                myString.remove(at: myString.startIndex)
                myString.remove(at: myString.startIndex)
                myString.removeLast()
                
                self.numbers.append((Double(myString))!)
                
                //self.updateGraph()
                
            }
        }
    }*/
    
    
    
    // Add the value in the graph
    /*func updateGraph(){
        
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        
        //here is the for loop
        for i in 0..<numbers.count {
            
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue
        
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        
        
        chtChart.data = data //finally - it adds the chart data to the chart and causes an update
        chtChart.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
        
    }*/
    
    // MARK: - Getting the data
    
    /// Takes an API URL and performs a GET request on it to try to get back an NSNumber
    ///
    /// - Parameters:
    ///   - url: The API URL to perform the GET request with
    ///   - completion: Returns the value as an NSNumber, or nil in the case of failure
    private func makeValueGETRequest(url: URL, completion: @escaping (_ value: NSNumber?) -> Void) {
        let request = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Unwrap the data and make sure that an error wasn't returned
            guard let data = data, error == nil else {
                // If an error was returned set the value in the completion as nil and print the error
                completion(nil)
                print(error?.localizedDescription ?? "")
                return
            }
            
            do {
                // Unwrap the JSON dictionary and read the USD key which has the value of Ethereum
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                    let value = json["USD"] as? NSNumber else {
                        completion(nil)
                        return
                }
                completion(value)
            } catch  {
                // If we couldn't serialize the JSON set the value in the completion as nil and print the error
                completion(nil)
                print(error.localizedDescription)
            }
        }
        request.resume()
    }
    
    
    /// Takes an optional NSNumber and converts it to USD String
    ///
    /// - Parameter value: The NSNumber to convert to a USD String
    /// - Returns: The USD String or nil in the case of failure
    private func formatAsCurrencyString(value: NSNumber?) -> String? {
        /// Construct a NumberFormatter that uses the US Locale and the currency style
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .currency
        
        // Ensure the value is non-nil and we can format it using the numberFormatter, if not return nil
        guard let value = value,
            let formattedCurrencyAmount = formatter.string(from: value) else {
                return nil
        }
        return formattedCurrencyAmount
    }
}
