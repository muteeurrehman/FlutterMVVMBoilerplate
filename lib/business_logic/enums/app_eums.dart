enum APIEndPoint {
  birds;

  @override
  toString() {
    switch (this) {
      case APIEndPoint.birds:
        return "birds";
        
      default:
        return "";
    }
  }
}
