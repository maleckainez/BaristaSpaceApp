class BrewData {
  int selectedRating;
  String? brewMethod;
  String? originCountry;
  String? originFarm;
  String? originProcessing;
  String? originVariety;
  String? originRoastery;
  String? originRoastDate;
  String? originRoastType;
  String? originFarmAlt;
  String? originNotes;

  BrewData({
    this.selectedRating = 0,
    this.brewMethod,
    this.originCountry,
    this.originFarm,
    this.originProcessing,
    this.originVariety,
    this.originRoastery,
    this.originRoastDate,
    this.originRoastType,
    this.originFarmAlt,
    this.originNotes,
  });


    @override
    String toString() {
    return '''
  BrewData:
  Selected Rating: $selectedRating
  Brew Method: $brewMethod
  Origin Country: $originCountry
  Origin Farm: $originFarm
  Origin Processing: $originProcessing
  Origin Variety: $originVariety
  Origin Roastery: $originRoastery
  Origin Roast Date: $originRoastDate
  Origin Roast Type: $originRoastType
  Origin Farm Altitude: $originFarmAlt
  Origin Notes: $originNotes
  ''';
    }

}
