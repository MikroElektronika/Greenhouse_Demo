![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)
---
# Greenhouse demo application

#### Internal inforamtion 
- **Verison**        : v1.0.0
- **Date**           : 3/29/2019
- **Libstock**       : {LIBSTOCK_LINK}
- **GitHub**         : {GITHUB_LINK}

## Project description

 This demo project is used for monitoring and control of greenhouse enviromental conditions.

## Project goals 

 Primary goal of this demo project is to save time for users by centralizing entire greenhouse control and monitoring system to one place - Mikromedia and by enabling users to remotely monitor greenhouse data and control greenhouse enviromental conditions via ClickCloud.

 Entire system is to be mounted inside the greenhouse or somwhere near it. Users can then monitor enviromental data and control watering, shading and ventilation systems on mikromedia or via ClickCloud.

 Users no longer need to spend time to constantly visit their greenhouse (i.e. greenhouses) and be in their near proximity. 
 They also no longer need to manualy control watering, shading and ventilation.

## Project solved

 Click cloud solves the problem of having to be near the greenhouse by sending data to ClickCloud and by receiving controls from it.
 Mikromedia collects all data and logs it to screen and centralizes all greenhouse control systems.

### Design
 
 Temperature and humidity are measured with Temp&Hum 6 click board.
 UV and UV index are measured with UV 3 click.
 Enviromental data (temperature, humidity, uv and uv index level) can be monitored localy on Mikromedia or remotely on ClickCloud.
 Users control greenhouse temperature by setting fan speed and by setting positions of servo motors attached to greenhouse doors and roof vents.
 Servo motors can also be attached to greenhouse watering system valves for watering control and shading meshes for UV index control.
 Fan speed and servo motor positions are controlled via Mikromedia touch panel or via ClickCloud.

### Where it is used

 - Greenhouses
 - Botanical gardens

### Hardware

**System**

 - Mikromedia 7 for STM32F7 ARM

**Click boards**

 - Cloud click
 - Temp&Hum 6 click
 - UV 3 click
 - FAN 3 click
 - Servo click

**Other hardware**

 - mikromedia 7 for STM32 Shield
 - MicroSD card
 - USB programming cable
 - Fan (12-24 VDC)
 - Servo motors (5 VDC)
 - Power supply 5-12V for 'mikromedia 7 for STM32F7 ARM'
 - Power supply 12-24V for 'FAN 3 click'
 - Power supply 5V for 'Servo click'

 ## Instructions - hardware

 - Insert microSD cart to 'mikromedia 7 for STM32F7 ARM'
 - Place 'mikromedia 7 for STM32 Shield' on 'mikromedia 7 for STM32F7 ARM'
 - Place 'Cloud click' to 'MikroBUS 1' on 'mikromedia 7 for STM32 Shield'
 - Place 'Temp&Hum 6 click' to 'MikroBUS 2' on 'mikromedia 7 for STM32 Shield'
 - Place 'UV 3 click' to 'MikroBUS 3' on 'mikromedia 7 for STM32 Shield'
 - Place 'FAN 3 click' to 'MikroBUS 4' on 'mikromedia 7 for STM32 Shield'
 - Place 'Servo click' to 'MikroBUS 5' on 'mikromedia 7 for STM32 Shield'
 - Supply 'FAN 3 click' with 12-25V voltage
 - Supply 'Servo click' with 5V voltage
 - Supply 'mikromedia 7 for STM32F7 ARM' with 5-12V voltage
 - Connect fan to 'FAN+' and 'FAN-' terminals on 'FAN 3 click'
 - Connect servo motors to 'Servo click' servo motor headers
 - Connect programming USB to 'mikromedia 7 for STM32F7 ARM'

### Software

 - mikroC PRO for ARM
 - ClickCloud - "https://app.clickcloud.io/#/login"

**Library Packages**

