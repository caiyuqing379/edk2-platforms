/** @file
*  Differentiated System Description Table Fields (DSDT)
*
*  Copyright (c) 2023, Academy of Intelligent Innovation, Shandong Universiy, China.P.R. All rights reserved.<BR>
*
*  SPDX-License-Identifier: BSD-2-Clause-Patent
*
**/

Scope (_TZ)
{
    Name(TRP0, 400)
    Name(TRP1, 580)
    Name(TRP2, 700)
    Name(TRP3, 850)
    Name(TRP4, 750)
    Name(TRPC, 2733)
    Name(PLC0, One)

    Device (PWMF)
    {
      Name (_HID, "SGPH0030")  // _HID: Hardware ID
      Name (_UID, Zero)        // _UID: Unique ID

      Name(_DSD, Package () {
        ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
        Package () {
          Package () { "compatible", Package () { "pwm-fan" } },
          Package () { "pwms", Package () { \_SB.PWM0, 0, 40000, \_SB.PWM0, 1, 40000} },
          Package () { "pwm-names", Package () { "pwm0", "pwm1"} },
          Package () { "pwm_inuse", Package () { "pwm0" } },
          Package () { "#cooling-cells", 2 },
          Package () { "cooling-levels", Package() { 102, 127, 178, 229, 254 } },
        }
      })
    }

    ThermalZone (THM0)
    {
      Name (_STR, Unicode ("system-thermal-zone-0"))  // _STR: Description String
      Name (_TZP, 0xA)   // _TZP: Thermal Zone Polling, 1000ms
      Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
      Name (_TC1, One)   // _TC1: Thermal Constant 1
      Name (_TC2, One)   // _TC2: Thermal Constant 2

      Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
      {
        Return (TRP0)
      }

      Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
      {
        Return (TRP1)
      }

      Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
      {
        Return (TRP2)
      }

      Method (_AC3, 0, Serialized)  // _ACx: Active Cooling, x=0-9
      {
        Return (TRP3)
      }

      Name (_AL0, Package (0x01)  // _ALx: Active List, x=0-9
      {
        PWMF
      })
    
      Name (_AL1, Package (0x01)  // _ALx: Active List, x=0-9
      {
        PWMF
      })

      Name (_AL2, Package (0x01)  // _ALx: Active List, x=0-9
      {
        PWMF
      })

      Name (_AL3, Package (0x01)  // _ALx: Active List, x=0-9
      {
        PWMF
      })

      Method (_SCP, 1, NotSerialized)  // _SCP: Set Cooling Policy
      {
        If (Arg0)
        {
          PLC0 = One
        }
        Else
        {
          PLC0 = Zero
        }

        Notify (THM0, 0X81) // Thermal Trip Point Change
      }

      Method (_TMP, 0, Serialized)  // _TMP: Temperature
      {
        Return (\_SB.I2C1.MCU0.STMP())
      }

      Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
      {
        Return (TRPC)
      }
    }

    ThermalZone (THM1)
    {
      Name (_STR, Unicode ("system-thermal-zone-1"))  // _STR: Description String
      Name (_TZP, 0xA)   // _TZP: Thermal Zone Polling
      Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
      Name (_TC1, One)   // _TC1: Thermal Constant 1
      Name (_TC2, One)   // _TC2: Thermal Constant 2
      Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
      {
        Return (TRP2)
      }

      Name (_AL0, Package (0x01)  // _ALx: Active List, x=0-9
      {
        PWMF
      })

      Method (_SCP, 1, NotSerialized)  // _SCP: Set Cooling Policy
      {
        If (Arg0)
        {
          PLC0 = One
        }
        Else
        {
          PLC0 = Zero
        }

        Notify (THM1, 0X81) // Thermal Trip Point Change
      }

      Method (_TMP, 0, Serialized)  // _TMP: Temperature
      {
        Return (\_SB.I2C1.MCU0.BTMP())
      }

      Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
      {
        Return (TRPC)
      }
    }
}