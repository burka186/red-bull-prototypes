/*
Manuel Gonzalez
www.codingcolor.com
Processing Photo Booth v.1.0
*/
import processing.video.*;


Capture webcam;
PImage capture_img;
TextField tField;
Timer save_msg_timer;
TimeStamp timeStamp;

int video_width;
int video_height;

boolean render_cam;
boolean render_capture;
boolean render_textfield;
boolean app_saving;

String folder_path  = "images/photo_booth/Screen_Shot";
String file_format  = ".jpg";
int TIMER_DURATION = 1500;

void setup()
{
  size(1280,500);
  smooth();
  
  video_width = 640;
  video_height = 480;
  
  webcam = new Capture(this, video_width, video_height, 30);
  
  capture_img = new PImage(video_width, video_height);
  
  tField = new TextField("Press the c key to capture image.",width/2,496,18,255);
  
  timeStamp = new TimeStamp();
  
  save_msg_timer = new Timer(TIMER_DURATION);
  render_cam = true;
  render_textfield = true;
  app_saving = false;
  
  webcam.start();
}

void draw()
{
  background(0);
  renderCam();
  renderCapture();
  renderTextField();
  renderSaveTimer();
  
}
void keyReleased()
{
  switch(key){
    case 'c':
    captureCam();
    break;
    case 's':
    if(render_capture)
    {
    saveImage();
    }

    break;
    case 'v':
    
     restartCam();
     tField.setMsg("Press the 'c' key to capture image.");
    break;
    default:
    break;
  }
}
void captureCam()
{
  if(render_capture)
  {
    return;
  }
  println("capture image");
  capture_img = webcam.get();
  render_cam = false;
  webcam.stop();
  render_capture = true;
  tField.setMsg("Press 's' key to save, Press 'v' key to return to video.");
}
void saveImage()
{
  if(app_saving)
  {
    return;
  }
  println("save image");
  
  tField.setMsg("SAVING...");
  save_msg_timer.start();
  app_saving = true;
  
  String[] sFile = new String[3];
  sFile[0] = folder_path;
  sFile[1] = timeStamp.getTimestamp("_");
  sFile[2] = file_format;
  String save_path = join(sFile, "_"); 
  
  println(save_path);
  
  capture_img.save(save_path);
  restartCam();
  
}
void restartCam()
{
  
  if(render_cam)
  {
    return;
  }
  
  println("restart cam");
  render_capture = false;
  webcam.start();
  render_cam = true;
}
void renderCapture()
{
  if(render_capture){
    
    image(capture_img,0,0);
    webcam.start();
    image(webcam,width/2,0);
  }
}
void renderTextField()
{
  if(render_textfield)
  {
    tField.display();
  }

}
void renderCam()
{
 if(webcam.available())
  {
    webcam.read(); 
  }
  
  if(render_cam)
  {
        image(webcam,width/2,0);
  }
  
}
void renderSaveTimer()
{
  if(app_saving)
  {
    if(save_msg_timer.isFinished())
    {
      app_saving = false;
      tField.setMsg("Press the 'c' key to capture image.");
    }
  }
}
