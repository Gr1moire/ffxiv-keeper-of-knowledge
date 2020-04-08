class XIVAPISearchResults {
  Pagination pagination;
  List<Results> results;

  XIVAPISearchResults({this.pagination, this.results});

  XIVAPISearchResults.fromJson(Map<String, dynamic> json) {
    pagination = json['Pagination'] != null
        ? new Pagination.fromJson(json['Pagination'])
        : null;
    if (json['Results'] != null) {
      results = new List<Results>();
      json['Results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['Pagination'] = this.pagination.toJson();
    }
    if (this.results != null) {
      data['Results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int page;
  int pageNext;
  int pagePrev;
  int pageTotal;
  int results;
  int resultsPerPage;
  int resultsTotal;

  Pagination(
      {this.page,
      this.pageNext,
      this.pagePrev,
      this.pageTotal,
      this.results,
      this.resultsPerPage,
      this.resultsTotal});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['Page'];
    pageNext = json['PageNext'];
    pagePrev = json['PagePrev'];
    pageTotal = json['PageTotal'];
    results = json['Results'];
    resultsPerPage = json['ResultsPerPage'];
    resultsTotal = json['ResultsTotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Page'] = this.page;
    data['PageNext'] = this.pageNext;
    data['PagePrev'] = this.pagePrev;
    data['PageTotal'] = this.pageTotal;
    data['Results'] = this.results;
    data['ResultsPerPage'] = this.resultsPerPage;
    data['ResultsTotal'] = this.resultsTotal;
    return data;
  }
}

class Results {
  String context;
  Data data;
  String source;
  var sourceID;
  String text;

  Results({this.context, this.data, this.source, this.sourceID, this.text});

  Results.fromJson(Map<String, dynamic> json) {
    context = json['Context'];
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    source = json['Source'];
    sourceID = json['SourceID'];
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Context'] = this.context;
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    data['Source'] = this.source;
    data['SourceID'] = this.sourceID;
    data['Text'] = this.text;
    return data;
  }
}

class Data {
  int gamePatchID;
  int iD;
  String icon;
  String name;
  var nameCn;
  var nameDe;
  var nameEn;
  var nameFr;
  var nameJa;
  var nameKr;
  var url;

  Data(
      {this.gamePatchID,
      this.iD,
      this.icon,
      this.name,
      this.nameCn,
      this.nameDe,
      this.nameEn,
      this.nameFr,
      this.nameJa,
      this.nameKr,
      this.url});

  Data.fromJson(Map<String, dynamic> json) {
    gamePatchID = json['GamePatchID'];
    iD = json['ID'];
    icon = json['Icon'];
    name = json['Name'];
    nameCn = json['Name_cn'];
    nameDe = json['Name_de'];
    nameEn = json['Name_en'];
    nameFr = json['Name_fr'];
    nameJa = json['Name_ja'];
    nameKr = json['Name_kr'];
    url = json['Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GamePatchID'] = this.gamePatchID;
    data['ID'] = this.iD;
    data['Icon'] = this.icon;
    data['Name'] = this.name;
    data['Name_cn'] = this.nameCn;
    data['Name_de'] = this.nameDe;
    data['Name_en'] = this.nameEn;
    data['Name_fr'] = this.nameFr;
    data['Name_ja'] = this.nameJa;
    data['Name_kr'] = this.nameKr;
    data['Url'] = this.url;
    return data;
  }
}