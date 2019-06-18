#include "MikromediaGreenhouseProject_objects.h"
#include "MikromediaGreenhouseProject_resources.h"
#include "built_in.h"

// Extern memory interface
// MMC/SD Connections
sbit Mmc_Chip_Select           at GPIOD_ODR.B3;
// end of MMC/SD
// TFT Get Data globals
unsigned long currentSector = -1, res_file_size;
// end of TFT Get Data
// End of extern memory interface


// TFT module connections
sbit TFT_BLED at GPIOF_ODR.B10;
sbit TFT_CS at GPIOF_ODR.B13;
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_RD at GPIOF_ODR.B12;
sbit TFT_RS at GPIOF_ODR.B15;
sbit TFT_RST at GPIOF_ODR.B14;
sbit TFT_WR at GPIOF_ODR.B11;
// End TFT module connections


// Global variables
unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton *local_button;
TButton *exec_button;
int button_order;
TButton_Round *local_round_button;
TButton_Round *exec_round_button;
int round_button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TCircle *local_circle;
TCircle *exec_circle;
int circle_order;
TProgressBar *local_progress_bar;
TProgressBar *exec_progress_bar;
int progress_bar_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
  unsigned int temp;
  temp = GPIOE_ODR;
  temp &= 0x00FF;
  GPIOE_ODR = temp | (_hi << 8);
  temp = GPIOG_ODR;
  temp &= 0xFF00;
  GPIOG_ODR = temp | _lo;
}

void Set_Index(unsigned short index) {
  TFT_RS = 0;
  Write_to_Data_Lines(0, index);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
  TFT_RS = 1;
  Write_to_Data_Lines(0, cmd);
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
  TFT_RS = 1;
  Write_to_Data_Lines(Hi(_data), Lo(_data));
  TFT_WR = 0;
  asm nop;
  TFT_WR = 1;
}


char* TFT_Get_Data(unsigned long offset, unsigned long count, unsigned long *num) {
unsigned long start_sector;
unsigned int fpos;

  start_sector = Mmc_Get_File_Write_Sector() + offset/512;
  fpos = (unsigned long)offset%512;

  if(start_sector == currentSector+1) {
    Mmc_Multi_Read_Sector(f16_sector.fSect);
    currentSector = start_sector;
  } else if (start_sector != currentSector) {
    if(currentSector != -1)
      Mmc_Multi_Read_Stop();
    Mmc_Multi_Read_Start(start_sector);
    Mmc_Multi_Read_Sector(f16_sector.fSect);
    currentSector = start_sector;
  }

  if(count>512-fpos)
    *num = 512-fpos;
  else
    *num = count;

  return f16_sector.fSect+fpos;
}
static void InitializeTouchPanel() {
  TFT_Set_Active(Set_Index, Write_Command, Write_Data);
  TFT_Init_SSD1963(800, 480);
  TFT_Set_Ext_Buffer(TFT_Get_Data);

  TFT_Set_DBC_SSD1963(255);

  PenDown = 0;
  PressedObject = 0;
  PressedObjectType = -1;
}


/////////////////////////
  TScreen*  CurrentScreen;

  TScreen                Screen1;
  TImage               Image2;
  TImage               Image4;
  TLabel                 temperature_label;
char temperature_label_Caption[1] = "";

  TLabel                 Label1;
char Label1_Caption[12] = "Temperature";

  TLabel                 Label2;
char Label2_Caption[9] = "Humidity";

  TLabel                 humidity_label;
char humidity_label_Caption[1] = "";

  TLabel                 Label3;
char Label3_Caption[3] = "UV";

  TLabel                 uv_label;
char uv_label_Caption[1] = "";

  TLabel                 Label4;
char Label4_Caption[9] = "UV index";

  TLabel                 Label5;
char Label5_Caption[8] = "      C";

  TLabel                 Label6;
char Label6_Caption[2] = "%";

  TLabel                 Label10;
char Label10_Caption[1] = "";

  TCircle                Circle1;
  TButton_Round          ButtonRound1;
char ButtonRound1_Caption[8] = "control";

  TImage               Image6;
  TImage               Image7;
  TImage               Image8;
  TImage               Image9;
  TButton_Round          * const code Screen1_Buttons_Round[1]=
         {
         &ButtonRound1         
         };
  TLabel                 * const code Screen1_Labels[10]=
         {
         &temperature_label,   
         &Label1,              
         &Label2,              
         &humidity_label,      
         &Label3,              
         &uv_label,            
         &Label4,              
         &Label5,              
         &Label6,              
         &Label10              
         };
  TImage                 * const code Screen1_Images[6]=
         {
         &Image2,              
         &Image4,              
         &Image6,              
         &Image7,              
         &Image8,              
         &Image9               
         };
  TCircle                * const code Screen1_Circles[1]=
         {
         &Circle1              
         };

  TScreen                Screen2;
  TImage               Image10;
  TImage               Image3;
  TProgressBar                 ProgressBar1;
char ProgressBar1_Caption[6] = "90";

  TButton               servo_position_button_2;
char servo_position_button_2_Caption[1] = "";

  TButton               servo_position_button_1;
char servo_position_button_1_Caption[1] = "";

  TImage               Image5;
  TButton               servo_number_button_1;
char servo_number_button_1_Caption[2] = "1";

  TButton               servo_number_button_2;
char servo_number_button_2_Caption[2] = "2";

  TButton               servo_number_button_4;
char servo_number_button_4_Caption[2] = "4";

  TButton               servo_number_button_6;
char servo_number_button_6_Caption[2] = "6";

  TButton               servo_number_button_5;
char servo_number_button_5_Caption[2] = "5";

  TButton               servo_number_button_7;
char servo_number_button_7_Caption[2] = "7";

  TButton               servo_number_button_8;
char servo_number_button_8_Caption[2] = "8";

  TButton               servo_number_button_9;
char servo_number_button_9_Caption[2] = "9";

  TButton               servo_number_button_10;
char servo_number_button_10_Caption[3] = "10";

  TButton               servo_number_button_11;
char servo_number_button_11_Caption[3] = "11";

  TButton               servo_number_button_12;
char servo_number_button_12_Caption[3] = "12";

  TButton               servo_number_button_13;
char servo_number_button_13_Caption[3] = "13";

  TButton               servo_number_button_14;
char servo_number_button_14_Caption[3] = "14";

  TButton               servo_number_button_15;
char servo_number_button_15_Caption[3] = "15";

  TButton               servo_number_button_16;
char servo_number_button_16_Caption[3] = "16";

  TButton               servo_number_button_3;
char servo_number_button_3_Caption[2] = "3";

  TButton               servo_number_button_all;
char servo_number_button_all_Caption[4] = "all";

  TButton               servo_position_button_3;
char servo_position_button_3_Caption[1] = "";

  TButton               servo_position_button_4;
char servo_position_button_4_Caption[1] = "";

  TButton               servo_position_button_5;
char servo_position_button_5_Caption[1] = "";

  TButton               servo_position_button_6;
char servo_position_button_6_Caption[1] = "";

  TButton               servo_position_button_7;
char servo_position_button_7_Caption[1] = "";

  TButton               servo_position_button_8;
char servo_position_button_8_Caption[1] = "";

  TButton               servo_position_button_9;
char servo_position_button_9_Caption[1] = "";

  TButton               fan_speed_button_1;
char fan_speed_button_1_Caption[2] = "1";

  TButton               fan_speed_button_3;
char fan_speed_button_3_Caption[2] = "3";

  TButton               fan_speed_button_5;
char fan_speed_button_5_Caption[2] = "5";

  TButton               fan_speed_button_stop;
char fan_speed_button_stop_Caption[5] = "stop";

  TLabel                 Label7;
char Label7_Caption[13] = "SERVO NUMBER";

  TLabel                 Label8;
char Label8_Caption[15] = "SERVO POSITION";

  TLabel                 Label9;
char Label9_Caption[10] = "FAN SPEED";

  TButton               fan_speed_button_7;
char fan_speed_button_7_Caption[2] = "7";

  TButton_Round          ButtonRound2;
char ButtonRound2_Caption[5] = "data";

  TButton               fan_speed_button_2;
char fan_speed_button_2_Caption[2] = "2";

  TButton               fan_speed_button_4;
char fan_speed_button_4_Caption[2] = "4";

  TButton               fan_speed_button_6;
char fan_speed_button_6_Caption[2] = "6";

  TButton                * const code Screen2_Buttons[34]=
         {
         &servo_position_button_2,
         &servo_position_button_1,
         &servo_number_button_1,
         &servo_number_button_2,
         &servo_number_button_4,
         &servo_number_button_6,
         &servo_number_button_5,
         &servo_number_button_7,
         &servo_number_button_8,
         &servo_number_button_9,
         &servo_number_button_10,
         &servo_number_button_11,
         &servo_number_button_12,
         &servo_number_button_13,
         &servo_number_button_14,
         &servo_number_button_15,
         &servo_number_button_16,
         &servo_number_button_3,
         &servo_number_button_all,
         &servo_position_button_3,
         &servo_position_button_4,
         &servo_position_button_5,
         &servo_position_button_6,
         &servo_position_button_7,
         &servo_position_button_8,
         &servo_position_button_9,
         &fan_speed_button_1,  
         &fan_speed_button_3,  
         &fan_speed_button_5,  
         &fan_speed_button_stop,
         &fan_speed_button_7,  
         &fan_speed_button_2,  
         &fan_speed_button_4,  
         &fan_speed_button_6   
         };
  TButton_Round          * const code Screen2_Buttons_Round[1]=
         {
         &ButtonRound2         
         };
  TLabel                 * const code Screen2_Labels[3]=
         {
         &Label7,              
         &Label8,              
         &Label9               
         };
  TImage                 * const code Screen2_Images[3]=
         {
         &Image10,             
         &Image3,              
         &Image5               
         };
  TProgressBar           * const code Screen2_ProgressBars[1]=
         {
         &ProgressBar1         
         };

  TScreen                Screen3;
  TImage               Image1;
  TImage                 * const code Screen3_Images[1]=
         {
         &Image1               
         };