- [G2C click](https://libstock.mikroe.com/projects/view/2628/g2c-click)
- [Temp-Hum 6 click](https://libstock.mikroe.com/projects/view/2646/temp-hum-6-click)
- [UV 3 click](https://libstock.mikroe.com/projects/view/2137/uv-3-click)
- [Fan 3 click](https://libstock.mikroe.com/projects/view/2238/fan-3-click)
- [Servo click](https://libstock.mikroe.com/projects/view/2352/servo-click)
- [mikroSDK](https://libstock.mikroe.com/projects/view/2249/mikrosdk) 

## Instructions - cloud 

 - Create manifest (ClickCloud -> Devices -> Device manifests(Manifest management) -> Create manifest -> From scratch)
   - Device manifest name - Greenhouse manifest
   - Add sensors (Sensors -> Add new sensor) :
     - Temperature sensor : 
       - Sensor name - Temp Sensor
       - Sensor reference - "TEMPHUM6_T"
       - Reading type - Temperature
       - Unit - °C(Si)
       - Data type - Numeric
       - Minimum - (-40)
       - Maximum - (125)
     - Humidity sensor
       - Sensor name - Humidity Sensor
       - Sensor reference - "TEMPHUM6_H"
       - Reading type - Humidity
       - Unit - %(Non si)
       - Data type - Numeric
       - Minimum - 0
       - Maximum - 100
     - UV sensor
       - Sensor name - UV Sensor
       - Sensor reference - "UV3_UV"
       - Reading type - Generic
       - Data type - Numeric
       - Minimum - 0
       - Maximum - 10000
     - UV Index sensor
       - Sensor name - UV Index Sensor
       - Sensor reference - "UV3_UVI"
       - Reading type - Generic text
       - Data type - String
     - Mikromedia Sensor
       - Sensor name - mikromedia
       - Sensor reference - MIKROMEDIA
       - Reading type - Generic text
       - Data type - String
   - Add actuators (Actuators -> Add new actuator) :
     - Servo Number Actuator
       - Actuator name - Servo number
       - Actuator reference - SERVO_NUM
       - Reading type - COUNT(ACTUATOR)
       - Data type - Numeric
       - Minimum - 0
       - Maximum - 16
     - Servo Position Actuator
       - Actuator name - Servo position
       - Actuator reference - SERVO_POS
       - Reading type - COUNT(ACTUATOR)
       - Data type - Numeric
       - Minimum - 10
       - Maximum - 170 
     - Fan Speed Actuator
       - Actuator name - Fan speed
       - Actuator reference - FAN_SPEED
       - Reading type - COUNT(ACTUATOR)
       - Data type - Numeric
       - Minimum - 0
       - Maximum - 7
 - Create device (ClickCloud -> Devices -> Add device -> Create device -> Device manifest(select : Greenhouse manifest -> click : Next step))
   - Device name - Greenhouse device
   - click : Save -> 'Successful device creation' popup opens
   - Replace "Device_Key" in project source code (Line 71) with 'Device key' from popup
   - Replace "Device_Password" in project source code (Line 72) with 'Password' from popup 
 - Create dashboard (ClickCloud -> Dashboards -> Add new dashboard)
   - Dashboard name - Greenhouse dashboard
   - Add widgets (Add new widget to dashboard Greenhouse dashboard)
     - Semantic groups (select : Temp sensor(°C), Humidity sensor(%), UV sensor(), UV index sensor())
     - Semantic groups (select : Servo number(count), Servo position(count), Fan speed(count), Mikromedia())
 - Add rules (ClickCloud -> Rules -> Add rule) - OPTIONAL
   - (1)When
     - Device(s) -> +Add -> Add device -> Greenhouse device -> click : Save
     - Property - Greenhouse device/Temp sensor
     - Operators - is higher than
     - Compare with - Static value
     - Value - 40 °C
     - click : Next step
   - (2)Then
     - Action type - Set / actuate
     - Devices - Greenhouse device
     - Actuator - Greenhouse device/Fan speed
     - Number between 0 and 7 - 3
     - click : + New action
     - Action type - Send e-mail
     - click : +Add - Add user - select : user
     - Subject - Greenhouse message
     - Body - Greenhouse temperature exceeded 40°C. Fan speed set to 3.
     - click : next step
     - Rule name - Greenhouse rule
     - Description - If greenhouse temperature exceeds 40°C fan speed will be set to 3
     - Rule status - ON
     - click : Create rule
 - Add reports (ClickCloud -> Reports -> Create new report) - OPTIONAL
   - Enter the name of the report - Greenhouse temperature report
   - click : Temperature
   - click : Next step
   - select : Temp sensor (under : Greenhouse device)

## Instructions - software

 - Download and instal 'MikroC PRO for ARM' compiler
 - Download Greenhouse demo project
 - Format microSD cart to FAT format
 - Start 'MikroC PRO for ARM'
 - Instal packages for:
   - mikroSDK
   - G2C click
   - Temp-Hum 6 click
   - UV 3 click
   - Fan 3 click
   - Servo click
 - Open Greenhouse demo project
 - Replace "Network_Name", "Network_Password", "Device_Key" and "Device_Password"
 - Build the project
 - Copy 'Mikromed.RES' file from project folder to microSD card
 - Program Greenhouse demo project to 'mikromedia 7 for STM32F7 ARM'

## Project and click ranges 

 - G2C click board
   - Operating temperature - (-40℃ to 85℃)
   - Operating voltage - (3.0V to 3.6V)
 - Temp&Hum 6 click board
   - Operating temperature - (–40°C to 100°C)
   - Operating voltage - (1.71V to 3.60V)  
   - Operating current - Continuous run mode - (max. 61μA)
 - UV 3 click board
   - Operating temperature - (–40°C to 85°C)
   - Operating voltage - (2.7V to 5.5V)
   - Operating current - (max. 250μA)
 - FAN 3 click board
   - Operating temperature - (-40°C to 85°C)
   - Operating voltage - (2.7V to 3.6V)
   - Operating current - (max. 6μA) 
 - Servo click board
   - Operating temperature - (–40°C to 85°C)
   - Operating voltage - (2.3V to 5.5V)

## Project Test 

 Firmware tested for 24 hours in room conditions. Constant temperature, humidity and UV monitoring with occasional fan speed, servo number and servo position changes issued via ClickCloud and mikromedia touch panel.

## Project upgrades

 This is a proof of concept used for small scale greenhouses.
 This projects functionality can be extended by adding new cloud rules and by adding new cloud reports.
 The main idea is to transform this project to control high power servo motors, fans and watering system valves in order to control large scale greenhouse conditions.
 High power servo motor drives can be controlled via RS485 click boards.
 Watering system valve solenoids can be open or closed with relay click boards.
 Watering system valve positions can be controlled by stepper click boards if more valve position controll is required.
 Sensor data can be transmited to a single controller(e.g. mikromedia) via LoRa click boards.

---
---