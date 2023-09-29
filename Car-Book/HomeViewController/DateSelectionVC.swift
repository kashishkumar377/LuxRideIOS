//
//  DateSelectionVC.swift
//  Car-Book
//
//  Created by Devgan on 28/09/23.
//

import UIKit
import FSCalendar

class DateSelectionVC: BaseClassVC {


  @IBOutlet weak var calenderView: FSCalendar!
  let now = Date()
  let formatter = DateFormatter()

  private var firstDate: Date?
  private var lastDate: Date?
  private var datesRange: [Date]?

  override func viewDidLoad() {
      super.viewDidLoad()
  calenderView.allowsMultipleSelection = true
  }

  @IBAction func onBtnChatClicked() {
    dismiss(animated: true)
  }

//  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//      // nothing selected:
//      if firstDate == nil {
//          firstDate = date
//          datesRange = [firstDate!]
//          print("datesRange contains: \(datesRange!)")
//          return
//      }
//      // only first date is selected:
//      if firstDate != nil && lastDate == nil {
//          // handle the case of if the last date is less than the first date:
//          if date <= firstDate! {
//              calendar.deselect(firstDate!)
//              firstDate = date
//              datesRange = [firstDate!]
//              print("datesRange contains: \(datesRange!)")
//              return
//          }
//          let range = datesRange(from: firstDate!, to: date)
//          lastDate = range.last
//          for d in range {
//              calendar.select(d)
//          }
//          datesRange = range
//          print("datesRange contains: \(datesRange!)")
//          return
//      }
//      // both are selected:
//      if firstDate != nil && lastDate != nil {
//          for d in calendar.selectedDates {
//              calendar.deselect(d)
//          }
//          lastDate = nil
//          firstDate = nil
//          datesRange = []
//          print("datesRange contains: \(datesRange!)")
//      }
//  }
  func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
      // both are selected:
      // NOTE: the is a REDUANDENT CODE:
      if firstDate != nil && lastDate != nil {
          for d in calendar.selectedDates {
              calendar.deselect(d)
          }
          lastDate = nil
          firstDate = nil
          datesRange = []
          print("datesRange contains: \(datesRange!)")
      }
  }
}