static void InitializeObjects() {
  Screen1.Color                     = 0x0000;
  Screen1.Width                     = 800;
  Screen1.Height                    = 480;
  Screen1.ButtonsCount              = 0;
  Screen1.Buttons_RoundCount        = 1;
  Screen1.Buttons_Round             = Screen1_Buttons_Round;
  Screen1.LabelsCount               = 10;
  Screen1.Labels                    = Screen1_Labels;
  Screen1.ImagesCount               = 6;
  Screen1.Images                    = Screen1_Images;
  Screen1.CirclesCount              = 1;
  Screen1.Circles                   = Screen1_Circles;
  Screen1.ProgressBarsCount         = 0;
  Screen1.ObjectsCount              = 18;

  Screen2.Color                     = 0x0000;
  Screen2.Width                     = 800;
  Screen2.Height                    = 480;
  Screen2.ButtonsCount              = 34;
  Screen2.Buttons                   = Screen2_Buttons;
  Screen2.Buttons_RoundCount        = 1;
  Screen2.Buttons_Round             = Screen2_Buttons_Round;
  Screen2.LabelsCount               = 3;
  Screen2.Labels                    = Screen2_Labels;
  Screen2.ImagesCount               = 3;
  Screen2.Images                    = Screen2_Images;
  Screen2.CirclesCount              = 0;
  Screen2.ProgressBarsCount         = 1;
  Screen2.ProgressBars              = Screen2_ProgressBars;
  Screen2.ObjectsCount              = 42;

  Screen3.Color                     = 0x0000;
  Screen3.Width                     = 800;
  Screen3.Height                    = 480;
  Screen3.ButtonsCount              = 0;
  Screen3.Buttons_RoundCount        = 0;
  Screen3.LabelsCount               = 0;
  Screen3.ImagesCount               = 1;
  Screen3.Images                    = Screen3_Images;
  Screen3.CirclesCount              = 0;
  Screen3.ProgressBarsCount         = 0;
  Screen3.ObjectsCount              = 1;


  Image2.OwnerScreen     = &Screen1;
  Image2.Order           = 0;
  Image2.Left            = 0;
  Image2.Top             = 0;
  Image2.Width           = 800;
  Image2.Height          = 480;
  Image2.Picture_Type    = 0;
  Image2.Picture_Ratio   = 1;
  Image2.Picture_Name    = Greenhouse7800x480bmpv2_bmp;
  Image2.Visible         = 1;
  Image2.Active          = 1;

  Image4.OwnerScreen     = &Screen1;
  Image4.Order           = 1;
  Image4.Left            = 590;
  Image4.Top             = 405;
  Image4.Width           = 210;
  Image4.Height          = 75;
  Image4.Picture_Type    = 0;
  Image4.Picture_Ratio   = 1;
  Image4.Picture_Name    = Greenhouse7800x480bmpbuttoncrop1_bmp;
  Image4.Visible         = 1;
  Image4.Active          = 1;

  temperature_label.OwnerScreen     = &Screen1;
  temperature_label.Order           = 2;
  temperature_label.Left            = 500;
  temperature_label.Top             = 70;
  temperature_label.Width           = 0;
  temperature_label.Height          = 0;
  temperature_label.Visible         = 1;
  temperature_label.Active          = 1;
  temperature_label.Caption         = temperature_label_Caption;
  temperature_label.FontName        = Tahoma48x48_Bold;
  temperature_label.Font_Color      = 0xFFFF;
  temperature_label.VerticalText    = 0;

  Label1.OwnerScreen     = &Screen1;
  Label1.Order           = 3;
  Label1.Left            = 50;
  Label1.Top             = 20;
  Label1.Width           = 281;
  Label1.Height          = 53;
  Label1.Visible         = 1;
  Label1.Active          = 1;
  Label1.Caption         = Label1_Caption;
  Label1.FontName        = Tahoma48x48_BoldItalic;
  Label1.Font_Color      = 0x07E0;
  Label1.VerticalText    = 0;

  Label2.OwnerScreen     = &Screen1;
  Label2.Order           = 4;
  Label2.Left            = 50;
  Label2.Top             = 80;
  Label2.Width           = 202;
  Label2.Height          = 53;
  Label2.Visible         = 1;
  Label2.Active          = 1;
  Label2.Caption         = Label2_Caption;
  Label2.FontName        = Tahoma48x48_BoldItalic;
  Label2.Font_Color      = 0x07E0;
  Label2.VerticalText    = 0;

  humidity_label.OwnerScreen     = &Screen1;
  humidity_label.Order           = 5;
  humidity_label.Left            = 500;
  humidity_label.Top             = 150;
  humidity_label.Width           = 0;
  humidity_label.Height          = 0;
  humidity_label.Visible         = 1;
  humidity_label.Active          = 1;
  humidity_label.Caption         = humidity_label_Caption;
  humidity_label.FontName        = Tahoma48x48_Bold;
  humidity_label.Font_Color      = 0xFFFF;
  humidity_label.VerticalText    = 0;

  Label3.OwnerScreen     = &Screen1;
  Label3.Order           = 6;
  Label3.Left            = 50;
  Label3.Top             = 140;
  Label3.Width           = 72;
  Label3.Height          = 53;
  Label3.Visible         = 1;
  Label3.Active          = 1;
  Label3.Caption         = Label3_Caption;
  Label3.FontName        = Tahoma48x48_BoldItalic;
  Label3.Font_Color      = 0x07E0;
  Label3.VerticalText    = 0;

  uv_label.OwnerScreen     = &Screen1;
  uv_label.Order           = 7;
  uv_label.Left            = 500;
  uv_label.Top             = 230;
  uv_label.Width           = 0;
  uv_label.Height          = 0;
  uv_label.Visible         = 1;
  uv_label.Active          = 1;
  uv_label.Caption         = uv_label_Caption;
  uv_label.FontName        = Tahoma48x48_Bold;
  uv_label.Font_Color      = 0xFFFF;
  uv_label.VerticalText    = 0;

  Label4.OwnerScreen     = &Screen1;
  Label4.Order           = 8;
  Label4.Left            = 51;
  Label4.Top             = 200;
  Label4.Width           = 198;
  Label4.Height          = 53;
  Label4.Visible         = 1;
  Label4.Active          = 1;
  Label4.Caption         = Label4_Caption;
  Label4.FontName        = Tahoma48x48_BoldItalic;
  Label4.Font_Color      = 0x07E0;
  Label4.VerticalText    = 0;

  Label5.OwnerScreen     = &Screen1;
  Label5.Order           = 9;
  Label5.Left            = 700;
  Label5.Top             = 25;
  Label5.Width           = 113;
  Label5.Height          = 53;
  Label5.Visible         = 1;
  Label5.Active          = 1;
  Label5.Caption         = Label5_Caption;
  Label5.FontName        = Tahoma48x48_Bold;
  Label5.Font_Color      = 0x07E0;
  Label5.VerticalText    = 0;

  Label6.OwnerScreen     = &Screen1;
  Label6.Order           = 10;
  Label6.Left            = 700;
  Label6.Top             = 80;
  Label6.Width           = 63;
  Label6.Height          = 53;
  Label6.Visible         = 1;
  Label6.Active          = 1;
  Label6.Caption         = Label6_Caption;
  Label6.FontName        = Tahoma48x48_Bold;
  Label6.Font_Color      = 0x07E0;
  Label6.VerticalText    = 0;

  Label10.OwnerScreen     = &Screen1;
  Label10.Order           = 11;
  Label10.Left            = 500;
  Label10.Top             = 310;
  Label10.Width           = 0;
  Label10.Height          = 0;
  Label10.Visible         = 1;
  Label10.Active          = 1;
  Label10.Caption         = Label10_Caption;
  Label10.FontName        = Tahoma48x48_Bold;
  Label10.Font_Color      = 0xFFFF;
  Label10.VerticalText    = 0;

  Circle1.OwnerScreen     = &Screen1;
  Circle1.Order           = 12;
  Circle1.Left            = 705;
  Circle1.Top             = 35;
  Circle1.Radius          = 6;
  Circle1.Pen_Width       = 4;
  Circle1.Pen_Color       = 0x07E0;
  Circle1.Visible         = 1;
  Circle1.Active          = 1;
  Circle1.Transparent     = 0;
  Circle1.Gradient        = 0;
  Circle1.Gradient_Orientation = 0;
  Circle1.Gradient_Start_Color = 0xFFFF;
  Circle1.Gradient_End_Color = 0xC618;
  Circle1.Color           = 0x07E0;
  Circle1.PressColEnabled = 1;
  Circle1.Press_Color     = 0xE71C;

  ButtonRound1.OwnerScreen     = &Screen1;
  ButtonRound1.Order           = 13;
  ButtonRound1.Left            = 600;
  ButtonRound1.Top             = 415;
  ButtonRound1.Width           = 191;
  ButtonRound1.Height          = 55;
  ButtonRound1.Pen_Width       = 6;
  ButtonRound1.Pen_Color       = 0x07E0;
  ButtonRound1.Visible         = 1;
  ButtonRound1.Active          = 1;
  ButtonRound1.Transparent     = 0;
  ButtonRound1.Caption         = ButtonRound1_Caption;
  ButtonRound1.TextAlign       = _taCenter;
  ButtonRound1.TextAlignVertical= _tavMiddle;
  ButtonRound1.FontName        = Tahoma39x48_Regular;
  ButtonRound1.PressColEnabled = 1;
  ButtonRound1.Font_Color      = 0x07E0;
  ButtonRound1.VerticalText    = 0;
  ButtonRound1.Gradient        = 0;
  ButtonRound1.Gradient_Orientation = 0;
  ButtonRound1.Gradient_Start_Color = 0xFFFF;
  ButtonRound1.Gradient_End_Color = 0xC618;
  ButtonRound1.Color           = 0xC618;
  ButtonRound1.Press_Color     = 0x0000;
  ButtonRound1.Corner_Radius   = 10;
  ButtonRound1.OnClickPtr      = ButtonRound1OnClick;

  Image6.OwnerScreen     = &Screen1;
  Image6.Order           = 14;
  Image6.Left            = 500;
  Image6.Top             = 20;
  Image6.Width           = 110;
  Image6.Height          = 50;
  Image6.Picture_Type    = 0;
  Image6.Picture_Ratio   = 1;
  Image6.Picture_Name    = Greenhouse7800x480bmpv2slice1_bmp;
  Image6.Visible         = 1;
  Image6.Active          = 1;

  Image7.OwnerScreen     = &Screen1;
  Image7.Order           = 15;
  Image7.Left            = 500;
  Image7.Top             = 80;
  Image7.Width           = 110;
  Image7.Height          = 50;
  Image7.Picture_Type    = 0;
  Image7.Picture_Ratio   = 1;
  Image7.Picture_Name    = Greenhouse7800x480bmpv2slice2_bmp;
  Image7.Visible         = 1;
  Image7.Active          = 1;

  Image8.OwnerScreen     = &Screen1;
  Image8.Order           = 16;
  Image8.Left            = 500;
  Image8.Top             = 140;
  Image8.Width           = 110;
  Image8.Height          = 50;
  Image8.Picture_Type    = 0;
  Image8.Picture_Ratio   = 1;
  Image8.Picture_Name    = Greenhouse7800x480bmpv2slice3_bmp;
  Image8.Visible         = 1;
  Image8.Active          = 1;

  Image9.OwnerScreen     = &Screen1;
  Image9.Order           = 17;
  Image9.Left            = 500;
  Image9.Top             = 200;
  Image9.Width           = 110;
  Image9.Height          = 50;
  Image9.Picture_Type    = 0;
  Image9.Picture_Ratio   = 1;
  Image9.Picture_Name    = Greenhouse7800x480bmpv2slice4_bmp;
  Image9.Visible         = 1;
  Image9.Active          = 1;

  Image10.OwnerScreen     = &Screen2;
  Image10.Order           = 0;
  Image10.Left            = 40;
  Image10.Top             = 180;
  Image10.Width           = 720;
  Image10.Height          = 50;
  Image10.Picture_Type    = 0;
  Image10.Picture_Ratio   = 1;
  Image10.Picture_Name    = Greenhouse7800x480bmpv3crop1_bmp;
  Image10.Visible         = 1;
  Image10.Active          = 1;

  Image3.OwnerScreen     = &Screen2;
  Image3.Order           = 1;
  Image3.Left            = 0;
  Image3.Top             = 0;
  Image3.Width           = 800;
  Image3.Height          = 480;
  Image3.Picture_Type    = 0;
  Image3.Picture_Ratio   = 1;
  Image3.Picture_Name    = Greenhouse7800x480bmpv3_bmp;
  Image3.Visible         = 1;
  Image3.Active          = 1;

  ProgressBar1.OwnerScreen     = &Screen2;
  ProgressBar1.Order           = 2;
  ProgressBar1.Left            = 40;
  ProgressBar1.Top             = 180;
  ProgressBar1.Width           = 720;
  ProgressBar1.Height          = 50;
  ProgressBar1.Pen_Width       = 3;
  ProgressBar1.Pen_Color       = 0x07E0;
  ProgressBar1.Visible         = 1;
  ProgressBar1.Transparent     = 0;
  ProgressBar1.Caption         = ProgressBar1_Caption;
  ProgressBar1.FontName        = Tahoma20x21_Bold;
  ProgressBar1.Font_Color      = 0x07E0;
  ProgressBar1.Gradient        = 0;
  ProgressBar1.Gradient_Orientation = 0;
  ProgressBar1.Gradient_Start_Color = 0x07E0;
  ProgressBar1.Gradient_End_Color = 0x07E0;
  ProgressBar1.Color           = 0x07E0;
  ProgressBar1.Background_Color = 0x07E0;
  ProgressBar1.Min             = 10;
  ProgressBar1.Max             = 170;
  ProgressBar1.Position        = 90;
  ProgressBar1.Prev_Position   = 90;
  ProgressBar1.Show_Position   = 1;
  ProgressBar1.Show_Percentage = 0;
  ProgressBar1.Smooth          = 1;
  ProgressBar1.Rounded         = 0;
  ProgressBar1.Corner_Radius   = 1;

  servo_position_button_2.OwnerScreen     = &Screen2;
  servo_position_button_2.Order           = 3;
  servo_position_button_2.Left            = 120;
  servo_position_button_2.Top             = 180;
  servo_position_button_2.Width           = 80;
  servo_position_button_2.Height          = 50;
  servo_position_button_2.Pen_Width       = 0;
  servo_position_button_2.Pen_Color       = 0x07E0;
  servo_position_button_2.Visible         = 0;
  servo_position_button_2.Active          = 1;
  servo_position_button_2.Transparent     = 0;
  servo_position_button_2.Caption         = servo_position_button_2_Caption;
  servo_position_button_2.TextAlign       = _taCenter;
  servo_position_button_2.TextAlignVertical= _tavMiddle;
  servo_position_button_2.FontName        = Tahoma20x21_Bold;
  servo_position_button_2.PressColEnabled = 1;
  servo_position_button_2.Font_Color      = 0x07E0;
  servo_position_button_2.VerticalText    = 0;
  servo_position_button_2.Gradient        = 0;
  servo_position_button_2.Gradient_Orientation = 0;
  servo_position_button_2.Gradient_Start_Color = 0xFFFF;
  servo_position_button_2.Gradient_End_Color = 0xC618;
  servo_position_button_2.Color           = 0x0000;
  servo_position_button_2.Press_Color     = 0x07E0;
  servo_position_button_2.OnClickPtr      = servo_position_button_2OnClick;

  servo_position_button_1.OwnerScreen     = &Screen2;
  servo_position_button_1.Order           = 4;
  servo_position_button_1.Left            = 40;
  servo_position_button_1.Top             = 180;
  servo_position_button_1.Width           = 80;
  servo_position_button_1.Height          = 50;
  servo_position_button_1.Pen_Width       = 0;
  servo_position_button_1.Pen_Color       = 0x07E0;
  servo_position_button_1.Visible         = 0;
  servo_position_button_1.Active          = 1;
  servo_position_button_1.Transparent     = 0;
  servo_position_button_1.Caption         = servo_position_button_1_Caption;
  servo_position_button_1.TextAlign       = _taCenter;
  servo_position_button_1.TextAlignVertical= _tavMiddle;
  servo_position_button_1.FontName        = Tahoma20x21_Bold;
  servo_position_button_1.PressColEnabled = 1;
  servo_position_button_1.Font_Color      = 0x07E0;
  servo_position_button_1.VerticalText    = 0;
  servo_position_button_1.Gradient        = 0;
  servo_position_button_1.Gradient_Orientation = 0;
  servo_position_button_1.Gradient_Start_Color = 0xFFFF;
  servo_position_button_1.Gradient_End_Color = 0xC618;
  servo_position_button_1.Color           = 0x0000;
  servo_position_button_1.Press_Color     = 0x07E0;
  servo_position_button_1.OnClickPtr      = servo_position_button_1OnClick;

  Image5.OwnerScreen     = &Screen2;
  Image5.Order           = 5;
  Image5.Left            = 590;
  Image5.Top             = 405;
  Image5.Width           = 210;
  Image5.Height          = 75;
  Image5.Picture_Type    = 0;
  Image5.Picture_Ratio   = 1;
  Image5.Picture_Name    = Greenhouse7800x480bmpbuttoncrop1_bmp;
  Image5.Visible         = 1;
  Image5.Active          = 1;

  servo_number_button_1.OwnerScreen     = &Screen2;
  servo_number_button_1.Order           = 6;
  servo_number_button_1.Left            = 40;
  servo_number_button_1.Top             = 40;
  servo_number_button_1.Width           = 80;
  servo_number_button_1.Height          = 50;
  servo_number_button_1.Pen_Width       = 3;
  servo_number_button_1.Pen_Color       = 0x07E0;
  servo_number_button_1.Visible         = 1;
  servo_number_button_1.Active          = 1;
  servo_number_button_1.Transparent     = 0;
  servo_number_button_1.Caption         = servo_number_button_1_Caption;
  servo_number_button_1.TextAlign       = _taCenter;
  servo_number_button_1.TextAlignVertical= _tavMiddle;
  servo_number_button_1.FontName        = Tahoma20x21_Bold;
  servo_number_button_1.PressColEnabled = 1;
  servo_number_button_1.Font_Color      = 0x07E0;
  servo_number_button_1.VerticalText    = 0;
  servo_number_button_1.Gradient        = 0;
  servo_number_button_1.Gradient_Orientation = 0;
  servo_number_button_1.Gradient_Start_Color = 0xFFFF;
  servo_number_button_1.Gradient_End_Color = 0xC618;
  servo_number_button_1.Color           = 0x0000;
  servo_number_button_1.Press_Color     = 0x07E0;
  servo_number_button_1.OnClickPtr      = servo_number_button_1OnClick;

  servo_number_button_2.OwnerScreen     = &Screen2;
  servo_number_button_2.Order           = 7;
  servo_number_button_2.Left            = 120;
  servo_number_button_2.Top             = 40;
  servo_number_button_2.Width           = 80;
  servo_number_button_2.Height          = 50;
  servo_number_button_2.Pen_Width       = 3;
  servo_number_button_2.Pen_Color       = 0x07E0;
  servo_number_button_2.Visible         = 1;
  servo_number_button_2.Active          = 1;
  servo_number_button_2.Transparent     = 0;
  servo_number_button_2.Caption         = servo_number_button_2_Caption;
  servo_number_button_2.TextAlign       = _taCenter;
  servo_number_button_2.TextAlignVertical= _tavMiddle;
  servo_number_button_2.FontName        = Tahoma20x21_Bold;
  servo_number_button_2.PressColEnabled = 1;
  servo_number_button_2.Font_Color      = 0x07E0;
  servo_number_button_2.VerticalText    = 0;
  servo_number_button_2.Gradient        = 0;
  servo_number_button_2.Gradient_Orientation = 0;
  servo_number_button_2.Gradient_Start_Color = 0xFFFF;
  servo_number_button_2.Gradient_End_Color = 0xC618;
  servo_number_button_2.Color           = 0x0000;
  servo_number_button_2.Press_Color     = 0x07E0;
  servo_number_button_2.OnClickPtr      = servo_number_button_2OnClick;

  servo_number_button_4.OwnerScreen     = &Screen2;
  servo_number_button_4.Order           = 8;
  servo_number_button_4.Left            = 281;
  servo_number_button_4.Top             = 40;
  servo_number_button_4.Width           = 80;
  servo_number_button_4.Height          = 50;
  servo_number_button_4.Pen_Width       = 3;
  servo_number_button_4.Pen_Color       = 0x07E0;
  servo_number_button_4.Visible         = 1;
  servo_number_button_4.Active          = 1;
  servo_number_button_4.Transparent     = 0;
  servo_number_button_4.Caption         = servo_number_button_4_Caption;
  servo_number_button_4.TextAlign       = _taCenter;
  servo_number_button_4.TextAlignVertical= _tavMiddle;
  servo_number_button_4.FontName        = Tahoma20x21_Bold;
  servo_number_button_4.PressColEnabled = 1;
  servo_number_button_4.Font_Color      = 0x07E0;
  servo_number_button_4.VerticalText    = 0;
  servo_number_button_4.Gradient        = 0;
  servo_number_button_4.Gradient_Orientation = 0;
  servo_number_button_4.Gradient_Start_Color = 0xFFFF;
  servo_number_button_4.Gradient_End_Color = 0xC618;
  servo_number_button_4.Color           = 0x0000;
  servo_number_button_4.Press_Color     = 0x07E0;
  servo_number_button_4.OnClickPtr      = servo_number_button_4OnClick;

  servo_number_button_6.OwnerScreen     = &Screen2;
  servo_number_button_6.Order           = 9;
  servo_number_button_6.Left            = 440;
  servo_number_button_6.Top             = 40;
  servo_number_button_6.Width           = 80;
  servo_number_button_6.Height          = 50;
  servo_number_button_6.Pen_Width       = 3;
  servo_number_button_6.Pen_Color       = 0x07E0;
  servo_number_button_6.Visible         = 1;
  servo_number_button_6.Active          = 1;
  servo_number_button_6.Transparent     = 0;
  servo_number_button_6.Caption         = servo_number_button_6_Caption;
  servo_number_button_6.TextAlign       = _taCenter;
  servo_number_button_6.TextAlignVertical= _tavMiddle;
  servo_number_button_6.FontName        = Tahoma20x21_Bold;
  servo_number_button_6.PressColEnabled = 1;
  servo_number_button_6.Font_Color      = 0x07E0;
  servo_number_button_6.VerticalText    = 0;
  servo_number_button_6.Gradient        = 0;
  servo_number_button_6.Gradient_Orientation = 0;
  servo_number_button_6.Gradient_Start_Color = 0xFFFF;
  servo_number_button_6.Gradient_End_Color = 0xC618;
  servo_number_button_6.Color           = 0x0000;
  servo_number_button_6.Press_Color     = 0x07E0;
  servo_number_button_6.OnClickPtr      = servo_number_button_6OnClick;

  servo_number_button_5.OwnerScreen     = &Screen2;
  servo_number_button_5.Order           = 10;
  servo_number_button_5.Left            = 360;
  servo_number_button_5.Top             = 40;
  servo_number_button_5.Width           = 80;
  servo_number_button_5.Height          = 50;
  servo_number_button_5.Pen_Width       = 3;
  servo_number_button_5.Pen_Color       = 0x07E0;
  servo_number_button_5.Visible         = 1;
  servo_number_button_5.Active          = 1;
  servo_number_button_5.Transparent     = 0;
  servo_number_button_5.Caption         = servo_number_button_5_Caption;
  servo_number_button_5.TextAlign       = _taCenter;
  servo_number_button_5.TextAlignVertical= _tavMiddle;
  servo_number_button_5.FontName        = Tahoma20x21_Bold;
  servo_number_button_5.PressColEnabled = 1;
  servo_number_button_5.Font_Color      = 0x07E0;
  servo_number_button_5.VerticalText    = 0;
  servo_number_button_5.Gradient        = 0;
  servo_number_button_5.Gradient_Orientation = 0;
  servo_number_button_5.Gradient_Start_Color = 0xFFFF;
  servo_number_button_5.Gradient_End_Color = 0xC618;
  servo_number_button_5.Color           = 0x0000;
  servo_number_button_5.Press_Color     = 0x07E0;
  servo_number_button_5.OnClickPtr      = servo_number_button_5OnClick;

  servo_number_button_7.OwnerScreen     = &Screen2;
  servo_number_button_7.Order           = 11;
  servo_number_button_7.Left            = 520;
  servo_number_button_7.Top             = 40;
  servo_number_button_7.Width           = 80;
  servo_number_button_7.Height          = 50;
  servo_number_button_7.Pen_Width       = 3;
  servo_number_button_7.Pen_Color       = 0x07E0;
  servo_number_button_7.Visible         = 1;
  servo_number_button_7.Active          = 1;
  servo_number_button_7.Transparent     = 0;
  servo_number_button_7.Caption         = servo_number_button_7_Caption;
  servo_number_button_7.TextAlign       = _taCenter;
  servo_number_button_7.TextAlignVertical= _tavMiddle;
  servo_number_button_7.FontName        = Tahoma20x21_Bold;
  servo_number_button_7.PressColEnabled = 1;
  servo_number_button_7.Font_Color      = 0x07E0;
  servo_number_button_7.VerticalText    = 0;
  servo_number_button_7.Gradient        = 0;
  servo_number_button_7.Gradient_Orientation = 0;
  servo_number_button_7.Gradient_Start_Color = 0xFFFF;
  servo_number_button_7.Gradient_End_Color = 0xC618;
  servo_number_button_7.Color           = 0x0000;
  servo_number_button_7.Press_Color     = 0x07E0;
  servo_number_button_7.OnClickPtr      = servo_number_button_7OnClick;

  servo_number_button_8.OwnerScreen     = &Screen2;
  servo_number_button_8.Order           = 12;
  servo_number_button_8.Left            = 600;
  servo_number_button_8.Top             = 40;
  servo_number_button_8.Width           = 80;
  servo_number_button_8.Height          = 50;
  servo_number_button_8.Pen_Width       = 3;
  servo_number_button_8.Pen_Color       = 0x07E0;
  servo_number_button_8.Visible         = 1;
  servo_number_button_8.Active          = 1;
  servo_number_button_8.Transparent     = 0;
  servo_number_button_8.Caption         = servo_number_button_8_Caption;
  servo_number_button_8.TextAlign       = _taCenter;
  servo_number_button_8.TextAlignVertical= _tavMiddle;
  servo_number_button_8.FontName        = Tahoma20x21_Bold;
  servo_number_button_8.PressColEnabled = 1;
  servo_number_button_8.Font_Color      = 0x07E0;
  servo_number_button_8.VerticalText    = 0;
  servo_number_button_8.Gradient        = 0;
  servo_number_button_8.Gradient_Orientation = 0;
  servo_number_button_8.Gradient_Start_Color = 0xFFFF;
  servo_number_button_8.Gradient_End_Color = 0xC618;
  servo_number_button_8.Color           = 0x0000;
  servo_number_button_8.Press_Color     = 0x07E0;
  servo_number_button_8.OnClickPtr      = servo_number_button_8OnClick;

  servo_number_button_9.OwnerScreen     = &Screen2;
  servo_number_button_9.Order           = 13;
  servo_number_button_9.Left            = 40;
  servo_number_button_9.Top             = 90;
  servo_number_button_9.Width           = 80;
  servo_number_button_9.Height          = 50;
  servo_number_button_9.Pen_Width       = 3;
  servo_number_button_9.Pen_Color       = 0x07E0;
  servo_number_button_9.Visible         = 1;
  servo_number_button_9.Active          = 1;
  servo_number_button_9.Transparent     = 0;
  servo_number_button_9.Caption         = servo_number_button_9_Caption;
  servo_number_button_9.TextAlign       = _taCenter;
  servo_number_button_9.TextAlignVertical= _tavMiddle;
  servo_number_button_9.FontName        = Tahoma20x21_Bold;
  servo_number_button_9.PressColEnabled = 1;
  servo_number_button_9.Font_Color      = 0x07E0;
  servo_number_button_9.VerticalText    = 0;
  servo_number_button_9.Gradient        = 0;
  servo_number_button_9.Gradient_Orientation = 0;
  servo_number_button_9.Gradient_Start_Color = 0xFFFF;
  servo_number_button_9.Gradient_End_Color = 0xC618;
  servo_number_button_9.Color           = 0x0000;
  servo_number_button_9.Press_Color     = 0x07E0;
  servo_number_button_9.OnClickPtr      = servo_number_button_9OnClick;

  servo_number_button_10.OwnerScreen     = &Screen2;
  servo_number_button_10.Order           = 14;
  servo_number_button_10.Left            = 120;
  servo_number_button_10.Top             = 90;
  servo_number_button_10.Width           = 80;
  servo_number_button_10.Height          = 50;
  servo_number_button_10.Pen_Width       = 3;
  servo_number_button_10.Pen_Color       = 0x07E0;
  servo_number_button_10.Visible         = 1;
  servo_number_button_10.Active          = 1;
  servo_number_button_10.Transparent     = 0;
  servo_number_button_10.Caption         = servo_number_button_10_Caption;
  servo_number_button_10.TextAlign       = _taCenter;
  servo_number_button_10.TextAlignVertical= _tavMiddle;
  servo_number_button_10.FontName        = Tahoma20x21_Bold;
  servo_number_button_10.PressColEnabled = 1;
  servo_number_button_10.Font_Color      = 0x07E0;
  servo_number_button_10.VerticalText    = 0;
  servo_number_button_10.Gradient        = 0;
  servo_number_button_10.Gradient_Orientation = 0;
  servo_number_button_10.Gradient_Start_Color = 0xFFFF;
  servo_number_button_10.Gradient_End_Color = 0xC618;
  servo_number_button_10.Color           = 0x0000;
  servo_number_button_10.Press_Color     = 0x07E0;
  servo_number_button_10.OnClickPtr      = servo_number_button_10OnClick;

  servo_number_button_11.OwnerScreen     = &Screen2;
  servo_number_button_11.Order           = 15;
  servo_number_button_11.Left            = 200;
  servo_number_button_11.Top             = 90;
  servo_number_button_11.Width           = 80;
  servo_number_button_11.Height          = 50;
  servo_number_button_11.Pen_Width       = 3;
  servo_number_button_11.Pen_Color       = 0x07E0;
  servo_number_button_11.Visible         = 1;
  servo_number_button_11.Active          = 1;
  servo_number_button_11.Transparent     = 0;
  servo_number_button_11.Caption         = servo_number_button_11_Caption;
  servo_number_button_11.TextAlign       = _taCenter;
  servo_number_button_11.TextAlignVertical= _tavMiddle;
  servo_number_button_11.FontName        = Tahoma20x21_Bold;
  servo_number_button_11.PressColEnabled = 1;
  servo_number_button_11.Font_Color      = 0x07E0;
  servo_number_button_11.VerticalText    = 0;
  servo_number_button_11.Gradient        = 0;
  servo_number_button_11.Gradient_Orientation = 0;
  servo_number_button_11.Gradient_Start_Color = 0xFFFF;
  servo_number_button_11.Gradient_End_Color = 0xC618;
  servo_number_button_11.Color           = 0x0000;
  servo_number_button_11.Press_Color     = 0x07E0;
  servo_number_button_11.OnClickPtr      = servo_number_button_11OnClick;

  servo_number_button_12.OwnerScreen     = &Screen2;
  servo_number_button_12.Order           = 16;
  servo_number_button_12.Left            = 280;
  servo_number_button_12.Top             = 90;
  servo_number_button_12.Width           = 80;
  servo_number_button_12.Height          = 50;
  servo_number_button_12.Pen_Width       = 3;
  servo_number_button_12.Pen_Color       = 0x07E0;
  servo_number_button_12.Visible         = 1;
  servo_number_button_12.Active          = 1;
  servo_number_button_12.Transparent     = 0;
  servo_number_button_12.Caption         = servo_number_button_12_Caption;
  servo_number_button_12.TextAlign       = _taCenter;
  servo_number_button_12.TextAlignVertical= _tavMiddle;
  servo_number_button_12.FontName        = Tahoma20x21_Bold;
  servo_number_button_12.PressColEnabled = 1;
  servo_number_button_12.Font_Color      = 0x07E0;
  servo_number_button_12.VerticalText    = 0;
  servo_number_button_12.Gradient        = 0;
  servo_number_button_12.Gradient_Orientation = 0;
  servo_number_button_12.Gradient_Start_Color = 0xFFFF;
  servo_number_button_12.Gradient_End_Color = 0xC618;
  servo_number_button_12.Color           = 0x0000;
  servo_number_button_12.Press_Color     = 0x07E0;
  servo_number_button_12.OnClickPtr      = servo_number_button_12OnClick;

  servo_number_button_13.OwnerScreen     = &Screen2;
  servo_number_button_13.Order           = 17;
  servo_number_button_13.Left            = 360;
  servo_number_button_13.Top             = 90;
  servo_number_button_13.Width           = 80;
  servo_number_button_13.Height          = 50;
  servo_number_button_13.Pen_Width       = 3;
  servo_number_button_13.Pen_Color       = 0x07E0;
  servo_number_button_13.Visible         = 1;
  servo_number_button_13.Active          = 1;
  servo_number_button_13.Transparent     = 0;
  servo_number_button_13.Caption         = servo_number_button_13_Caption;
  servo_number_button_13.TextAlign       = _taCenter;
  servo_number_button_13.TextAlignVertical= _tavMiddle;
  servo_number_button_13.FontName        = Tahoma20x21_Bold;
  servo_number_button_13.PressColEnabled = 1;
  servo_number_button_13.Font_Color      = 0x07E0;
  servo_number_button_13.VerticalText    = 0;
  servo_number_button_13.Gradient        = 0;
  servo_number_button_13.Gradient_Orientation = 0;
  servo_number_button_13.Gradient_Start_Color = 0xFFFF;
  servo_number_button_13.Gradient_End_Color = 0xC618;
  servo_number_button_13.Color           = 0x0000;
  servo_number_button_13.Press_Color     = 0x07E0;
  servo_number_button_13.OnClickPtr      = servo_number_button_13OnClick;

  servo_number_button_14.OwnerScreen     = &Screen2;
  servo_number_button_14.Order           = 18;
  servo_number_button_14.Left            = 440;
  servo_number_button_14.Top             = 90;
  servo_number_button_14.Width           = 80;
  servo_number_button_14.Height          = 50;
  servo_number_button_14.Pen_Width       = 3;
  servo_number_button_14.Pen_Color       = 0x07E0;
  servo_number_button_14.Visible         = 1;
  servo_number_button_14.Active          = 1;
  servo_number_button_14.Transparent     = 0;
  servo_number_button_14.Caption         = servo_number_button_14_Caption;
  servo_number_button_14.TextAlign       = _taCenter;
  servo_number_button_14.TextAlignVertical= _tavMiddle;
  servo_number_button_14.FontName        = Tahoma20x21_Bold;
  servo_number_button_14.PressColEnabled = 1;
  servo_number_button_14.Font_Color      = 0x07E0;
  servo_number_button_14.VerticalText    = 0;
  servo_number_button_14.Gradient        = 0;
  servo_number_button_14.Gradient_Orientation = 0;
  servo_number_button_14.Gradient_Start_Color = 0xFFFF;
  servo_number_button_14.Gradient_End_Color = 0xC618;
  servo_number_button_14.Color           = 0x0000;
  servo_number_button_14.Press_Color     = 0x07E0;
  servo_number_button_14.OnClickPtr      = servo_number_button_14OnClick;

  servo_number_button_15.OwnerScreen     = &Screen2;
  servo_number_button_15.Order           = 19;
  servo_number_button_15.Left            = 520;
  servo_number_button_15.Top             = 90;
  servo_number_button_15.Width           = 80;
  servo_number_button_15.Height          = 50;
  servo_number_button_15.Pen_Width       = 3;
  servo_number_button_15.Pen_Color       = 0x07E0;
  servo_number_button_15.Visible         = 1;
  servo_number_button_15.Active          = 1;
  servo_number_button_15.Transparent     = 0;
  servo_number_button_15.Caption         = servo_number_button_15_Caption;
  servo_number_button_15.TextAlign       = _taCenter;
  servo_number_button_15.TextAlignVertical= _tavMiddle;
  servo_number_button_15.FontName        = Tahoma20x21_Bold;
  servo_number_button_15.PressColEnabled = 1;
  servo_number_button_15.Font_Color      = 0x07E0;
  servo_number_button_15.VerticalText    = 0;
  servo_number_button_15.Gradient        = 0;
  servo_number_button_15.Gradient_Orientation = 0;
  servo_number_button_15.Gradient_Start_Color = 0xFFFF;
  servo_number_button_15.Gradient_End_Color = 0xC618;
  servo_number_button_15.Color           = 0x0000;
  servo_number_button_15.Press_Color     = 0x07E0;
  servo_number_button_15.OnClickPtr      = servo_number_button_15OnClick;

  servo_number_button_16.OwnerScreen     = &Screen2;
  servo_number_button_16.Order           = 20;
  servo_number_button_16.Left            = 600;
  servo_number_button_16.Top             = 90;
  servo_number_button_16.Width           = 80;
  servo_number_button_16.Height          = 50;
  servo_number_button_16.Pen_Width       = 3;
  servo_number_button_16.Pen_Color       = 0x07E0;
  servo_number_button_16.Visible         = 1;
  servo_number_button_16.Active          = 1;
  servo_number_button_16.Transparent     = 0;
  servo_number_button_16.Caption         = servo_number_button_16_Caption;
  servo_number_button_16.TextAlign       = _taCenter;
  servo_number_button_16.TextAlignVertical= _tavMiddle;
  servo_number_button_16.FontName        = Tahoma20x21_Bold;
  servo_number_button_16.PressColEnabled = 1;
  servo_number_button_16.Font_Color      = 0x07E0;
  servo_number_button_16.VerticalText    = 0;
  servo_number_button_16.Gradient        = 0;
  servo_number_button_16.Gradient_Orientation = 0;
  servo_number_button_16.Gradient_Start_Color = 0xFFFF;
  servo_number_button_16.Gradient_End_Color = 0xC618;
  servo_number_button_16.Color           = 0x0000;
  servo_number_button_16.Press_Color     = 0x07E0;
  servo_number_button_16.OnClickPtr      = servo_number_button_16OnClick;

  servo_number_button_3.OwnerScreen     = &Screen2;
  servo_number_button_3.Order           = 21;
  servo_number_button_3.Left            = 200;
  servo_number_button_3.Top             = 40;
  servo_number_button_3.Width           = 80;
  servo_number_button_3.Height          = 50;
  servo_number_button_3.Pen_Width       = 3;
  servo_number_button_3.Pen_Color       = 0x07E0;
  servo_number_button_3.Visible         = 1;
  servo_number_button_3.Active          = 1;
  servo_number_button_3.Transparent     = 0;
  servo_number_button_3.Caption         = servo_number_button_3_Caption;
  servo_number_button_3.TextAlign       = _taCenter;
  servo_number_button_3.TextAlignVertical= _tavMiddle;
  servo_number_button_3.FontName        = Tahoma20x21_Bold;
  servo_number_button_3.PressColEnabled = 1;
  servo_number_button_3.Font_Color      = 0x07E0;
  servo_number_button_3.VerticalText    = 0;
  servo_number_button_3.Gradient        = 0;
  servo_number_button_3.Gradient_Orientation = 0;
  servo_number_button_3.Gradient_Start_Color = 0xFFFF;
  servo_number_button_3.Gradient_End_Color = 0xC618;
  servo_number_button_3.Color           = 0x0000;
  servo_number_button_3.Press_Color     = 0x07E0;
  servo_number_button_3.OnClickPtr      = servo_number_button_3OnClick;

  servo_number_button_all.OwnerScreen     = &Screen2;
  servo_number_button_all.Order           = 22;
  servo_number_button_all.Left            = 681;
  servo_number_button_all.Top             = 40;
  servo_number_button_all.Width           = 80;
  servo_number_button_all.Height          = 100;
  servo_number_button_all.Pen_Width       = 3;
  servo_number_button_all.Pen_Color       = 0x07E0;
  servo_number_button_all.Visible         = 1;
  servo_number_button_all.Active          = 1;
  servo_number_button_all.Transparent     = 0;
  servo_number_button_all.Caption         = servo_number_button_all_Caption;
  servo_number_button_all.TextAlign       = _taCenter;
  servo_number_button_all.TextAlignVertical= _tavMiddle;
  servo_number_button_all.FontName        = Tahoma20x21_Bold;
  servo_number_button_all.PressColEnabled = 1;
  servo_number_button_all.Font_Color      = 0x07E0;
  servo_number_button_all.VerticalText    = 0;
  servo_number_button_all.Gradient        = 0;
  servo_number_button_all.Gradient_Orientation = 0;
  servo_number_button_all.Gradient_Start_Color = 0xFFFF;
  servo_number_button_all.Gradient_End_Color = 0xC618;
  servo_number_button_all.Color           = 0x0000;
  servo_number_button_all.Press_Color     = 0x07E0;
  servo_number_button_all.OnClickPtr      = servo_number_button_allOnClick;

  servo_position_button_3.OwnerScreen     = &Screen2;
  servo_position_button_3.Order           = 23;
  servo_position_button_3.Left            = 200;
  servo_position_button_3.Top             = 180;
  servo_position_button_3.Width           = 80;
  servo_position_button_3.Height          = 50;
  servo_position_button_3.Pen_Width       = 0;
  servo_position_button_3.Pen_Color       = 0x07E0;
  servo_position_button_3.Visible         = 0;
  servo_position_button_3.Active          = 1;
  servo_position_button_3.Transparent     = 0;
  servo_position_button_3.Caption         = servo_position_button_3_Caption;
  servo_position_button_3.TextAlign       = _taCenter;
  servo_position_button_3.TextAlignVertical= _tavMiddle;
  servo_position_button_3.FontName        = Tahoma20x21_Bold;
  servo_position_button_3.PressColEnabled = 1;
  servo_position_button_3.Font_Color      = 0x07E0;
  servo_position_button_3.VerticalText    = 0;
  servo_position_button_3.Gradient        = 0;
  servo_position_button_3.Gradient_Orientation = 0;
  servo_position_button_3.Gradient_Start_Color = 0xFFFF;
  servo_position_button_3.Gradient_End_Color = 0xC618;
  servo_position_button_3.Color           = 0x0000;
  servo_position_button_3.Press_Color     = 0x07E0;
  servo_position_button_3.OnClickPtr      = servo_position_button_3OnClick;

  servo_position_button_4.OwnerScreen     = &Screen2;
  servo_position_button_4.Order           = 24;
  servo_position_button_4.Left            = 280;
  servo_position_button_4.Top             = 180;
  servo_position_button_4.Width           = 80;
  servo_position_button_4.Height          = 50;
  servo_position_button_4.Pen_Width       = 0;
  servo_position_button_4.Pen_Color       = 0x07E0;
  servo_position_button_4.Visible         = 0;
  servo_position_button_4.Active          = 1;
  servo_position_button_4.Transparent     = 0;
  servo_position_button_4.Caption         = servo_position_button_4_Caption;
  servo_position_button_4.TextAlign       = _taCenter;
  servo_position_button_4.TextAlignVertical= _tavMiddle;
  servo_position_button_4.FontName        = Tahoma20x21_Bold;
  servo_position_button_4.PressColEnabled = 1;
  servo_position_button_4.Font_Color      = 0x07E0;
  servo_position_button_4.VerticalText    = 0;
  servo_position_button_4.Gradient        = 0;
  servo_position_button_4.Gradient_Orientation = 0;
  servo_position_button_4.Gradient_Start_Color = 0xFFFF;
  servo_position_button_4.Gradient_End_Color = 0xC618;
  servo_position_button_4.Color           = 0x0000;
  servo_position_button_4.Press_Color     = 0x07E0;
  servo_position_button_4.OnClickPtr      = servo_position_button_4OnClick;

  servo_position_button_5.OwnerScreen     = &Screen2;
  servo_position_button_5.Order           = 25;
  servo_position_button_5.Left            = 360;
  servo_position_button_5.Top             = 180;
  servo_position_button_5.Width           = 80;
  servo_position_button_5.Height          = 50;
  servo_position_button_5.Pen_Width       = 0;
  servo_position_button_5.Pen_Color       = 0x07E0;
  servo_position_button_5.Visible         = 0;
  servo_position_button_5.Active          = 1;
  servo_position_button_5.Transparent     = 0;
  servo_position_button_5.Caption         = servo_position_button_5_Caption;
  servo_position_button_5.TextAlign       = _taCenter;
  servo_position_button_5.TextAlignVertical= _tavMiddle;
  servo_position_button_5.FontName        = Tahoma20x21_Bold;
  servo_position_button_5.PressColEnabled = 1;
  servo_position_button_5.Font_Color      = 0x07E0;
  servo_position_button_5.VerticalText    = 0;
  servo_position_button_5.Gradient        = 0;
  servo_position_button_5.Gradient_Orientation = 0;
  servo_position_button_5.Gradient_Start_Color = 0xFFFF;
  servo_position_button_5.Gradient_End_Color = 0xC618;
  servo_position_button_5.Color           = 0x0000;
  servo_position_button_5.Press_Color     = 0x07E0;
  servo_position_button_5.OnClickPtr      = servo_position_button_5OnClick;

  servo_position_button_6.OwnerScreen     = &Screen2;
  servo_position_button_6.Order           = 26;
  servo_position_button_6.Left            = 440;
  servo_position_button_6.Top             = 180;
  servo_position_button_6.Width           = 80;
  servo_position_button_6.Height          = 50;
  servo_position_button_6.Pen_Width       = 0;
  servo_position_button_6.Pen_Color       = 0x07E0;
  servo_position_button_6.Visible         = 0;
  servo_position_button_6.Active          = 1;
  servo_position_button_6.Transparent     = 0;
  servo_position_button_6.Caption         = servo_position_button_6_Caption;
  servo_position_button_6.TextAlign       = _taCenter;
  servo_position_button_6.TextAlignVertical= _tavMiddle;
  servo_position_button_6.FontName        = Tahoma20x21_Bold;
  servo_position_button_6.PressColEnabled = 1;
  servo_position_button_6.Font_Color      = 0x07E0;
  servo_position_button_6.VerticalText    = 0;
  servo_position_button_6.Gradient        = 0;
  servo_position_button_6.Gradient_Orientation = 0;
  servo_position_button_6.Gradient_Start_Color = 0xFFFF;
  servo_position_button_6.Gradient_End_Color = 0xC618;
  servo_position_button_6.Color           = 0x0000;
  servo_position_button_6.Press_Color     = 0x07E0;
  servo_position_button_6.OnClickPtr      = servo_position_button_6OnClick;

  servo_position_button_7.OwnerScreen     = &Screen2;
  servo_position_button_7.Order           = 27;
  servo_position_button_7.Left            = 520;
  servo_position_button_7.Top             = 180;
  servo_position_button_7.Width           = 80;
  servo_position_button_7.Height          = 50;
  servo_position_button_7.Pen_Width       = 0;
  servo_position_button_7.Pen_Color       = 0x07E0;
  servo_position_button_7.Visible         = 0;
  servo_position_button_7.Active          = 1;
  servo_position_button_7.Transparent     = 0;
  servo_position_button_7.Caption         = servo_position_button_7_Caption;
  servo_position_button_7.TextAlign       = _taCenter;
  servo_position_button_7.TextAlignVertical= _tavMiddle;
  servo_position_button_7.FontName        = Tahoma20x21_Bold;
  servo_position_button_7.PressColEnabled = 1;
  servo_position_button_7.Font_Color      = 0x07E0;
  servo_position_button_7.VerticalText    = 0;
  servo_position_button_7.Gradient        = 0;
  servo_position_button_7.Gradient_Orientation = 0;
  servo_position_button_7.Gradient_Start_Color = 0xFFFF;
  servo_position_button_7.Gradient_End_Color = 0xC618;
  servo_position_button_7.Color           = 0x0000;
  servo_position_button_7.Press_Color     = 0x07E0;
  servo_position_button_7.OnClickPtr      = servo_position_button_7OnClick;

  servo_position_button_8.OwnerScreen     = &Screen2;
  servo_position_button_8.Order           = 28;
  servo_position_button_8.Left            = 601;
  servo_position_button_8.Top             = 180;
  servo_position_button_8.Width           = 80;
  servo_position_button_8.Height          = 50;
  servo_position_button_8.Pen_Width       = 0;
  servo_position_button_8.Pen_Color       = 0x07E0;
  servo_position_button_8.Visible         = 0;
  servo_position_button_8.Active          = 1;
  servo_position_button_8.Transparent     = 0;
  servo_position_button_8.Caption         = servo_position_button_8_Caption;
  servo_position_button_8.TextAlign       = _taCenter;
  servo_position_button_8.TextAlignVertical= _tavMiddle;
  servo_position_button_8.FontName        = Tahoma20x21_Bold;
  servo_position_button_8.PressColEnabled = 1;
  servo_position_button_8.Font_Color      = 0x07E0;
  servo_position_button_8.VerticalText    = 0;
  servo_position_button_8.Gradient        = 0;
  servo_position_button_8.Gradient_Orientation = 0;
  servo_position_button_8.Gradient_Start_Color = 0xFFFF;
  servo_position_button_8.Gradient_End_Color = 0xC618;
  servo_position_button_8.Color           = 0x0000;
  servo_position_button_8.Press_Color     = 0x07E0;
  servo_position_button_8.OnClickPtr      = servo_position_button_8OnClick;

  servo_position_button_9.OwnerScreen     = &Screen2;
  servo_position_button_9.Order           = 29;
  servo_position_button_9.Left            = 680;
  servo_position_button_9.Top             = 180;
  servo_position_button_9.Width           = 80;
  servo_position_button_9.Height          = 50;
  servo_position_button_9.Pen_Width       = 0;
  servo_position_button_9.Pen_Color       = 0x07E0;
  servo_position_button_9.Visible         = 0;
  servo_position_button_9.Active          = 1;
  servo_position_button_9.Transparent     = 0;
  servo_position_button_9.Caption         = servo_position_button_9_Caption;
  servo_position_button_9.TextAlign       = _taCenter;
  servo_position_button_9.TextAlignVertical= _tavMiddle;
  servo_position_button_9.FontName        = Tahoma20x21_Bold;
  servo_position_button_9.PressColEnabled = 1;
  servo_position_button_9.Font_Color      = 0x07E0;
  servo_position_button_9.VerticalText    = 0;
  servo_position_button_9.Gradient        = 0;
  servo_position_button_9.Gradient_Orientation = 0;
  servo_position_button_9.Gradient_Start_Color = 0xFFFF;
  servo_position_button_9.Gradient_End_Color = 0xC618;
  servo_position_button_9.Color           = 0x0000;
  servo_position_button_9.Press_Color     = 0x07E0;
  servo_position_button_9.OnClickPtr      = servo_position_button_9OnClick;

  fan_speed_button_1.OwnerScreen     = &Screen2;
  fan_speed_button_1.Order           = 30;
  fan_speed_button_1.Left            = 40;
  fan_speed_button_1.Top             = 270;
  fan_speed_button_1.Width           = 80;
  fan_speed_button_1.Height          = 50;
  fan_speed_button_1.Pen_Width       = 3;
  fan_speed_button_1.Pen_Color       = 0x07E0;
  fan_speed_button_1.Visible         = 1;
  fan_speed_button_1.Active          = 1;
  fan_speed_button_1.Transparent     = 0;
  fan_speed_button_1.Caption         = fan_speed_button_1_Caption;
  fan_speed_button_1.TextAlign       = _taCenter;
  fan_speed_button_1.TextAlignVertical= _tavMiddle;
  fan_speed_button_1.FontName        = Tahoma20x21_Bold;
  fan_speed_button_1.PressColEnabled = 1;
  fan_speed_button_1.Font_Color      = 0x07E0;
  fan_speed_button_1.VerticalText    = 0;
  fan_speed_button_1.Gradient        = 0;
  fan_speed_button_1.Gradient_Orientation = 0;
  fan_speed_button_1.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_1.Gradient_End_Color = 0xC618;
  fan_speed_button_1.Color           = 0x0000;
  fan_speed_button_1.Press_Color     = 0x07E0;
  fan_speed_button_1.OnClickPtr      = fan_speed_button_1OnClick;

  fan_speed_button_3.OwnerScreen     = &Screen2;
  fan_speed_button_3.Order           = 31;
  fan_speed_button_3.Left            = 200;
  fan_speed_button_3.Top             = 270;
  fan_speed_button_3.Width           = 80;
  fan_speed_button_3.Height          = 50;
  fan_speed_button_3.Pen_Width       = 3;
  fan_speed_button_3.Pen_Color       = 0x07E0;
  fan_speed_button_3.Visible         = 1;
  fan_speed_button_3.Active          = 1;
  fan_speed_button_3.Transparent     = 0;
  fan_speed_button_3.Caption         = fan_speed_button_3_Caption;
  fan_speed_button_3.TextAlign       = _taCenter;
  fan_speed_button_3.TextAlignVertical= _tavMiddle;
  fan_speed_button_3.FontName        = Tahoma20x21_Bold;
  fan_speed_button_3.PressColEnabled = 1;
  fan_speed_button_3.Font_Color      = 0x07E0;
  fan_speed_button_3.VerticalText    = 0;
  fan_speed_button_3.Gradient        = 0;
  fan_speed_button_3.Gradient_Orientation = 0;
  fan_speed_button_3.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_3.Gradient_End_Color = 0xC618;
  fan_speed_button_3.Color           = 0x0000;
  fan_speed_button_3.Press_Color     = 0x07E0;
  fan_speed_button_3.OnClickPtr      = fan_speed_button_3OnClick;

  fan_speed_button_5.OwnerScreen     = &Screen2;
  fan_speed_button_5.Order           = 32;
  fan_speed_button_5.Left            = 360;
  fan_speed_button_5.Top             = 270;
  fan_speed_button_5.Width           = 80;
  fan_speed_button_5.Height          = 50;
  fan_speed_button_5.Pen_Width       = 3;
  fan_speed_button_5.Pen_Color       = 0x07E0;
  fan_speed_button_5.Visible         = 1;
  fan_speed_button_5.Active          = 1;
  fan_speed_button_5.Transparent     = 0;
  fan_speed_button_5.Caption         = fan_speed_button_5_Caption;
  fan_speed_button_5.TextAlign       = _taCenter;
  fan_speed_button_5.TextAlignVertical= _tavMiddle;
  fan_speed_button_5.FontName        = Tahoma20x21_Bold;
  fan_speed_button_5.PressColEnabled = 1;
  fan_speed_button_5.Font_Color      = 0x07E0;
  fan_speed_button_5.VerticalText    = 0;
  fan_speed_button_5.Gradient        = 0;
  fan_speed_button_5.Gradient_Orientation = 0;
  fan_speed_button_5.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_5.Gradient_End_Color = 0xC618;
  fan_speed_button_5.Color           = 0x0000;
  fan_speed_button_5.Press_Color     = 0x07E0;
  fan_speed_button_5.OnClickPtr      = fan_speed_button_5OnClick;

  fan_speed_button_stop.OwnerScreen     = &Screen2;
  fan_speed_button_stop.Order           = 33;
  fan_speed_button_stop.Left            = 600;
  fan_speed_button_stop.Top             = 270;
  fan_speed_button_stop.Width           = 80;
  fan_speed_button_stop.Height          = 50;
  fan_speed_button_stop.Pen_Width       = 3;
  fan_speed_button_stop.Pen_Color       = 0x07E0;
  fan_speed_button_stop.Visible         = 1;
  fan_speed_button_stop.Active          = 1;
  fan_speed_button_stop.Transparent     = 0;
  fan_speed_button_stop.Caption         = fan_speed_button_stop_Caption;
  fan_speed_button_stop.TextAlign       = _taCenter;
  fan_speed_button_stop.TextAlignVertical= _tavMiddle;
  fan_speed_button_stop.FontName        = Tahoma20x21_Bold;
  fan_speed_button_stop.PressColEnabled = 1;
  fan_speed_button_stop.Font_Color      = 0x07E0;
  fan_speed_button_stop.VerticalText    = 0;
  fan_speed_button_stop.Gradient        = 0;
  fan_speed_button_stop.Gradient_Orientation = 0;
  fan_speed_button_stop.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_stop.Gradient_End_Color = 0xC618;
  fan_speed_button_stop.Color           = 0x0000;
  fan_speed_button_stop.Press_Color     = 0x07E0;
  fan_speed_button_stop.OnClickPtr      = fan_speed_button_stopOnClick;

  Label7.OwnerScreen     = &Screen2;
  Label7.Order           = 34;
  Label7.Left            = 40;
  Label7.Top             = 10;
  Label7.Width           = 174;
  Label7.Height          = 27;
  Label7.Visible         = 1;
  Label7.Active          = 1;
  Label7.Caption         = Label7_Caption;
  Label7.FontName        = Tahoma24x24_Bold;
  Label7.Font_Color      = 0x07E0;
  Label7.VerticalText    = 0;

  Label8.OwnerScreen     = &Screen2;
  Label8.Order           = 35;
  Label8.Left            = 40;
  Label8.Top             = 150;
  Label8.Width           = 190;
  Label8.Height          = 27;
  Label8.Visible         = 1;
  Label8.Active          = 1;
  Label8.Caption         = Label8_Caption;
  Label8.FontName        = Tahoma24x24_Bold;
  Label8.Font_Color      = 0x07E0;
  Label8.VerticalText    = 0;

  Label9.OwnerScreen     = &Screen2;
  Label9.Order           = 36;
  Label9.Left            = 40;
  Label9.Top             = 240;
  Label9.Width           = 122;
  Label9.Height          = 27;
  Label9.Visible         = 1;
  Label9.Active          = 1;
  Label9.Caption         = Label9_Caption;
  Label9.FontName        = Tahoma24x24_Bold;
  Label9.Font_Color      = 0x07E0;
  Label9.VerticalText    = 0;

  fan_speed_button_7.OwnerScreen     = &Screen2;
  fan_speed_button_7.Order           = 37;
  fan_speed_button_7.Left            = 520;
  fan_speed_button_7.Top             = 270;
  fan_speed_button_7.Width           = 80;
  fan_speed_button_7.Height          = 50;
  fan_speed_button_7.Pen_Width       = 3;
  fan_speed_button_7.Pen_Color       = 0x07E0;
  fan_speed_button_7.Visible         = 1;
  fan_speed_button_7.Active          = 1;
  fan_speed_button_7.Transparent     = 0;
  fan_speed_button_7.Caption         = fan_speed_button_7_Caption;
  fan_speed_button_7.TextAlign       = _taCenter;
  fan_speed_button_7.TextAlignVertical= _tavMiddle;
  fan_speed_button_7.FontName        = Tahoma20x21_Bold;
  fan_speed_button_7.PressColEnabled = 1;
  fan_speed_button_7.Font_Color      = 0x07E0;
  fan_speed_button_7.VerticalText    = 0;
  fan_speed_button_7.Gradient        = 0;
  fan_speed_button_7.Gradient_Orientation = 0;
  fan_speed_button_7.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_7.Gradient_End_Color = 0xC618;
  fan_speed_button_7.Color           = 0x0000;
  fan_speed_button_7.Press_Color     = 0x07E0;
  fan_speed_button_7.OnClickPtr      = fan_speed_button_7OnClick;

  ButtonRound2.OwnerScreen     = &Screen2;
  ButtonRound2.Order           = 38;
  ButtonRound2.Left            = 600;
  ButtonRound2.Top             = 415;
  ButtonRound2.Width           = 190;
  ButtonRound2.Height          = 55;
  ButtonRound2.Pen_Width       = 6;
  ButtonRound2.Pen_Color       = 0x07E0;
  ButtonRound2.Visible         = 1;
  ButtonRound2.Active          = 1;
  ButtonRound2.Transparent     = 0;
  ButtonRound2.Caption         = ButtonRound2_Caption;
  ButtonRound2.TextAlign       = _taCenter;
  ButtonRound2.TextAlignVertical= _tavMiddle;
  ButtonRound2.FontName        = Tahoma39x48_Regular;
  ButtonRound2.PressColEnabled = 1;
  ButtonRound2.Font_Color      = 0x07E0;
  ButtonRound2.VerticalText    = 0;
  ButtonRound2.Gradient        = 0;
  ButtonRound2.Gradient_Orientation = 0;
  ButtonRound2.Gradient_Start_Color = 0xFFFF;
  ButtonRound2.Gradient_End_Color = 0xC618;
  ButtonRound2.Color           = 0xC618;
  ButtonRound2.Press_Color     = 0x0000;
  ButtonRound2.Corner_Radius   = 10;
  ButtonRound2.OnClickPtr      = ButtonRound2OnClick;

  fan_speed_button_2.OwnerScreen     = &Screen2;
  fan_speed_button_2.Order           = 39;
  fan_speed_button_2.Left            = 120;
  fan_speed_button_2.Top             = 270;
  fan_speed_button_2.Width           = 80;
  fan_speed_button_2.Height          = 50;
  fan_speed_button_2.Pen_Width       = 3;
  fan_speed_button_2.Pen_Color       = 0x07E0;
  fan_speed_button_2.Visible         = 1;
  fan_speed_button_2.Active          = 1;
  fan_speed_button_2.Transparent     = 0;
  fan_speed_button_2.Caption         = fan_speed_button_2_Caption;
  fan_speed_button_2.TextAlign       = _taCenter;
  fan_speed_button_2.TextAlignVertical= _tavMiddle;
  fan_speed_button_2.FontName        = Tahoma20x21_Bold;
  fan_speed_button_2.PressColEnabled = 1;
  fan_speed_button_2.Font_Color      = 0x07E0;
  fan_speed_button_2.VerticalText    = 0;
  fan_speed_button_2.Gradient        = 0;
  fan_speed_button_2.Gradient_Orientation = 0;
  fan_speed_button_2.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_2.Gradient_End_Color = 0xC618;
  fan_speed_button_2.Color           = 0x0000;
  fan_speed_button_2.Press_Color     = 0x07E0;
  fan_speed_button_2.OnClickPtr      = fan_speed_button_2OnClick;

  fan_speed_button_4.OwnerScreen     = &Screen2;
  fan_speed_button_4.Order           = 40;
  fan_speed_button_4.Left            = 281;
  fan_speed_button_4.Top             = 270;
  fan_speed_button_4.Width           = 80;
  fan_speed_button_4.Height          = 50;
  fan_speed_button_4.Pen_Width       = 3;
  fan_speed_button_4.Pen_Color       = 0x07E0;
  fan_speed_button_4.Visible         = 1;
  fan_speed_button_4.Active          = 1;
  fan_speed_button_4.Transparent     = 0;
  fan_speed_button_4.Caption         = fan_speed_button_4_Caption;
  fan_speed_button_4.TextAlign       = _taCenter;
  fan_speed_button_4.TextAlignVertical= _tavMiddle;
  fan_speed_button_4.FontName        = Tahoma20x21_Bold;
  fan_speed_button_4.PressColEnabled = 1;
  fan_speed_button_4.Font_Color      = 0x07E0;
  fan_speed_button_4.VerticalText    = 0;
  fan_speed_button_4.Gradient        = 0;
  fan_speed_button_4.Gradient_Orientation = 0;
  fan_speed_button_4.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_4.Gradient_End_Color = 0xC618;
  fan_speed_button_4.Color           = 0x0000;
  fan_speed_button_4.Press_Color     = 0x07E0;
  fan_speed_button_4.OnClickPtr      = fan_speed_button_4OnClick;

  fan_speed_button_6.OwnerScreen     = &Screen2;
  fan_speed_button_6.Order           = 41;
  fan_speed_button_6.Left            = 440;
  fan_speed_button_6.Top             = 270;
  fan_speed_button_6.Width           = 80;
  fan_speed_button_6.Height          = 50;
  fan_speed_button_6.Pen_Width       = 3;
  fan_speed_button_6.Pen_Color       = 0x07E0;
  fan_speed_button_6.Visible         = 1;
  fan_speed_button_6.Active          = 1;
  fan_speed_button_6.Transparent     = 0;
  fan_speed_button_6.Caption         = fan_speed_button_6_Caption;
  fan_speed_button_6.TextAlign       = _taCenter;
  fan_speed_button_6.TextAlignVertical= _tavMiddle;
  fan_speed_button_6.FontName        = Tahoma20x21_Bold;
  fan_speed_button_6.PressColEnabled = 1;
  fan_speed_button_6.Font_Color      = 0x07E0;
  fan_speed_button_6.VerticalText    = 0;
  fan_speed_button_6.Gradient        = 0;
  fan_speed_button_6.Gradient_Orientation = 0;
  fan_speed_button_6.Gradient_Start_Color = 0xFFFF;
  fan_speed_button_6.Gradient_End_Color = 0xC618;
  fan_speed_button_6.Color           = 0x0000;
  fan_speed_button_6.Press_Color     = 0x07E0;
  fan_speed_button_6.OnClickPtr      = fan_speed_button_6OnClick;

  Image1.OwnerScreen     = &Screen3;
  Image1.Order           = 0;
  Image1.Left            = 0;
  Image1.Top             = 0;
  Image1.Width           = 800;
  Image1.Height          = 480;
  Image1.Picture_Type    = 0;
  Image1.Picture_Ratio   = 1;
  Image1.Picture_Name    = Greenhouse7800x480bmp_bmp;
  Image1.Visible         = 1;
  Image1.Active          = 1;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
  if ( (Left<= X) && (Left+ Width - 1 >= X) &&
       (Top <= Y)  && (Top + Height - 1 >= Y) )
    return 1;
  else
    return 0;
}


