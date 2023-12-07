/** @file
 *
 *  Differentiated System Description Table Fields (DSDT)
 *
 *  Copyright (c) 2023, Academy of Intelligent Innovation, Shandong Universiy, China.P.R. All rights reserved.<BR>
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/

Scope(_SB)
{
  // GPIO
  Device(GPO0) {
    Name(_HID, "SG200010")
    Name(_CID, "HISI0181")
    Name(_ADR, 0)
    Name(_UID, 0)

    Name (_CRS, ResourceTemplate ()  {
      QWordMemory (
        ResourceConsumer,
        ,
        MinFixed,
        MaxFixed,
        NonCacheable,
        ReadWrite,
        0x0,
        0x7030009000,
        0x70300093FF,
        0x0,
        0x400
      )
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive,,,) { 96 }
    })

    Device(PRTa) {
      Name(_ADR, 0)
      Name(_UID, 0)
      Name(_DSD, Package () {
        ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
        Package () {
          Package () {"bank-name", "port0a"},
          Package () {"reg", 0},
          Package () {"snps,nr-gpios", 32},
        }
      })
    }
  }

  Device(GPO1) {
    Name(_HID, "SG200010")
    Name(_CID, "HISI0181")
    Name(_ADR, 0)
    Name(_UID, 1)

    Name (_CRS, ResourceTemplate ()  {
      QWordMemory (
        ResourceConsumer,
        ,
        MinFixed,
        MaxFixed,
        NonCacheable,
        ReadWrite,
        0x0,
        0x703000a000,
        0x703000a3FF,
        0x0,
        0x400
      )
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive,,,) { 97 }
    })

    Device(PRTa) {
      Name(_ADR, 0)
      Name(_UID, 0)
      Name(_DSD, Package () {
        ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
        Package () {
          Package () {"bank-name", "port0a"},
          Package () {"reg", 0},
          Package () {"snps,nr-gpios", 32},
        }
      })
    }
  }

  Device(GPO2) {
    Name(_HID, "SG200010")
    Name(_CID, "HISI0181")
    Name(_ADR, 0)
    Name(_UID, 2)

    Name (_CRS, ResourceTemplate ()  {
      QWordMemory (
        ResourceConsumer,
        ,
        MinFixed,
        MaxFixed,
        NonCacheable,
        ReadWrite,
        0x0,
        0x703000b000,
        0x703000b3FF,
        0x0,
        0x400
      )
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive,,,) { 98 }
    })

    Device(PRTa) {
      Name(_ADR, 0)
      Name(_UID, 0)
      Name(_DSD, Package () {
        ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
        Package () {
          Package () {"bank-name", "port0a"},
          Package () {"reg", 0},
          Package () {"snps,nr-gpios", 32},
        }
      })
    }
  }

  //  I2C for 100k release
  Device(I2C0) {
    Name(_HID, "SG200011")
    Name(_CID, "HISI02A2")
    Name(_UID, 0)
    Name(_DSD, Package () {
      ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
      Package () {
        Package () {"clock-frequency", 100000},
      }
    })

    Name (_CRS, ResourceTemplate ()  {
      QWordMemory (
        ResourceConsumer,
        ,
        MinFixed,
        MaxFixed,
        NonCacheable,
        ReadWrite,
        0x0,
        0x7030005000,
        0x7030005FFF,
        0x0,
        0x1000
      )
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive,,,) { 101 }
    })
  }

  Device(I2C1) {
    Name(_HID, "SG200011")
    Name(_CID, "HISI02A2")
    Name(_UID, 1)
    Name(_DSD, Package () {
      ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
      Package () {
        Package () {"clock-frequency", 100000},
      }
    })

    Name (_CRS, ResourceTemplate ()  {
      QWordMemory (
        ResourceConsumer,
        ,
        MinFixed,
        MaxFixed,
        NonCacheable,
        ReadWrite,
        0x0,
        0x7030006000,
        0x7030006FFF,
        0x0,
        0x1000
      )
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive,,,) { 102 }
    })
  }

  Device(I2C2) {
    Name(_HID, "SG200011")
    Name(_CID, "HISI02A2")
    Name(_UID, 2)
    Name(_DSD, Package () {
      ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
      Package () {
        Package () {"clock-frequency", 100000},
      }
    })

    Name (_CRS, ResourceTemplate ()  {
      QWordMemory (
        ResourceConsumer,
        ,
        MinFixed,
        MaxFixed,
        NonCacheable,
        ReadWrite,
        0x0,
        0x7030007000,
        0x7030007FFF,
        0x0,
        0x1000
      )
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive,,,) { 103 }
    })
  }

  Device(I2C3) {
    Name(_HID, "SG200011")
    Name(_CID, "HISI02A2")
    Name(_UID, 3)
    Name(_DSD, Package () {
      ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
      Package () {
        Package () {"clock-frequency", 100000},
      }
    })

    Name (_CRS, ResourceTemplate ()  {
      QWordMemory (
        ResourceConsumer,
        ,
        MinFixed,
        MaxFixed,
        NonCacheable,
        ReadWrite,
        0x0,
        0x7030008000,
        0x7030008FFF,
        0x0,
        0x1000
      )
      Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive,,,) { 104 }
    })
  }

  // PWM Driver
  Device (PWM0) {
    Name (_HID, "SG200005")
    Name (_UID, 0)
    Name (_CCA, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Name (_CRS, ResourceTemplate () {   // _CRS: Current Resource Settings
      QWordMemory (
        ResourceConsumer, PosDecode,
        MinFixed, MaxFixed,
        NonCacheable, ReadWrite,
        0x0,                       // Granularity
        0x703000C000,              // Min Base Address
        0x703000C01F,              // Max Base Address
        0x0,                       // Translate
        0x0000000020               // Length
      )
    })

    Name (_DSD, Package () {
      ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
      Package () {
            Package () { "pwm-num", 0x2 },
            Package () { "no-polarity", 0x1  },
      }
    })
  }

  Device (TAC0) {
    Name (_HID, "SG200004")
    Name (_UID, 0x00)
    Name (_CRS, ResourceTemplate () {   // _CRS: Current Resource Settings
      QWordMemory (
        ResourceConsumer, PosDecode,
        MinFixed, MaxFixed,
        NonCacheable, ReadWrite,
        0x0,                       // Granularity
        0x703000C020,              // Min Base Address
        0x703000C027,              // Max Base Address
        0x0,                       // Translate
        0x0000000008               // Length
      )
    })
  }

  Device (TAC1) {
    Name (_HID, "SG200004")
    Name (_UID, 0x01)
    Name (_CRS, ResourceTemplate () {   // _CRS: Current Resource Settings
      QWordMemory (
        ResourceConsumer, PosDecode,
        MinFixed, MaxFixed,
        NonCacheable, ReadWrite,
        0x0,                       // Granularity
        0x703000C028,              // Min Base Address
        0x703000C02F,              // Max Base Address
        0x0,                       // Translate
        0x0000000008               // Length
      )
    })
  }

  Device (SPI0) {
    Name (_HID, "SG200006")
    Name (_CID, "HISI0173")
    Name (_UID, 0x0)
    Method (_STA)
    {
      Return (0xf)
    }

    Name (_CRS, ResourceTemplate () {
      QWordMemory (
        ResourceConsumer, PosDecode,
        MinFixed, MaxFixed,
        NonCacheable, ReadWrite,
        0x0,                       // Granularity
        0x7040004000,              // Min Base Address
        0x7040004FFF,              // Max Base Address
        0x0,                       // Translate
        0x0000001000               // Length
      )
      Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 110 }
    })

    Name (_DSD, Package ()  // _DSD: Device-Specific Data
    {
      ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
      Package () {
        Package (2) { "clock-frequency", 250000000 },
        Package (2) { "num-cs", 2 },
      }
    })
  }

  Device (SPI1) {
    Name (_HID, "SG200006")
    Name (_CID, "HISI0173")
    Name (_UID, 0x1)
    Method (_STA)
    {
      Return (0xf)
    }

    Name (_CRS, ResourceTemplate () {
      QWordMemory (
        ResourceConsumer, PosDecode,
        MinFixed, MaxFixed,
        NonCacheable, ReadWrite,
        0x0,                       // Granularity
        0x7040005000,              // Min Base Address
        0x7040005FFF,              // Max Base Address
        0x0,                       // Translate
        0x0000001000               // Length
      )
      Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 111 }
    })

    Name (_DSD, Package ()  // _DSD: Device-Specific Data
    {
      ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
      Package () {
        Package (2) { "clock-frequency", 250000000 },
        Package (2) { "num-cs", 2 },
      }
    })
  }
}