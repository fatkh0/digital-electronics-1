## Preparation tasks (done before the lab at home)

A common way to control multiple displays is to gradually switch between them. We control (connect to supply voltage) only one of the displays at a time, as can be seen [here](https://engineeringtutorial.com/seven-segment-display-working-principle/).

Due to the physiological properties of human vision, it is necessary that the time required to display the whole value is a maximum of 16&nbsp;ms. If we display four digits, then the duration of one of them is 4&nbsp;ms. If we display eight digits, the time is reduced to 2&nbsp;ms, etc.

1. See [schematic](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board, find out the connection of 7-segment displays, and complete the signal timing to display four-digit value `3.142`.

  ![https://lastminuteengineers.com/seven-segment-arduino-tutorial/](../04-segment/images/7-Segment-Display-Number-Formation-Segment-Contol.png)
  
  ![Nexys](images/nexys.png)

  ![Timing of seven-segment display](images/wavedrom_7-segment-1.png)

 
