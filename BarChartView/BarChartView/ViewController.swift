//
//  ViewController.swift
//  BarChartView
//
//  Created by Hiromi Motodera on 10/30/17.
//  Copyright © 2017 moaible. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    var barChartView = BarChartView(frame: CGRect.zero)
    
    let xArray = Array(0 ... 48)
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureBarChartView()
        self.view.addSubview(barChartView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        barChartView.frame = view.bounds
    }
    
    // MARK: -
    
    func configureBarChartView() {
        barChartView = BarChartView(frame: CGRect.zero)
        let ys1 = xArray.map { x in return Double(x) }
        let yse1 = ys1.enumerated().map { (offset: Int, element: Double) in
            return BarChartDataEntry(x: Double(offset), y: abs(element))
        }
        let data = BarChartData()
        let dataSet1 = BarChartDataSet(values: yse1, label: "使用量")
        dataSet1.colors = [.orange]
        data.addDataSet(dataSet1)
        data.setDrawValues(false)
        barChartView.data = data
        barChartView.xAxis.yOffset = 0
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: xArray.map {
            "\($0 / 2):\($0 % 2 == 0 ? "00" : "30")"
        })
        barChartView.xAxis.granularity = 12
        barChartView.gridBackgroundColor = .white
        barChartView.chartDescription = nil
        barChartView.data?.highlightEnabled = false
        barChartView.doubleTapToZoomEnabled = false
        barChartView.leftAxis.enabled = false
        barChartView.rightAxis.enabled = false
        barChartView.xAxis.labelPosition = .bottomInside
    }
    
    // MARK: - Memory management
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