#define GetButton(index)              CurrentScreen->Buttons[index]
#define GetRoundButton(index)         CurrentScreen->Buttons_Round[index]
#define GetLabel(index)               CurrentScreen->Labels[index]
#define GetImage(index)               CurrentScreen->Images[index]
#define GetCircle(index)              CurrentScreen->Circles[index]
#define GetProgressBar(index)         CurrentScreen->ProgressBars[index]

void DrawButton(TButton *Abutton) {
unsigned int ALeft, ATop;
  if (Abutton->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
    }
    TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
    TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
    if (Abutton->VerticalText != 0)
      TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
    if (Abutton->TextAlign == _taLeft)
      ALeft = Abutton->Left + 4;
    else if (Abutton->TextAlign == _taCenter)
      ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
    else if (Abutton->TextAlign == _taRight)
      ALeft = Abutton->Left + Abutton->Width - caption_length - 4;

    if (Abutton->TextAlignVertical == _tavTop)
      ATop = Abutton->Top + 4;
    else if (Abutton->TextAlignVertical == _tavMiddle)
      ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
    else if (Abutton->TextAlignVertical == _tavBottom)
      ATop = Abutton->Top + (Abutton->Height - caption_height - 4);

    TFT_Write_Text(Abutton->Caption, ALeft, ATop);
  }
}

