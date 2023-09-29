//
//  CarNameCompaniesVC.swift
//  Car-Book
//
//  Created by Devgan on 21/09/23.
//

import UIKit


protocol SelectionListVCsDelegate
{
    func getSelectedValue(value:String,type:String)
}


class CarNameCompaniesVC: BaseClassVC {

  @IBOutlet weak var carListTbl: UITableView!
  var carTypeArr = [CarTypeData]()
  var carCategoryArr = [GetSubCatData]()
  var carNameArr = [CarTypeData]()
  var years = [String]()
  var tableType : String?
  var SelectData = [NSMutableDictionary]()
  var selectedAll = [String]()

  var modelId : String?
  let picker = UIColorPickerViewController()
  var indexSelected = NSIndexPath()
  var arrCondition = ["New","Excellent","Very Good","Good","Fair","For Parts"]
  var arrTitle = ["Clean","Rebuilt","Salvage"]
  var arrFuelType = ["Gas","Diesel","Hybrid","Electric","Flex","Petrol"]
  var arrDoors = ["Two-Door (2-Door) Car","Four-Door (4-Door) Car","Five-Door (5-Door) Car","Three and Five-Door Hatchbacks","Multi-Door Vehicles"]
  var arrCarSeat = ["Two-Seat Car","Four-Seat Car","Five-Seat Car","Seven-Seat Car","Eight-Seat Car","Nine-Seat Car and More"]
  var arrCarMiles = ["0-10K miles","10-20K miles","20-30K miles","30-40K miles","50-60K miles","70-80K miles","90-100K miles","100-120K miles","120-130K miles","130K+ miles"]
  var arrOdoMeter = ["Automatic","Manual"]
  var arrColor = ["Black",
                  "White",
                  "Silver",
                  "Gray",
                  "Blue",
                  "Red",
                  "Green",
                  "Brown",
                  "Beige",
                  "Gold",
                  "Yellow",
                  "Orange",
                  "Purple",
                  "Bronze",
                  "Copper",
                  "Pearl White",
                  "Metallic Gray",
                  "Midnight Blue",
                  "Champagne",
                  "Platinum",
                  "Burgundy",
                  "Magnetic Gray",
                  "Deep Ocean Blue",
                  "Ruby Red",
                  "Forest Green"]
  var arrTrim = ["Base Trim","Hybrid","Off-Road","SEL","Premium"]

  var delegateRef : SelectionListVCsDelegate? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    carListTbl.delegate = self
    carListTbl.dataSource = self
    carListTbl.rowHeight = 60
  }


  override func viewWillAppear(_ animated: Bool) {
    if tableType == "Year" {
      yearPicker()
    }else if tableType == "Category" {
      self.getCarType()
    }else if tableType == "Condition" {

    }else if tableType == "Color" {

    }else if tableType == "Make" {
      //self.getCarName()
      self.getSubCatApi(id:"")

    }else if tableType == "Model" {
      //self.getCarType()
      self.getSubCatApi(id:modelId ?? "")
    }else if tableType == "Trim" {

    }else{
      self.getCarName()
    }
  }


  //MARK: --- YEAR VALUE
  func yearPicker(){
     carTypeArr.removeAll()
      let format = DateFormatter()
      format.dateFormat = "yyyy"
      let dateFormatterGet = DateFormatter()
      dateFormatterGet.dateFormat = "yyyy-MM-dd"

      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMM dd,yyyy"

      let date: Date? = dateFormatterGet.date(from: "2017-02-14")
      print(dateFormatter.string(from: date!))

      var yearsTillNow : [String] {

          for i in (1937..<2023).reversed() {
              years.append("\(i)")
              carListTbl.reloadData()
          }
          return years
      }
      print("yearsTillNow",yearsTillNow)
     }

  @IBAction func btnBack(_ sender: Any) {
    self.dismiss(animated: true)
  }

}

