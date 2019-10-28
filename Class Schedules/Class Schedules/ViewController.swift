//
//  ViewController.swift
//  Class Schedules
//
//  Created by Ethan Weinrot on 10/23/19.
//  Copyright © 2019 Ethan Weinrot. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    var curWeekday:String = ""
    var curDayType:String = ""
    let mySchedule:[String:String] = [
        "A": "CAS Physics",
        "B": "CAS Computer Science",
        "C": "International Film History",
        "D": "English",
        "E": "Calculus",
        "F": "Free Period",
        "5/6 M/W": "CAS Filmmaking",
        "5/6 TU/F": "Jounalism/News Production",
        "5/6 TH": "Life Skills"
    ]
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dayType.count
        } else if component == 1 {
            return weekday.count
        } else {
            return schedule.count
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label: UILabel!
    
    let dayType = ["A", "B", "C"]
    let weekday = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    let schedule = ["Regular", "Block", "Assembly"]
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dayType[row]
        } else if component == 1 {
            return weekday [row]
        } else {
            return schedule[row]
        }
    }
    
    @IBAction func getSchedule(_ sender: Any) {
        let dayTypeRow = pickerView.selectedRow(inComponent: 0)
        let ABCDay = dayType[dayTypeRow]
        let weekDayRow = pickerView.selectedRow(inComponent: 1)
        let dayOfWeek = weekday[weekDayRow]

        
        let periodRotation: [String:[String:[String]]] = [
            "A": [
                "Monday": ["A","B","D","E","5/6 M/W"],
                "Tuesday": ["A","B","D","E","5/6 TU/F"],
                "Wednesday": ["A","B","D","E","5/6 M/W"],
                "Thursday": ["A","B","D","E","5/6 TH"],
                "Friday": ["A","B","D","E","5/6 TU/F"]
            ],
            "C": [
                "Monday": ["C","A","F","D","5/6 M/W"],
                "Tuesday": ["C","A","F","D","5/6 TU/F"],
                "Wednesday": ["C","A","F","D","5/6 M/W"],
                "Thursday": ["C","A","F","D","5/6 TH"],
                "Friday":["C","A","F","D","5/6 TU/F"]
            ],
            "B": [
                "Monday": ["B","C","E","F","5/6 M/W"],
                "Tuesday": ["B","C","E","F","5/6 TU/F"],
                "Wednesday": ["B","C","E","F","5/6 M/W"],
                "Thursday": ["B","C","E","F", "5/6 TH"],
                "Friday": ["B","C","E","F","5/6 TU/F"]
            ]
        ]
        let mySched = getScheduleForDay(periods: periodRotation[ABCDay]![dayOfWeek]!, mySchedule: mySchedule)
        label.text = mySched
    }
    
    func getScheduleForDay(periods:[String], mySchedule:[String:String]) -> String{
        var output = ""
        for period in periods{
            output += "\(period) - "
            output += mySchedule[period] ?? "free period"
            output += "\n"
        }
        return output
        
    }
    
}



