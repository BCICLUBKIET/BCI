char incomingByte ;  // for incoming serial data

int pin5 = 8;
int pin6 = 9;
int pin10 = 3;
int pin11 = 4;
int i= 4;
void setup() {
  Serial.begin(2400);
   pinMode(pin5, OUTPUT);
   pinMode(pin6, OUTPUT);
   pinMode(pin10, OUTPUT);
   pinMode(pin11, OUTPUT);
    
  
    // opens serial port, sets data rate to 9600 bps
}



void loop() {
  // send data only when you receive data:

if(i==1)
{
  digitalWrite(pin6,LOW);
  digitalWrite(pin11,LOW);
 digitalWrite(pin5, HIGH);
 digitalWrite(pin10, HIGH);
  delayMicroseconds(275);   
  digitalWrite(pin5, LOW); 
  digitalWrite(pin10, LOW);
  delayMicroseconds(725);
  
  }

  if(i==2)
{
  digitalWrite(pin6,LOW);
  digitalWrite(pin11,LOW);
  digitalWrite(pin10, LOW);
 digitalWrite(pin5, HIGH); 
  delayMicroseconds(275);   
  digitalWrite(pin5, LOW); 
   delayMicroseconds(725);
  
  }

    if(i==3)
{
  digitalWrite(pin5,LOW);
  digitalWrite(pin6,LOW);
  digitalWrite(pin11, LOW);
 digitalWrite(pin10, HIGH); 
  delayMicroseconds(275);   
  digitalWrite(pin10, LOW); 
   delayMicroseconds(725);
  
  }
 
  if(i==4)
{
  digitalWrite(pin6,LOW);
  digitalWrite(pin11,LOW);
 digitalWrite(pin5, LOW);
 digitalWrite(pin10,LOW);
 
  }


  
 Serial.flush();
  if (Serial.available() > 0) {
    // read the incoming byte:
    incomingByte = Serial.read();   
   
    if(incomingByte == 'W')
    {
     i=1;
      }
     else 
      if(incomingByte == 'D')
      {
        i=2;
        }
        else
      if(incomingByte == 'A')
      {
        i=3;       
        } 
      
        else 
        if(incomingByte == 'S')
        {
         i=4;      
          }
        else
        {
          Serial.write("Unknown Symbol\n");
         
          }
  }

}