void DrawRoundButton(TButton_Round *Around_button) {
unsigned int ALeft, ATop;
  if (Around_button->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(Around_button->Transparent, Around_button->Press_Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                    Around_button->Gradient_End_Color, Around_button->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(Around_button->Transparent, Around_button->Color, Around_button->Gradient, Around_button->Gradient_Orientation,
                    Around_button->Gradient_Start_Color, Around_button->Gradient_End_Color);
    }
    TFT_Set_Pen(Around_button->Pen_Color, Around_button->Pen_Width);
    TFT_Rectangle_Round_Edges(Around_button->Left + 1, Around_button->Top + 1,
      Around_button->Left + Around_button->Width - 2,
      Around_button->Top + Around_button->Height - 2, Around_button->Corner_Radius);
    if (Around_button->VerticalText != 0)
      TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Ext_Font(Around_button->FontName, Around_button->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(Around_button->Caption, Around_button->Left, Around_button->Top);
    if (Around_button->TextAlign == _taLeft)
      ALeft = Around_button->Left + 4;
    else if (Around_button->TextAlign == _taCenter)
      ALeft = Around_button->Left + (Around_button->Width - caption_length) / 2;
    else if (Around_button->TextAlign == _taRight)
      ALeft = Around_button->Left + Around_button->Width - caption_length - 4;

    if (Around_button->TextAlignVertical == _tavTop)
      ATop = Around_button->Top + 3;
    else if (Around_button->TextAlignVertical == _tavMiddle)
      ATop = Around_button->Top + (Around_button->Height - caption_height) / 2;
    else if (Around_button->TextAlignVertical == _tavBottom)
      ATop  = Around_button->Top + Around_button->Height - caption_height - 4;

    TFT_Write_Text(Around_button->Caption, ALeft, ATop);
  }
}

void DrawLabel(TLabel *ALabel) {
  if (ALabel->Visible != 0) {
    if (ALabel->VerticalText != 0)
      TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
    else
      TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
  }
}

void DrawImage(TImage *AImage) {
  if (AImage->Visible != 0) {
    TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
  }
}

void DrawCircle(TCircle *ACircle) {
  if (ACircle->Visible != 0) {
    if (object_pressed == 1) {
      object_pressed = 0;
      TFT_Set_Brush(ACircle->Transparent, ACircle->Press_Color, ACircle->Gradient, ACircle->Gradient_Orientation,
                    ACircle->Gradient_End_Color, ACircle->Gradient_Start_Color);
    }
    else {
      TFT_Set_Brush(ACircle->Transparent, ACircle->Color, ACircle->Gradient, ACircle->Gradient_Orientation,
                    ACircle->Gradient_Start_Color, ACircle->Gradient_End_Color);
    }
    TFT_Set_Pen(ACircle->Pen_Color, ACircle->Pen_Width);
    TFT_Circle(ACircle->Left + ACircle->Radius,
               ACircle->Top + ACircle->Radius,
               ACircle->Radius);
  }
}

unsigned int GetColorFromGradientRange(unsigned int start_color, unsigned int end_color,
  unsigned int distance, unsigned int range) {

  char red_start, red_end, red_current;
  char green_start, green_end, green_current;
  char blue_start, blue_end, blue_current;

  if (distance == 0)
    return start_color;
  else if (distance == range)
    return end_color;
  else {
    TFT_Color16bitToRGB(start_color, &red_start, &green_start, &blue_start);
    TFT_Color16bitToRGB(end_color, &red_end, &green_end, &blue_end);

    red_current   = red_start   + (long)distance * ((int)red_end   - red_start)   / range;
    green_current = green_start + (long)distance * ((int)green_end - green_start) / range;
    blue_current  = blue_start  + (long)distance * ((int)blue_end  - blue_start)  / range;
    return TFT_RGBToColor16bit(red_current, green_current, blue_current);
  }
}

void Update_Percentage(TProgressBar *AProgressBar, unsigned int locPosition) {
char tmpStr[8];
  // Clear caption first
  if (AProgressBar->Show_Position != 0) {
    if (AProgressBar->Show_Percentage != 0) {
      WordToStr(locPosition , tmpStr);
      Ltrim(tmpStr);
      strcpy(AProgressBar->Caption, tmpStr);
      strcat(AProgressBar->Caption, "\%");
    } else {
      WordToStr(AProgressBar->Position , tmpStr);
      Ltrim(tmpStr);
      strcpy(AProgressBar->Caption, tmpStr);
    }
    TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
    TFT_Write_Text(AProgressBar->Caption, AProgressBar->Left + (AProgressBar->Width - caption_length) / 2, AProgressBar->Top + (AProgressBar->Height - caption_height) / 2);
  }
}

void Update_Sector(TProgressBar *AProgressBar, unsigned int AStartPos, unsigned int AEndPos, TProgressBarSector ASectorAction) {
unsigned int tmpWidth = 0;
unsigned int tmpRound = 0;
unsigned cnt = 0;
unsigned int startcolor, endcolor;
int move_offset;
unsigned int locPosition = 0;
  // Update sector range is 0, nothing to update
  if (AStartPos == AEndPos)
    return;

  // Counting in corner radius offset, if any
  if (AStartPos <= AProgressBar->Left) {
    if (AProgressBar->Rounded != 0)
      AStartPos = AProgressBar->Left + AProgressBar->Corner_Radius;
    else
      AStartPos = AProgressBar->Left + 1;
  }
  // Counting in corner radius offset, if any
  if (AEndPos >= AProgressBar->Left + AProgressBar->Width) {
    if (AProgressBar->Rounded != 0)
      AEndPos = AProgressBar->Left + AProgressBar->Width - (AProgressBar->Corner_Radius*2);
    else
      AEndPos = AProgressBar->Left + AProgressBar->Width - 1;
  }

  if (AProgressBar->Rounded != 0) {
    tmpRound = AProgressBar->Corner_Radius;
    tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
  }
  else {
    tmpRound = 0;
    tmpWidth = AProgressBar->Width;
  }

  // If gradient progression is horizontal, calculate the correct start and end color values for sector
  TFT_Set_Pen(0, 0);
  if (ASectorAction == _pbsFillSector) {
    if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
      startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AStartPos, AProgressBar->Left + tmpWidth + tmpRound);
      endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color, AEndPos, AProgressBar->Left + tmpWidth + tmpRound);
      TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, startcolor, endcolor);
    } else
      TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient, AProgressBar->Gradient_Orientation, AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color);
  } else {
    TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
    AEndPos += 1;
  }
  TFT_Rectangle(AStartPos, AProgressBar->Top + 1, AEndPos, AProgressBar->Top + 1 + AProgressBar->Height - 1);

  // Draw not smoothed position rect
  if ((AProgressBar->Smooth == 0) && (ASectorAction == _pbsFillSector)) {
    move_offset = 10;
    TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);
    TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
    locPosition = AStartPos;
    while (locPosition < AEndPos) {
      if (((locPosition - AProgressBar->Left - tmpRound)%(move_offset + 3) == 0) && (locPosition - 3 > AProgressBar->Left + tmpRound)) {
        if (locPosition + 3 >= AProgressBar->Left + tmpWidth + tmpRound)
          TFT_Rectangle(locPosition - 3, AProgressBar->Top, AProgressBar->Left + tmpWidth + tmpRound, AProgressBar->Top + AProgressBar->Height);
        else
          TFT_Rectangle(locPosition - 3, AProgressBar->Top, locPosition, AProgressBar->Top + AProgressBar->Height);
        locPosition += move_offset + 3;
      } else
      locPosition++;
    }
  }
}

