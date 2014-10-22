class TimeStamp {
  
  public TimeStamp()
  {
  }
  String getTimestamp(String separator)
  {
    String[] time_stamp = new String[2];
    time_stamp[0] = getDate(separator);
    time_stamp[1] = getTime(separator);
    String unique_id = join(time_stamp, separator); 
    return unique_id;
  }
  
  String getDate(String separator)
  {
    String[] today = new String[3];
    int d = day();
    int m = month();
    int y = year();
    today[0] = String.valueOf(y);
    today[1] = String.valueOf(m);
    today[2] = String.valueOf(d);
    String stamp = join(today,separator);
    return stamp;
  }
  
  String getTime(String separator)
  {
    String[] curr_time = new String[3];
    int sec = second();
    int min = minute();
    int hr = hour();
    curr_time[0] = String.valueOf(hr); 
    curr_time[1] = String.valueOf(min); 
    curr_time[2] = String.valueOf(sec);
    String time = join(curr_time,separator);
    return time;
  }
  
}
