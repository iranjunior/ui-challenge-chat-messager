extension CustomDateTimeFormat on DateTime {
  
  String toFormatHourAndMinutes() {
    return '${this.hour < 10 ? '0${this.hour}': this.hour}:${this.minute < 10 ? '0${this.minute}': this.minute}';
  }
}