void UpdatePBPosition(TProgressBar *AProgressBar) {
TProgressBarSector sector_action;
unsigned long locPosition = 0;
unsigned int _temp, _tempII;
unsigned int locStartPos = 0;
unsigned int locEndPos   = 0;
  // Previous current position are the same, nothing to update
  if (AProgressBar->Prev_Position == AProgressBar->Position)
    return;

  locPosition = (unsigned long)(AProgressBar->Position - AProgressBar->Min) * 100 / (AProgressBar->Max - AProgressBar->Min);
  if (AProgressBar->Visible != 0) {
    // Calculate start and end position of update sector
    _temp = (AProgressBar->Position - AProgressBar->Min);
    _tempII = AProgressBar->Max - AProgressBar->Min;
    locEndPos = _temp * 100 / _tempII;
    _temp = (AProgressBar->Prev_Position - AProgressBar->Min);
    locStartPos =  _temp * 100 / _tempII;
    if (AProgressBar->Rounded != 0) {
      _temp = AProgressBar->Width - (AProgressBar->Corner_Radius * 2);
      _tempII = AProgressBar->Left + AProgressBar->Corner_Radius;
    } else {
      _temp = (AProgressBar->Width - 2);
      _tempII = AProgressBar->Left + 1;
    }
    locStartPos = _tempII + locStartPos * _temp / 100;
    locEndPos   = _tempII + locEndPos * _temp / 100;
    // We are incrementing position, fill sector
    if (locStartPos < locEndPos)
      sector_action = _pbsFillSector;
    else {     // We are decrementing position, clearing sector
      sector_action = _pbsClearSector;
      _temp = locStartPos;
      locStartPos = locEndPos;
      locEndPos = _temp;
    }
    Update_Sector(AProgressBar, locStartPos, locEndPos, sector_action);

    if (AProgressBar->Show_Position == 0) {
      AProgressBar->Prev_Position = AProgressBar->Position;
      return;
    }

    // Calculate update sector range around percentage text
    TFT_Set_Ext_Font(AProgressBar->FontName, AProgressBar->Font_Color, FO_HORIZONTAL);
    TFT_Write_Text_Return_Pos(AProgressBar->Caption, AProgressBar->Left, AProgressBar->Top);
    if (caption_length >  AProgressBar->Width)
      caption_length =  AProgressBar->Width;
    _temp   = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2;
    _tempII = AProgressBar->Left + (AProgressBar->Width - caption_length) / 2 + caption_length;

    // Cover sectors overlapping possibilities
    if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (locEndPos <= _temp))
      Update_Sector(AProgressBar, _temp, _tempII, _pbsClearSector);
    else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (_tempII <= locStartPos) && (_temp <= locEndPos))
      Update_Sector(AProgressBar, _temp, _tempII, _pbsFillSector);
    else if ((locEndPos <= _tempII) && (locStartPos <= _temp) && (locStartPos <= _tempII) && (_temp <= locEndPos))
      Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
    else if ((_tempII <= locEndPos) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos))
      Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
    else if ((locEndPos <= _tempII) && (_temp <= locStartPos) && (locStartPos <= _tempII) && (_temp <= locEndPos)) {
      Update_Sector(AProgressBar, _temp, locStartPos, _pbsFillSector);
      Update_Sector(AProgressBar, locEndPos, _tempII, _pbsClearSector);
    }

    // Update percentage text
    Update_Percentage(AProgressBar, locPosition);
    AProgressBar->Prev_Position = AProgressBar->Position;
  }
}

