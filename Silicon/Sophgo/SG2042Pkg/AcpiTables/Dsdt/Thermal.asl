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
  PowerResource (FN1L, 0x00, 0x0000)
  {
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {

    }

    Method (_ON, 0, NotSerialized)  // _ON_: Power On
    {

    }

    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
    {

    }
  }

  Device (FAN0)
  {
    Name (_HID, EisaId ("PNP0C0B") /* Fan (Thermal Solution) */)  // _HID: Hardware ID
    Name (_UID, Zero)  // _UID: Unique ID
    Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
    {
      FN1L
    })
  }

  Device (FAN1)
  {
    Name (_HID, EisaId ("PNP0C0B") /* Fan (Thermal Solution) */)  // _HID: Hardware ID
    Name (_UID, 1)  // _UID: Unique ID
    Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
    {
      FN1L
    })
  }

  Device (FAN2)
  {
    Name (_HID, EisaId ("PNP0C0B") /* Fan (Thermal Solution) */)  // _HID: Hardware ID
    Name (_UID, 2)  // _UID: Unique ID
    Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
    {
      FN1L
    })
  }

  Device (FAN3)
  {
    Name (_HID, EisaId ("PNP0C0B") /* Fan (Thermal Solution) */)  // _HID: Hardware ID
    Name (_UID, 3)  // _UID: Unique ID
    Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
    {
      FN1L
    })
  }

  ThermalZone (THM0)
  {
    Name (_STR, Unicode ("system-thermal-zone-0"))  // _STR: Description String
    Name (_TZP, 0x96)  // _TZP: Thermal Zone Polling
    Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
    Name (_TC1, One)  // _TC1: Thermal Constant 1
    Name (_TC2, One)  // _TC2: Thermal Constant 2

    Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
    {
      Return (TRP0) /* \_TZ_.TRP0 */
    }

    Method (_AC1, 0, Serialized)  // _ACx: Active Cooling, x=0-9
    {
      Return (TRP1) /* \_TZ_.TRP1 */
    }

    Method (_AC2, 0, Serialized)  // _ACx: Active Cooling, x=0-9
    {
      Return (TRP1) /* \_TZ_.TRP1 */
    }

    Method (_AC3, 0, Serialized)  // _ACx: Active Cooling, x=0-9
    {
      Return (TRP1) /* \_TZ_.TRP1 */
    }

    Name (_AL0, Package (0x01)  // _ALx: Active List, x=0-9
    {
      FAN1
    })
    Name (_AL1, Package (0x01)  // _ALx: Active List, x=0-9
    {
      FAN0
    })

    Name (_AL2, Package (0x01)  // _ALx: Active List, x=0-9
    {
      FAN0
    })

    Name (_AL3, Package (0x01)  // _ALx: Active List, x=0-9
    {
      FAN0
    })

    Method (_SCP, 1, NotSerialized)  // _SCP: Set Cooling Policy
    {

    }

    Method (_TMP, 0, Serialized)  // _TMP: Temperature
    {

    }

    Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
    {
      Return (TRPC) /* \_TZ_.TRPC */
    }
  }

  ThermalZone (THM1)
  {
    Name (_STR, Unicode ("system-thermal-zone-1"))  // _STR: Description String
    Name (_TZP, 0x96)  // _TZP: Thermal Zone Polling
    Name (_TSP, 0x32)  // _TSP: Thermal Sampling Period
    Name (_TC1, One)  // _TC1: Thermal Constant 1
    Name (_TC2, One)  // _TC2: Thermal Constant 2
    Method (_AC0, 0, Serialized)  // _ACx: Active Cooling, x=0-9
    {
      Return (TRP2) /* \_TZ_.TRP2 */
    }

    Name (_AL0, Package (0x01)  // _ALx: Active List, x=0-9
    {
      FAN2
    })

    Method (_TMP, 0, Serialized)  // _TMP: Temperature
    {

    }

    Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
    {
      Return (TRPC) /* \_TZ_.TRPC */
    }
  }
}