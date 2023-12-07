/** @file
*  Differentiated System Description Table Fields (DSDT)
*
*  Copyright (c) 2023, Academy of Intelligent Innovation, Shandong Universiy, China.P.R. All rights reserved.<BR>
*
*  SPDX-License-Identifier: BSD-2-Clause-Patent
*
**/

#include "SG2042AcpiHeader.h"

DefinitionBlock ("DsdtTable.aml", "DSDT", 2, "SOPHGO", "SG20    ",
                 EFI_ACPI_RISCV_OEM_REVISION) {
  include ("Cpu.asl")
  include ("Com.asl")
  include ("Uart.asl")
  include ("Mmc.asl")
  //include ("Eth.asl")
  include ("Intc.asl")
  include ("Pci.asl")
}