void DrawProgressBar(TProgressBar *AProgressBar) {
unsigned long locPosition = 0;
int move_offset = 0;
unsigned cnt = 0;
unsigned int tmpWidth = 0;
unsigned int tmpRound = 0;
unsigned int startcolor, endcolor;
unsigned int _tmpI, _tmpII;
  move_offset = 10;
  _tmpI = AProgressBar->Position - AProgressBar->Min;
  _tmpII = AProgressBar->Max - AProgressBar->Min;
  locPosition = (unsigned long)_tmpI * 100 / _tmpII;
  if (AProgressBar->Visible != 0) {
    TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
    TFT_Set_Pen(AProgressBar->Pen_Color, AProgressBar->Pen_Width);

    if (AProgressBar->Rounded != 0) {
      tmpRound = AProgressBar->Corner_Radius;
      cnt = move_offset + tmpRound;
      tmpWidth = AProgressBar->Width - AProgressBar->Corner_Radius * 2;
    } else {
      tmpRound = 0;
      cnt = move_offset;
      tmpWidth = AProgressBar->Width;
    }

    if ((AProgressBar->Gradient != 0) && (AProgressBar->Gradient_Orientation != 0)) {
      startcolor = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
                                             0, AProgressBar->Max - AProgressBar->Min);
      endcolor   = GetColorFromGradientRange(AProgressBar->Gradient_Start_Color, AProgressBar->Gradient_End_Color,
                                             AProgressBar->Position - AProgressBar->Min, AProgressBar->Max - AProgressBar->Min);
    } else {
      startcolor = AProgressBar->Gradient_Start_Color;
      endcolor   = AProgressBar->Gradient_End_Color;
    }

    // First draw background
    if (AProgressBar->Rounded != 0)
      TFT_Rectangle_Round_Edges(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
                                AProgressBar->Top + AProgressBar->Height, AProgressBar->Corner_Radius);
    else
      TFT_Rectangle(AProgressBar->Left, AProgressBar->Top, AProgressBar->Left + AProgressBar->Width,
                    AProgressBar->Top + AProgressBar->Height);

    if (locPosition > 0) {
      if (AProgressBar->Rounded != 0) {
        TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
                      AProgressBar->Gradient_Orientation, startcolor, endcolor);
        TFT_Rectangle(AProgressBar->Left + AProgressBar->Corner_Radius, AProgressBar->Top,
                      AProgressBar->Left + AProgressBar->Corner_Radius + locPosition * (AProgressBar->Width-AProgressBar->Corner_Radius*2) / 100,
                      AProgressBar->Top + AProgressBar->Height);
      } else {
        TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Color, AProgressBar->Gradient,
                      AProgressBar->Gradient_Orientation, startcolor, endcolor);
        TFT_Rectangle(AProgressBar->Left, AProgressBar->Top,  AProgressBar->Left + (locPosition * AProgressBar->Width) / 100,
                      AProgressBar->Top + AProgressBar->Height);
      }
      // Draw not smooth position rect
      if (AProgressBar->Smooth == 0) {
        TFT_Set_Brush(AProgressBar->Transparent, AProgressBar->Background_Color, 0,0,0,0);
        while (cnt-tmpRound < (locPosition * tmpWidth) / 100) {
          if  (cnt - tmpRound + 3 >=  tmpWidth * locPosition)
            TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top, AProgressBar->Left + tmpRound  + tmpWidth * locPosition , AProgressBar->Top + AProgressBar->Height);
          else
            TFT_Rectangle(AProgressBar->Left + cnt, AProgressBar->Top,  AProgressBar->Left + cnt + 3, AProgressBar->Top + AProgressBar->Height);
          cnt = cnt + move_offset + 3;
        }
      }
    }
    // Update percentage text
    Update_Percentage(AProgressBar, locPosition);
    AProgressBar->Prev_Position = AProgressBar->Position;
  }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
  unsigned short button_idx;
  TButton *local_button;
  unsigned short round_button_idx;
  TButton_Round *local_round_button;
  unsigned short label_idx;
  TLabel *local_label;
  unsigned short image_idx;
  TImage *local_image;
  unsigned short circle_idx;
  TCircle *local_circle;
  unsigned short progress_bar_idx;
  TProgressBar *local_progress_bar;
  char save_bled;

  object_pressed = 0;
  order = 0;
  button_idx = 0;
  round_button_idx = 0;
  label_idx = 0;
  image_idx = 0;
  circle_idx = 0;
  progress_bar_idx = 0;
  CurrentScreen = aScreen;

  if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
    save_bled = TFT_BLED;
    TFT_BLED           = 0;
    TFT_Set_Active(Set_Index, Write_Command, Write_Data);
    TFT_Init_SSD1963(CurrentScreen->Width, CurrentScreen->Height);
    STMPE610_SetSize(CurrentScreen->Width, CurrentScreen->Height);
    TFT_Set_Ext_Buffer(TFT_Get_Data);
    TFT_Fill_Screen(CurrentScreen->Color);
    TFT_Set_DBC_SSD1963(255);
    display_width = CurrentScreen->Width;
    display_height = CurrentScreen->Height;
    TFT_BLED           = save_bled;
  }
  else
    TFT_Fill_Screen(CurrentScreen->Color);


  while (order < CurrentScreen->ObjectsCount) {
    if (button_idx < CurrentScreen->ButtonsCount) {
      local_button = GetButton(button_idx);
      if (order == local_button->Order) {
        button_idx++;
        order++;
        DrawButton(local_button);
      }
    }

    if (round_button_idx < CurrentScreen->Buttons_RoundCount) {
      local_round_button = GetRoundButton(round_button_idx);
      if (order == local_round_button->Order) {
        round_button_idx++;
        order++;
        DrawRoundButton(local_round_button);
      }
    }

    if (label_idx < CurrentScreen->LabelsCount) {
      local_label = GetLabel(label_idx);
      if (order == local_label->Order) {
        label_idx++;
        order++;
        DrawLabel(local_label);
      }
    }

    if (circle_idx < CurrentScreen->CirclesCount) {
      local_circle = GetCircle(circle_idx);
      if (order == local_circle->Order) {
        circle_idx++;
        order++;
        DrawCircle(local_circle);
      }
    }

    if (image_idx < CurrentScreen->ImagesCount) {
      local_image = GetImage(image_idx);
      if (order == local_image->Order) {
        image_idx++;
        order++;
        DrawImage(local_image);
      }
    }

    if (progress_bar_idx < CurrentScreen->ProgressBarsCount) {
      local_progress_bar = GetProgressBar(progress_bar_idx);
      if (order == local_progress_bar->Order) {
        progress_bar_idx++;
        order++;
        DrawProgressBar(local_progress_bar);
      }
    }

  }
}

