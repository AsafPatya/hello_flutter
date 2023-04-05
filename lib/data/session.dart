class Session{
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  Session(this.id, this.date, this.description, this.duration);

  Session.fromJson(Map<String, dynamic> sessionMap){
    this.id = sessionMap['id'] ?? 0;
    this.date = sessionMap['date'] ?? '';
    this.description = sessionMap['description'] ?? '';
    this.duration = sessionMap['duration'] ?? 0;
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration
    };
  }
}