extension CarNameCompaniesVC : UITableViewDelegate,UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableType == "Year" {
      return years.count
    }else if tableType == "Condition" {
      return arrCondition.count
    }else if tableType == "Category" {
      return carNameArr.count
    }else if tableType == "Color"{
      return arrColor.count
    }else if tableType == "Trim"{
      return arrTrim.count
    }else if tableType == "Model"{
      //return carNameArr.count
      return carCategoryArr.count
    }else if tableType == "Make"{
      //return carTypeArr.count
      return carCategoryArr.count
    }else if tableType == "Fuel"{
      return arrFuelType.count
    }else if tableType == "Door"{
      return arrDoors.count
    }else if tableType == "Seat"{
      return arrCarSeat.count
    }else if tableType == "Miles"{
      return arrCarMiles.count
    }else if tableType == "Odo"{
      return arrOdoMeter.count
    }
      else{
      return carTypeArr.count
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    if tableType == "Year"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = years[indexPath.row]

      CarCell.btnSelect.addTarget(self, action: #selector(selectButton), for: .touchUpInside)
      return CarCell
    }else if tableType == "Condition"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrCondition[indexPath.row]
      return CarCell
    }else if tableType == "Category"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = carNameArr[indexPath.row].vehicleTypeName
      return CarCell
    }else if tableType == "Model"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = carCategoryArr[indexPath.row].subCategoryName//carNameArr[indexPath.row].vehicleTypeName
      return CarCell
    }else if tableType == "Make"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = carCategoryArr[indexPath.row].categoryId?.companyName//carTypeArr[indexPath.row].companyName
      return CarCell
    }else if tableType == "Trim"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrTrim[indexPath.row]
      return CarCell
    }else if tableType == "Door"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrDoors[indexPath.row]
      return CarCell
    }else if tableType == "Seat"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrCarSeat[indexPath.row]
      return CarCell
    }else if tableType == "Miles"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrCarMiles[indexPath.row]
      return CarCell
    }else if tableType == "Fuel"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrFuelType[indexPath.row]
      return CarCell
    }else if tableType == "Odo"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrOdoMeter[indexPath.row]
      return CarCell
    }
    else if tableType == "Color"{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = arrColor[indexPath.row]
      return CarCell
    }
    else{
      let CarCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
      CarCell.lblName.text = carTypeArr[indexPath.row].companyName
      CarCell.btnSelect.addTarget(self, action: #selector(selectButton), for: .touchUpInside)

      return CarCell
    }

  }

  @objc func selectButton(sender: UIButton) {
    sender.setImage(UIImage(named: "radio-button-on"), for: .normal)
    let YearValue = self.carTypeArr[sender.tag].vehicleTypeName
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let CarCell = carListTbl.dequeueReusableCell(withIdentifier: "Cell") as! carListCell
    if tableType == "Year"{
      CarCell.accessoryType = .checkmark
      let Value = self.years[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Year")
      dismiss(animated: true)
    }else if tableType == "Condition"{
      let Value = arrCondition[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Condition")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Category"{
      let Value = self.carNameArr[indexPath.row].vehicleTypeName ?? ""
      delegateRef?.getSelectedValue(value: Value, type: "Category")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Make"{
      let Value = carCategoryArr[indexPath.row].categoryId?.companyName//self.carTypeArr[indexPath.row].companyName ?? ""
      let Valueid = self.carCategoryArr[indexPath.row]._id ?? ""
      self.modelId = Valueid
      delegateRef?.getSelectedValue(value: Value ?? "", type: "Make")
      self.getSubCatApi(id: Valueid)
      dismiss(animated: true, completion: nil)
    }else if tableType == "Fuel"{
      let Value = self.arrFuelType[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Fuel")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Model"{
      let Value = carCategoryArr[indexPath.row].subCategoryName ?? ""//self.carNameArr[indexPath.row].vehicleTypeName ?? ""
      delegateRef?.getSelectedValue(value: Value , type: "Model")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Trim"{
      let Value = self.arrTrim[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Trim")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Color"{
      let Value = self.arrColor[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Color")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Odo"{
      let Value = self.arrOdoMeter[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Odo")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Fuel"{
      let Value = self.arrFuelType[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Fuel")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Seat"{
      let Value = self.arrCarSeat[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Seat")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Odo"{
      let Value = self.arrOdoMeter[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Odo")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Door"{
      let Value = self.arrDoors[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Door")
      dismiss(animated: true, completion: nil)
    }else if tableType == "Miles"{
      let Value = self.arrCarMiles[indexPath.row]
      delegateRef?.getSelectedValue(value: Value, type: "Miles")
      dismiss(animated: true, completion: nil)
    }
    else{
      let Value = self.carTypeArr[indexPath.row].companyName ?? ""
      delegateRef?.getSelectedValue(value: Value, type: "")
      dismiss(animated: true, completion: nil)
    }
  }

  }

class carListCell : UITableViewCell {

  @IBOutlet weak var btnSelect: UIButton!
  @IBOutlet weak var lblName: UILabel!
}

extension CarNameCompaniesVC {

  func getSubCatApi(id:String){
    reqUser.getCar { user, res, errCode in
      DispatchQueue.main.async {
       /// self.carCategoryArr = user ?? [GetSubCatData]()
        self.carCategoryArr = user ?? [GetSubCatData]()
        self.carListTbl.reloadData()
      }
   }
  }

  func getCarName(){
      reqUser.getCarCompaniesApi { user, res, errCode in
        DispatchQueue.main.async {
          self.carTypeArr = user ?? [CarTypeData]()
          self.carListTbl.reloadData()
        }
     }
  }


  func getCarType(){
      reqUser.getCarTypeAPi { user, res, errCode in

        DispatchQueue.main.async {
          self.carNameArr = user ?? [CarTypeData]()
          self.carListTbl.reloadData()
        }
     }
  }

}
