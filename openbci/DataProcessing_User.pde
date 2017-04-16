
//------------------------------------------------------------------------
//                       Global Variables & Instances
//------------------------------------------------------------------------
import java.io.FileWriter;  

DataProcessing_User dataProcessing_user;
boolean drawEMG = false; //if true... toggles on EEG_Processing_User.draw and toggles off the headplot in Gui_Manager
boolean drawAccel = false;
boolean drawPulse = false;
boolean drawFFT = true;
boolean drawBionics = false;
boolean drawHead = true;


String oldCommand = "";
boolean hasGestured = false;

//------------------------------------------------------------------------
//                            Classes
//------------------------------------------------------------------------

class DataProcessing_User {
  private float fs_Hz;  //sample rate
  private int n_chan;
  boolean check = true;
  boolean switchesActive = false;
  
  

  Button leftConfig = new Button(3*(width/4) - 65,height/4 - 120,20,20,"\\/",fontInfo.buttonLabel_size);
  Button midConfig = new Button(3*(width/4) + 63,height/4 - 120,20,20,"\\/",fontInfo.buttonLabel_size);
  Button rightConfig = new Button(3*(width/4) + 190,height/4 - 120,20,20,"\\/",fontInfo.buttonLabel_size);



  //class constructor
  DataProcessing_User(int NCHAN, float sample_rate_Hz) {
    n_chan = NCHAN;
    fs_Hz = sample_rate_Hz;
  }

  //add some functions here...if you'd like

  //here is the processing routine called by the OpenBCI main program...update this with whatever you'd like to do
  public void process(float[][] data_newest_uV, //holds raw bio data that is new since the last call
    float[][] data_long_uV, //holds a longer piece of buffered EEG data, of same length as will be plotted on the screen
    float[][] data_forDisplay_uV, //this data has been filtered and is ready for plotting on the screen
    FFT[] fftData) {              //holds the FFT (frequency spectrum) of the latest data

    //for example, you could loop over each EEG channel to do some sort of time-domain processing
    //using the sample values that have already been filtered, as will be plotted on the display
    float EEG_value_uV;
    
      int Ichan1 = 1;
      int Ichan2 = 3;
      int Ichan3 = 5;
      int Ichan4 = 7;
      
      
float[] finalfft1 = new float[fftData[Ichan1].specSize()];
float[] finalfft2 = new float[fftData[Ichan2].specSize()];
float[] finalfft3 = new float[fftData[Ichan3].specSize()];
float[] finalfft4 = new float[fftData[Ichan4].specSize()];


 for (int I=0; I < fftData[Ichan1].specSize(); I++) {
        finalfft1[I] = fftData[Ichan1].getBand(I);  // get spectrum of a particular channel 1
         finalfft2[I] = fftData[Ichan2].getBand(I);  // get spectrum of a particular channel 1  
           finalfft3[I] = fftData[Ichan3].getBand(I);  // get spectrum of a particular channel 1
           finalfft4[I] = fftData[Ichan4].getBand(I);  // get spectrum of a particular channel 1
      }
     
     float[] fftdata1 = Arrays.copyOfRange(finalfft1, 0, 30);
     
     float[] fftdata3 = Arrays.copyOfRange(finalfft2, 0, 30);
     
     float[] fftdata5 = Arrays.copyOfRange(finalfft3, 0, 30);
     
     float[] fftdata7 = Arrays.copyOfRange(finalfft4, 0, 30);


       String output1 = Arrays.toString(fftdata1);
        sendRawData_dataPacket(output1);
   
     
      String output2 = Arrays.toString(fftdata3);
       sendRawData_dataPacket(output2);
       
     
       String output3 = Arrays.toString(fftdata5);  
       sendRawData_dataPacket(output3);
       
       String output4 = Arrays.toString(fftdata7);  
       sendRawData_dataPacket(output4);
      
 
 
     }    
 


    

  }