void Get_Object(unsigned int X, unsigned int Y) {
  button_order        = -1;
  round_button_order  = -1;
  label_order         = -1;
  image_order         = -1;
  circle_order        = -1;
  //  Buttons
  for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
    local_button = GetButton(_object_count);
    if (local_button->Active != 0) {
      if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
                         local_button->Width, local_button->Height) == 1) {
        button_order = local_button->Order;
        exec_button = local_button;
      }
    }
  }

  //  Buttons with Round Edges
  for ( _object_count = 0 ; _object_count < CurrentScreen->Buttons_RoundCount ; _object_count++ ) {
    local_round_button = GetRoundButton(_object_count);
    if (local_round_button->Active != 0) {
      if (IsInsideObject(X, Y, local_round_button->Left, local_round_button->Top,
                         local_round_button->Width, local_round_button->Height) == 1) {
        round_button_order = local_round_button->Order;
        exec_round_button = local_round_button;
      }
    }
  }

  //  Labels
  for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
    local_label = GetLabel(_object_count);
    if (local_label->Active != 0) {
      if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
                         local_label->Width, local_label->Height) == 1) {
        label_order = local_label->Order;
        exec_label = local_label;
      }
    }
  }

  //  Images
  for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
    local_image = GetImage(_object_count);
    if (local_image->Active != 0) {
      if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
                         local_image->Width, local_image->Height) == 1) {
        image_order = local_image->Order;
        exec_image = local_image;
      }
    }
  }

  //  Circles
  for ( _object_count = 0 ; _object_count < CurrentScreen->CirclesCount ; _object_count++ ) {
    local_circle = GetCircle(_object_count);
    if (local_circle->Active != 0) {
      if (IsInsideObject(X, Y, local_circle->Left, local_circle->Top,
                        (local_circle->Radius * 2), (local_circle->Radius * 2)) == 1) {
        circle_order = local_circle->Order;
        exec_circle = local_circle;
      }
    }
  }

  _object_count = -1;
  if (button_order >  _object_count )
    _object_count = button_order;
  if (round_button_order >  _object_count )
    _object_count = round_button_order;
  if (label_order >  _object_count )
    _object_count = label_order;
  if (image_order >  _object_count )
    _object_count = image_order;
  if (circle_order >  _object_count )
    _object_count = circle_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
  exec_button         = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_circle         = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active != 0) {
        if (exec_button->OnPressPtr != 0) {
          exec_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->OnPressPtr != 0) {
          exec_round_button->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        if (exec_label->OnPressPtr != 0) {
          exec_label->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        if (exec_image->OnPressPtr != 0) {
          exec_image->OnPressPtr();
          return;
        }
      }
    }

    if (_object_count == circle_order) {
      if (exec_circle->Active != 0) {
        if (exec_circle->OnPressPtr != 0) {
          exec_circle->OnPressPtr();
          return;
        }
      }
    }

  }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

  switch (PressedObjectType) {
    // Button
    case 0: {
      if (PressedObject != 0) {
        exec_button = (TButton*)PressedObject;
        if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
          DrawButton(exec_button);
        }
        break;
      }
      break;
    }
    // Round Button
    case 1: {
      if (PressedObject != 0) {
        exec_round_button = (TButton_Round*)PressedObject;
        if ((exec_round_button->PressColEnabled != 0) && (exec_round_button->OwnerScreen == CurrentScreen)) {
          DrawRoundButton(exec_round_button);
        }
        break;
      }
      break;
    }
    // Circle
    case 4: {
      if (PressedObject != 0) {
        exec_circle = (TCircle*)PressedObject;
        if ((exec_circle->PressColEnabled != 0) && (exec_circle->OwnerScreen == CurrentScreen)) {
          DrawCircle(exec_circle);
        }
        break;
      }
      break;
    }
  }

  exec_label          = 0;
  exec_image          = 0;

  Get_Object(X, Y);


  if (_object_count != -1) {
  // Buttons
    if (_object_count == button_order) {
      if (exec_button->Active != 0) {
        if (exec_button->OnUpPtr != 0)
          exec_button->OnUpPtr();
        if (PressedObject == (void *)exec_button)
          if (exec_button->OnClickPtr != 0)
            exec_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Buttons with Round Edges
    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->OnUpPtr != 0)
          exec_round_button->OnUpPtr();
        if (PressedObject == (void *)exec_round_button)
          if (exec_round_button->OnClickPtr != 0)
            exec_round_button->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Labels
    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        if (exec_label->OnUpPtr != 0)
          exec_label->OnUpPtr();
        if (PressedObject == (void *)exec_label)
          if (exec_label->OnClickPtr != 0)
            exec_label->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Images
    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        if (exec_image->OnUpPtr != 0)
          exec_image->OnUpPtr();
        if (PressedObject == (void *)exec_image)
          if (exec_image->OnClickPtr != 0)
            exec_image->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  // Circles
    if (_object_count == circle_order) {
      if (exec_circle->Active != 0) {
        if (exec_circle->OnUpPtr != 0)
          exec_circle->OnUpPtr();
        if (PressedObject == (void *)exec_circle)
          if (exec_circle->OnClickPtr != 0)
            exec_circle->OnClickPtr();
        PressedObject = 0;
        PressedObjectType = -1;
        return;
      }
    }

  }
  PressedObject = 0;
  PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

  object_pressed      = 0;
  exec_button         = 0;
  exec_round_button   = 0;
  exec_label          = 0;
  exec_image          = 0;
  exec_circle         = 0;

  Get_Object(X, Y);

  if (_object_count != -1) {
    if (_object_count == button_order) {
      if (exec_button->Active != 0) {
        if (exec_button->PressColEnabled != 0) {
          object_pressed = 1;
          DrawButton(exec_button);
        }
        PressedObject = (void *)exec_button;
        PressedObjectType = 0;
        if (exec_button->OnDownPtr != 0) {
          exec_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == round_button_order) {
      if (exec_round_button->Active != 0) {
        if (exec_round_button->PressColEnabled != 0) {
          object_pressed = 1;
          DrawRoundButton(exec_round_button);
        }
        PressedObject = (void *)exec_round_button;
        PressedObjectType = 1;
        if (exec_round_button->OnDownPtr != 0) {
          exec_round_button->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == label_order) {
      if (exec_label->Active != 0) {
        PressedObject = (void *)exec_label;
        PressedObjectType = 2;
        if (exec_label->OnDownPtr != 0) {
          exec_label->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == image_order) {
      if (exec_image->Active != 0) {
        PressedObject = (void *)exec_image;
        PressedObjectType = 3;
        if (exec_image->OnDownPtr != 0) {
          exec_image->OnDownPtr();
          return;
        }
      }
    }

    if (_object_count == circle_order) {
      if (exec_circle->Active != 0) {
        if (exec_circle->PressColEnabled != 0) {
          object_pressed = 1;
          DrawCircle(exec_circle);
        }
        PressedObject = (void *)exec_circle;
        PressedObjectType = 4;
        if (exec_circle->OnDownPtr != 0) {
          exec_circle->OnDownPtr();
          return;
        }
      }
    }

  }
}

void Check_TP() {
  if (STMPE610_PressDetect()) {
    if (STMPE610_GetLastCoordinates(&Xcoord, &Ycoord) == 0) {
    // After a PRESS is detected read X-Y and convert it to Display dimensions space
      Process_TP_Press(Xcoord, Ycoord);
      if (PenDown == 0) {
        PenDown = 1;
        Process_TP_Down(Xcoord, Ycoord);
      }
    }
  }
  else if (PenDown == 1) {
    PenDown = 0;
    Process_TP_Up(Xcoord, Ycoord);
  }
}

void Init_MCU() {
  // Place your code here

  // If bus is busy wait SDA high before initializing I2C module
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_6);
  GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_7);
  GPIOB_ODR.B6 = 1;
  while (GPIOB_IDR.B7 == 0) {
    GPIOB_ODR.B6 = 0;
    Delay_us(10);
    GPIOB_ODR.B6 = 1;
    Delay_us(10);
  }
  I2C1_Init_Advanced(400000, &_GPIO_MODULE_I2C1_PB67);

  TFT_Set_Default_Mode();
  GPIO_Digital_Output(&GPIOG_BASE, 0x00FF);
  GPIO_Digital_Output(&GPIOE_BASE, 0xFF00);
  GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_4);
  GPIOB_ODR.B4 = 0;
  TFT_Set_Default_Mode();
  TFT_Set_MM_Plus();
  STMPE610_SetDefaultMode();
}

void Init_Ext_Mem() {
    // Initialize SDIO
    SDIO_Reset();

    SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
            | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 125, &_GPIO_MODULE_SDIO_D0_D3);

    // Set pull-ups on SDIO lines
    GPIOD_PUPDRbits.PUPDR2 = 1;
    GPIOC_PUPDRbits.PUPDR8 = 1;
    GPIOC_PUPDRbits.PUPDR9 = 1;
    GPIOC_PUPDRbits.PUPDR10 = 1;
    GPIOC_PUPDRbits.PUPDR11 = 1;

    Mmc_Set_Interface(_MMC_INTERFACE_SDIO);

    // Init the FAT library
    if (!Mmc_Fat_Init()) {
      // Increase SDIO speed (SDIO_CK)
      SDIO_Init(_SDIO_CFG_POWER_SAVE_DISABLE | _SDIO_CFG_4_WIDE_BUS_MODE | _SDIO_CFG_CLOCK_BYPASS_DISABLE
              | _SDIO_CFG_CLOCK_RISING_EDGE | _SDIO_CFG_HW_FLOW_DISABLE, 1, &_GPIO_MODULE_SDIO_D0_D3);

      // Open resource file for read
      Mmc_Fat_Assign("Mikromed.RES", 0);
      Mmc_Fat_Reset(&res_file_size);
    }
}

char STMPE610_Config()  {
  STMPE610_SetI2CAddress(STMPE610_I2C_ADDR1);
  if (STMPE610_IsOperational() != 0){
    return STMPE610_IO_NOT_OPERATIONAL;
  }

  STMPE610_Reset();
  STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
  STMPE610_AlternateFunction(STMPE610_GPIO_PIN1, STMPE610_ENABLE);
  STMPE610_SetGPIOPin(STMPE610_GPIO_PIN1, 0);   // IN1 to "0" -> I2C communication
  STMPE610_SetSize(800,480);
  STMPE610_Module(STMPE610_MODULE_TS | STMPE610_MODULE_ADC, STMPE610_ENABLE);
  STMPE610_EnableInterrupt(STMPE610_IE_TOUCH_DET | STMPE610_IE_FIFO_TH | STMPE610_IE_FIFO_0FLOW, STMPE610_ENABLE);
  STMPE610_ConfigureInterrupt(STMPE610_INT_POLARITY_ACTIVE_HIGH | STMPE610_INT_TYPE_EDGE | STMPE610_INT_ENABLE_ALL);
  STMPE610_SetADC(STMPE610_ADC_CTRL1_SAMPLETIME_44 | STMPE610_ADC_CTRL1_ADC_12BIT | STMPE610_ADC_CTRL1_INT_REFERENCE);
  Delay_10ms(); Delay_10ms();
  STMPE610_SetADCClock(STMPE610_ADC_CTRL2_3250_kHZ);
  STMPE610_AlternateFunction(STMPE610_GPIO_PIN4 | STMPE610_GPIO_PIN5 | STMPE610_GPIO_PIN6 | STMPE610_GPIO_PIN7, STMPE610_DISABLE);
  STMPE610_ConfigureTSC(STMPE610_TSC_CFG_AVE_CTRL_4S, STMPE610_TSC_CFG_TOUCH_DET_DELAY_500uS, STMPE610_TSC_CFG_TOUCH_SETTLING_500uS);
  STMPE610_SetFIFOThreshold(1);
  STMPE610_ResetFIFO();
  STMPE610_TSIDrive(STMPE610_TSC_I_DRIVE_20mA);
  STMPE610_TSControl(STMPE610_TSC_CTRL_TRACK0 | STMPE610_TSC_CTRL_ACQU_XYZ | STMPE610_TSC_CTRL_ENABLE);
  STMPE610_ZDataFraction(STMPE610_FRACP4_WHOLP4);
  STMPE610_SetTouchPressureThreshold(70);
  STMPE610_ClearInterrupts();
  STMPE610_WriteReg(STMPE610_INT_CTRL_REG, 0x01);
  return STMPE610_OK;
}


void Start_TP() {
TTPConstants TPConstsStruct;
  Init_MCU();

  Init_Ext_Mem();

  InitializeTouchPanel();
  if (STMPE610_Config() == STMPE610_OK) {
  } else {
    while(1);
  }


  // You can get calibration constants using touch panel calibration example
  TPConstsStruct.X_Min = 105;
  TPConstsStruct.X_Max = 3925;
  TPConstsStruct.Y_Min = 250;
  TPConstsStruct.Y_Max = 3820;
  TPConstsStruct.Rotate = 0;
  STMPE610_SetCalibrationConsts(&TPConstsStruct);

  InitializeObjects();
  display_width = Screen1.Width;
  display_height = Screen1.Height;
  DrawScreen(&Screen1);
}