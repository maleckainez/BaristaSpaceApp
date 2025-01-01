class BrewData {
  int selectedRating;
  String? brewDate;
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
  double? brewCoarsness;
  double? brewCoffeeGrams;
  double? brewWaterGrams;
  double? brewWaterTemp;
  double? brewTotalTime;
  String? brewNotes;
  bool? isPublic;

  BrewData({
    this.selectedRating = 0,
    this.brewDate,
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
    this.brewCoarsness = 0.0,
    this.brewCoffeeGrams = 0.0,
    this.brewWaterGrams = 0.0,
    this.brewWaterTemp = 0.0,
    this.brewTotalTime = 0.0,
    this.brewNotes,
    this.isPublic = false,
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
  Gind Coarsness: $brewCoarsness
  Coffee grams used: $brewCoffeeGrams
  Water weight: $brewWaterGrams
  Water temp: $brewWaterTemp
  Total brew tine: $brewTotalTime
  Brew Notes: $brewNotes
  isPublic: $isPublic
  ''';
    }

}
