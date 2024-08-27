/** @file
*  Differentiated System Description Table Fields (DSDT)
*
*  Copyright (c) 2023, Academy of Intelligent Innovation, Shandong Universiy, China.P.R. All rights reserved.<BR>
*
*  SPDX-License-Identifier: BSD-2-Clause-Patent
*
**/

#include "SG2042AcpiHeader.h"

DefinitionBlock ("DsdtTable.aml", "DSDT", 2, "SOPHGO", "2042    ",
                 EFI_ACPI_RISCV_OEM_REVISION) {
  include ("Cpu.asl")
  include ("CommonDevices.asl")
  include ("Clk.asl")
  include ("Uart.asl")
  include ("Mmc.asl")
  include ("Ethernet.asl")
  include ("Intc.asl")
  include ("Pci.asl")
  //include ("Thermal.asl")

  Scope (\_SB_.I2C1)
  {
    Device (MCU0) {
      Name (_HID, "SGPH0022")
      Method(_STA, 0, NotSerialized) {
        Return (0x0f)
      }
      Method(_ADR) {
        Return(0x17) // MCU slave address
      }
      Method (_CRS, 0, Serialized)
      {
        Return (SDB0)
      }
      Name (_DSD, Package () {
        ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
        Package () {
          Package (0x02) { "reg", 0x17 },
        }
      })

      Name (SDB0, ResourceTemplate () {
        I2cSerialBusV2 (0x17, ControllerInitiated, 0x000186A0, AddressingMode7Bit, "\\_SB.I2C1", 0, ResourceConsumer,,)
      })

      OperationRegion (OPR0, GenericSerialBus, Zero, 0x0100)
      Field (OPR0, BufferAcc, NoLock, Preserve)
      {
        Connection (SDB0),
        Offset(0x4),
        AccessAs (BufferAcc, AttribByte),
        FLD0, 8, // Field for accessing temperature registers
      }

      OperationRegion (OPR1, GenericSerialBus, Zero, 0x0100)
      Field (OPR1, BufferAcc, NoLock, Preserve)
      {
        Connection (SDB0),
        Offset(0x5),
        AccessAs (BufferAcc, AttribByte),
        FLD1, 8, // Field for accessing temperature registers
      }

      Name (BUFF, Buffer(3) {})
      CreateByteField (BUFF, Zero, STAT)
      CreateByteField (BUFF, 0x2, DATA)

      Method(STMP, 0, NotSerialized) 
      {
        Local0 = Zero

        BUFF = FLD0

        If (STAT == Zero)
        {
          Local0 = DATA
        }

        Return (Local0)
      }

      Method(BTMP, 0, NotSerialized) 
      {
        Local0 = Zero

        BUFF = FLD1

        If (STAT == Zero)
        {
          Local0 = DATA
        }

        Return (Local0)
      }
    }
  }
}
