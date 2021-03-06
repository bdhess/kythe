def generated_llvm_build_targets(ctx):
    ctx.group(ctx, name = "Miscellaneous", parent = "$ROOT")
    ctx.group(ctx, name = "Bindings", parent = "$ROOT")
    ctx.group(ctx, name = "Docs", parent = "$ROOT")
    ctx.group(ctx, name = "Examples", parent = "$ROOT")
    ctx.group(ctx, name = "Libraries", parent = "$ROOT")
    ctx.library(ctx, name = "Analysis", parent = "Libraries", required_libraries = ["BinaryFormat", "Core", "Object", "ProfileData", "Support"])
    ctx.library(ctx, required_libraries = ["BinaryFormat", "Core", "Support"], name = "AsmParser", parent = "Libraries")
    ctx.group(ctx, name = "Bitcode", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["BitstreamReader", "Core", "Support"], name = "BitReader", parent = "Bitcode")
    ctx.library(ctx, name = "BitWriter", parent = "Bitcode", required_libraries = ["Analysis", "Core", "MC", "Object", "Support"])
    ctx.group(ctx, name = "Bitstream", parent = "Libraries")
    ctx.library(ctx, name = "BitstreamReader", parent = "Bitstream", required_libraries = ["Support"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Analysis", "BitReader", "BitWriter", "Core", "MC", "ProfileData", "Scalar", "Support", "Target", "TransformUtils"], name = "CodeGen")
    ctx.library(ctx, name = "AsmPrinter", parent = "Libraries", required_libraries = ["Analysis", "BinaryFormat", "CodeGen", "Core", "DebugInfoCodeView", "DebugInfoDWARF", "DebugInfoMSF", "MC", "MCParser", "Remarks", "Support", "Target"])
    ctx.library(ctx, parent = "CodeGen", required_libraries = ["Analysis", "CodeGen", "Core", "MC", "Support", "Target", "TransformUtils"], name = "SelectionDAG")
    ctx.library(ctx, name = "MIRParser", parent = "CodeGen", required_libraries = ["AsmParser", "BinaryFormat", "CodeGen", "Core", "MC", "Support", "Target"])
    ctx.library(ctx, name = "GlobalISel", parent = "CodeGen", required_libraries = ["Analysis", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils"])
    ctx.group(ctx, parent = "$ROOT", name = "DebugInfo")
    ctx.library(ctx, required_libraries = ["BinaryFormat", "Object", "MC", "Support"], name = "DebugInfoDWARF", parent = "DebugInfo")
    ctx.library(ctx, name = "DebugInfoGSYM", parent = "DebugInfo", required_libraries = ["MC", "Object", "Support", "DebugInfoDWARF"])
    ctx.library(ctx, parent = "DebugInfo", required_libraries = ["Support"], name = "DebugInfoMSF")
    ctx.library(ctx, required_libraries = ["Support", "DebugInfoMSF"], name = "DebugInfoCodeView", parent = "DebugInfo")
    ctx.library(ctx, required_libraries = ["BinaryFormat", "Object", "Support", "DebugInfoCodeView", "DebugInfoMSF"], name = "DebugInfoPDB", parent = "DebugInfo")
    ctx.library(ctx, name = "Symbolize", parent = "DebugInfo", required_libraries = ["DebugInfoDWARF", "DebugInfoPDB", "Object", "Support", "Demangle"])
    ctx.library(ctx, name = "Demangle", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["DebugInfoDWARF", "AsmPrinter", "CodeGen", "MC", "Object", "Support"], name = "DWARFLinker", parent = "Libraries")
    ctx.library(ctx, name = "ExecutionEngine", parent = "Libraries", required_libraries = ["Core", "MC", "Object", "RuntimeDyld", "Support", "Target"])
    ctx.library(ctx, name = "Interpreter", parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "ExecutionEngine", "Support"])
    ctx.library(ctx, name = "MCJIT", parent = "ExecutionEngine", required_libraries = ["Core", "ExecutionEngine", "Object", "RuntimeDyld", "Support", "Target"])
    ctx.library(ctx, name = "JITLink", parent = "ExecutionEngine", required_libraries = ["BinaryFormat", "Object", "Support"])
    ctx.library(ctx, required_libraries = ["MC", "Object", "Support"], name = "RuntimeDyld", parent = "ExecutionEngine")
    ctx.optional_library(ctx, name = "IntelJITEvents", parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "DebugInfoDWARF", "Support", "Object", "ExecutionEngine"])
    ctx.optional_library(ctx, parent = "ExecutionEngine", required_libraries = ["DebugInfoDWARF", "Support", "Object", "ExecutionEngine"], name = "OProfileJIT")
    ctx.library(ctx, parent = "ExecutionEngine", required_libraries = ["Core", "ExecutionEngine", "JITLink", "Object", "OrcError", "MC", "Passes", "RuntimeDyld", "Support", "Target", "TransformUtils"], name = "OrcJIT")
    ctx.library(ctx, name = "OrcError", parent = "ExecutionEngine", required_libraries = ["Support"])
    ctx.optional_library(ctx, name = "PerfJITEvents", parent = "ExecutionEngine", required_libraries = ["CodeGen", "Core", "DebugInfoDWARF", "ExecutionEngine", "Object", "Support"])
    ctx.library(ctx, name = "Extensions", parent = "Libraries", required_libraries = [])
    ctx.group(ctx, name = "Frontend", parent = "Libraries")
    ctx.library(ctx, parent = "Frontend", required_libraries = ["Core", "Support", "TransformUtils"], name = "FrontendOpenMP")
    ctx.library(ctx, name = "FuzzMutate", parent = "Libraries", required_libraries = ["Analysis", "BitReader", "BitWriter", "Core", "Scalar", "Support", "Target"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Support"], name = "LineEditor")
    ctx.library(ctx, required_libraries = ["Core", "Support", "TransformUtils"], name = "Linker", parent = "Libraries")
    ctx.library(ctx, name = "Core", parent = "Libraries", required_libraries = ["BinaryFormat", "Remarks", "Support"])
    ctx.library(ctx, required_libraries = ["AsmParser", "BitReader", "Core", "Support"], name = "IRReader", parent = "Libraries")
    ctx.library(ctx, required_libraries = ["AggressiveInstCombine", "Analysis", "BinaryFormat", "BitReader", "BitWriter", "CodeGen", "Core", "Extensions", "IPO", "InstCombine", "Linker", "MC", "ObjCARC", "Object", "Passes", "Remarks", "Scalar", "Support", "Target", "TransformUtils"], name = "LTO", parent = "Libraries")
    ctx.library(ctx, name = "MC", parent = "Libraries", required_libraries = ["Support", "BinaryFormat", "DebugInfoCodeView"])
    ctx.library(ctx, name = "MCDisassembler", parent = "MC", required_libraries = ["MC", "Support"])
    ctx.library(ctx, required_libraries = ["MC", "Support"], name = "MCParser", parent = "MC")
    ctx.library(ctx, required_libraries = ["MC", "Support"], name = "MCA", parent = "Libraries")
    ctx.library(ctx, name = "Object", parent = "Libraries", required_libraries = ["BitReader", "Core", "MC", "BinaryFormat", "MCParser", "Support", "TextAPI"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Support"], name = "BinaryFormat")
    ctx.library(ctx, name = "ObjectYAML", parent = "Libraries", required_libraries = ["Object", "Support", "DebugInfoCodeView", "MC"])
    ctx.library(ctx, required_libraries = ["Support"], name = "Option", parent = "Libraries")
    ctx.library(ctx, name = "Remarks", parent = "Libraries", required_libraries = ["BitstreamReader", "Support"])
    ctx.library(ctx, name = "Passes", parent = "Libraries", required_libraries = ["AggressiveInstCombine", "Analysis", "CodeGen", "Core", "Coroutines", "IPO", "InstCombine", "Scalar", "Support", "Target", "TransformUtils", "Vectorize", "Instrumentation"])
    ctx.library(ctx, name = "ProfileData", parent = "Libraries", required_libraries = ["Core", "Support"])
    ctx.library(ctx, name = "Coverage", parent = "ProfileData", required_libraries = ["Core", "Object", "ProfileData", "Support"])
    ctx.library(ctx, name = "Support", parent = "Libraries", required_libraries = ["Demangle"])
    ctx.library(ctx, required_libraries = ["Support"], name = "TableGen", parent = "Libraries")
    ctx.library(ctx, name = "TextAPI", parent = "Libraries", required_libraries = ["Support", "BinaryFormat"])
    ctx.library_group(ctx, name = "Engine", parent = "Libraries")
    ctx.library_group(ctx, name = "Native", parent = "Libraries")
    ctx.library_group(ctx, parent = "Libraries", name = "NativeCodeGen")
    ctx.library(ctx, required_libraries = ["Analysis", "Core", "MC", "Support"], name = "Target", parent = "Libraries")
    ctx.library_group(ctx, name = "all-targets", parent = "Libraries")
    ctx.target_group(ctx, name = "AArch64", parent = "Target")
    ctx.library(ctx, required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "GlobalISel", "CFGuard"], add_to_library_groups = ["AArch64"], name = "AArch64CodeGen", parent = "AArch64")
    ctx.library(ctx, required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "MC", "MCParser", "Support"], add_to_library_groups = ["AArch64"], name = "AArch64AsmParser", parent = "AArch64")
    ctx.library(ctx, add_to_library_groups = ["AArch64"], name = "AArch64Disassembler", parent = "AArch64", required_libraries = ["AArch64Desc", "AArch64Info", "AArch64Utils", "MC", "MCDisassembler", "Support"])
    ctx.library(ctx, name = "AArch64Desc", parent = "AArch64", required_libraries = ["AArch64Info", "AArch64Utils", "MC", "BinaryFormat", "Support"], add_to_library_groups = ["AArch64"])
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["AArch64"], name = "AArch64Info", parent = "AArch64")
    ctx.library(ctx, name = "AArch64Utils", parent = "AArch64", required_libraries = ["Support"], add_to_library_groups = ["AArch64"])
    ctx.target_group(ctx, parent = "Target", name = "AMDGPU")
    ctx.library(ctx, parent = "AMDGPU", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "IPO", "MC", "AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "Vectorize", "GlobalISel", "BinaryFormat", "MIRParser"], add_to_library_groups = ["AMDGPU"], name = "AMDGPUCodeGen")
    ctx.library(ctx, add_to_library_groups = ["AMDGPU"], name = "AMDGPUAsmParser", parent = "AMDGPU", required_libraries = ["MC", "MCParser", "AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "Support"])
    ctx.library(ctx, name = "AMDGPUDisassembler", parent = "AMDGPU", required_libraries = ["AMDGPUDesc", "AMDGPUInfo", "AMDGPUUtils", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, add_to_library_groups = ["AMDGPU"], name = "AMDGPUDesc", parent = "AMDGPU", required_libraries = ["Core", "MC", "AMDGPUInfo", "AMDGPUUtils", "Support", "BinaryFormat"])
    ctx.library(ctx, name = "AMDGPUInfo", parent = "AMDGPU", required_libraries = ["Support"], add_to_library_groups = ["AMDGPU"])
    ctx.library(ctx, required_libraries = ["Core", "MC", "BinaryFormat", "Support"], add_to_library_groups = ["AMDGPU"], name = "AMDGPUUtils", parent = "AMDGPU")
    ctx.target_group(ctx, name = "ARC", parent = "Target")
    ctx.library(ctx, parent = "ARC", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils", "ARCDesc", "ARCInfo"], add_to_library_groups = ["ARC"], name = "ARCCodeGen")
    ctx.library(ctx, parent = "ARC", required_libraries = ["MCDisassembler", "Support", "ARCInfo"], add_to_library_groups = ["ARC"], name = "ARCDisassembler")
    ctx.library(ctx, name = "ARCDesc", parent = "ARC", required_libraries = ["MC", "Support", "ARCInfo"], add_to_library_groups = ["ARC"])
    ctx.library(ctx, name = "ARCInfo", parent = "ARC", required_libraries = ["Support"], add_to_library_groups = ["ARC"])
    ctx.target_group(ctx, name = "ARM", parent = "Target")
    ctx.library(ctx, parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "GlobalISel", "ARMUtils", "TransformUtils", "CFGuard"], add_to_library_groups = ["ARM"], name = "ARMCodeGen")
    ctx.library(ctx, name = "ARMAsmParser", parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "MC", "MCParser", "Support", "ARMUtils"], add_to_library_groups = ["ARM"])
    ctx.library(ctx, add_to_library_groups = ["ARM"], name = "ARMDisassembler", parent = "ARM", required_libraries = ["ARMDesc", "ARMInfo", "MCDisassembler", "Support", "ARMUtils"])
    ctx.library(ctx, name = "ARMDesc", parent = "ARM", required_libraries = ["ARMInfo", "ARMUtils", "MC", "MCDisassembler", "Support", "BinaryFormat"], add_to_library_groups = ["ARM"])
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["ARM"], name = "ARMInfo", parent = "ARM")
    ctx.library(ctx, name = "ARMUtils", parent = "ARM", required_libraries = ["Support"], add_to_library_groups = ["ARM"])
    ctx.target_group(ctx, parent = "Target", name = "AVR")
    ctx.library(ctx, name = "AVRCodeGen", parent = "AVR", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "AVRDesc", "AVRInfo", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["AVR"])
    ctx.library(ctx, name = "AVRAsmParser", parent = "AVR", required_libraries = ["MC", "MCParser", "AVRDesc", "AVRInfo", "Support"], add_to_library_groups = ["AVR"])
    ctx.library(ctx, name = "AVRDisassembler", parent = "AVR", required_libraries = ["MCDisassembler", "AVRInfo", "Support"], add_to_library_groups = ["AVR"])
    ctx.library(ctx, name = "AVRDesc", parent = "AVR", required_libraries = ["MC", "AVRInfo", "Support"], add_to_library_groups = ["AVR"])
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["AVR"], name = "AVRInfo", parent = "AVR")
    ctx.target_group(ctx, name = "BPF", parent = "Target")
    ctx.library(ctx, name = "BPFCodeGen", parent = "BPF", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "BPFDesc", "BPFInfo", "SelectionDAG", "Support", "Target"], add_to_library_groups = ["BPF"])
    ctx.library(ctx, add_to_library_groups = ["BPF"], name = "BPFAsmParser", parent = "BPF", required_libraries = ["MC", "MCParser", "BPFDesc", "BPFInfo", "Support"])
    ctx.library(ctx, name = "BPFDisassembler", parent = "BPF", required_libraries = ["MCDisassembler", "BPFInfo", "Support"], add_to_library_groups = ["BPF"])
    ctx.library(ctx, parent = "BPF", required_libraries = ["MC", "BPFInfo", "Support"], add_to_library_groups = ["BPF"], name = "BPFDesc")
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["BPF"], name = "BPFInfo", parent = "BPF")
    ctx.target_group(ctx, name = "Hexagon", parent = "Target")
    ctx.library(ctx, name = "HexagonCodeGen", parent = "Hexagon", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "HexagonAsmParser", "HexagonDesc", "HexagonInfo", "IPO", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["Hexagon"])
    ctx.library(ctx, add_to_library_groups = ["Hexagon"], name = "HexagonAsmParser", parent = "Hexagon", required_libraries = ["MC", "MCParser", "Support", "HexagonDesc", "HexagonInfo"])
    ctx.library(ctx, add_to_library_groups = ["Hexagon"], name = "HexagonDisassembler", parent = "Hexagon", required_libraries = ["HexagonDesc", "HexagonInfo", "MC", "MCDisassembler", "Support"])
    ctx.library(ctx, name = "HexagonDesc", parent = "Hexagon", required_libraries = ["HexagonInfo", "MC", "Support"], add_to_library_groups = ["Hexagon"])
    ctx.library(ctx, add_to_library_groups = ["Hexagon"], name = "HexagonInfo", parent = "Hexagon", required_libraries = ["Support"])
    ctx.library(ctx, name = "LanaiCodeGen", parent = "Lanai", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "LanaiAsmParser", "LanaiDesc", "LanaiInfo", "MC", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["Lanai"])
    ctx.target_group(ctx, name = "Lanai", parent = "Target")
    ctx.library(ctx, name = "LanaiAsmParser", parent = "Lanai", required_libraries = ["MC", "MCParser", "Support", "LanaiDesc", "LanaiInfo"], add_to_library_groups = ["Lanai"])
    ctx.library(ctx, parent = "Lanai", required_libraries = ["LanaiDesc", "LanaiInfo", "MC", "MCDisassembler", "Support"], add_to_library_groups = ["Lanai"], name = "LanaiDisassembler")
    ctx.library(ctx, add_to_library_groups = ["Lanai"], name = "LanaiDesc", parent = "Lanai", required_libraries = ["LanaiInfo", "MC", "MCDisassembler", "Support"])
    ctx.library(ctx, add_to_library_groups = ["Lanai"], name = "LanaiInfo", parent = "Lanai", required_libraries = ["Support"])
    ctx.target_group(ctx, parent = "Target", name = "MSP430")
    ctx.library(ctx, add_to_library_groups = ["MSP430"], name = "MSP430CodeGen", parent = "MSP430", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "MSP430Desc", "MSP430Info", "SelectionDAG", "Support", "Target"])
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "MSP430Desc", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"], name = "MSP430AsmParser", parent = "MSP430")
    ctx.library(ctx, parent = "MSP430", required_libraries = ["MCDisassembler", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"], name = "MSP430Disassembler")
    ctx.library(ctx, name = "MSP430Desc", parent = "MSP430", required_libraries = ["MC", "MSP430Info", "Support"], add_to_library_groups = ["MSP430"])
    ctx.library(ctx, parent = "MSP430", required_libraries = ["Support"], add_to_library_groups = ["MSP430"], name = "MSP430Info")
    ctx.library(ctx, required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "MipsDesc", "MipsInfo", "SelectionDAG", "Support", "Target", "GlobalISel"], add_to_library_groups = ["Mips"], name = "MipsCodeGen", parent = "Mips")
    ctx.target_group(ctx, name = "Mips", parent = "Target")
    ctx.library(ctx, name = "MipsAsmParser", parent = "Mips", required_libraries = ["MC", "MCParser", "MipsDesc", "MipsInfo", "Support"], add_to_library_groups = ["Mips"])
    ctx.library(ctx, name = "MipsDisassembler", parent = "Mips", required_libraries = ["MCDisassembler", "MipsInfo", "Support"], add_to_library_groups = ["Mips"])
    ctx.library(ctx, parent = "Mips", required_libraries = ["MC", "MipsInfo", "Support"], add_to_library_groups = ["Mips"], name = "MipsDesc")
    ctx.library(ctx, name = "MipsInfo", parent = "Mips", required_libraries = ["Support"], add_to_library_groups = ["Mips"])
    ctx.library(ctx, required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "IPO", "MC", "NVPTXDesc", "NVPTXInfo", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "Vectorize"], add_to_library_groups = ["NVPTX"], name = "NVPTXCodeGen", parent = "NVPTX")
    ctx.target_group(ctx, name = "NVPTX", parent = "Target")
    ctx.library(ctx, name = "NVPTXDesc", parent = "NVPTX", required_libraries = ["MC", "NVPTXInfo", "Support"], add_to_library_groups = ["NVPTX"])
    ctx.library(ctx, name = "NVPTXInfo", parent = "NVPTX", required_libraries = ["Support"], add_to_library_groups = ["NVPTX"])
    ctx.target_group(ctx, name = "PowerPC", parent = "Target")
    ctx.library(ctx, required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "PowerPCDesc", "PowerPCInfo", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils"], add_to_library_groups = ["PowerPC"], name = "PowerPCCodeGen", parent = "PowerPC")
    ctx.library(ctx, parent = "PowerPC", required_libraries = ["MC", "MCParser", "PowerPCDesc", "PowerPCInfo", "Support"], add_to_library_groups = ["PowerPC"], name = "PowerPCAsmParser")
    ctx.library(ctx, required_libraries = ["MCDisassembler", "PowerPCInfo", "Support"], add_to_library_groups = ["PowerPC"], name = "PowerPCDisassembler", parent = "PowerPC")
    ctx.library(ctx, add_to_library_groups = ["PowerPC"], name = "PowerPCDesc", parent = "PowerPC", required_libraries = ["MC", "PowerPCInfo", "Support", "BinaryFormat"])
    ctx.library(ctx, parent = "PowerPC", required_libraries = ["Support"], add_to_library_groups = ["PowerPC"], name = "PowerPCInfo")
    ctx.target_group(ctx, name = "RISCV", parent = "Target")
    ctx.library(ctx, name = "RISCVCodeGen", parent = "RISCV", required_libraries = ["Analysis", "AsmPrinter", "Core", "CodeGen", "MC", "RISCVDesc", "RISCVInfo", "RISCVUtils", "SelectionDAG", "Support", "Target", "GlobalISel"], add_to_library_groups = ["RISCV"])
    ctx.library(ctx, add_to_library_groups = ["RISCV"], name = "RISCVAsmParser", parent = "RISCV", required_libraries = ["MC", "MCParser", "RISCVDesc", "RISCVInfo", "RISCVUtils", "Support"])
    ctx.library(ctx, name = "RISCVDisassembler", parent = "RISCV", required_libraries = ["MCDisassembler", "RISCVInfo", "Support"], add_to_library_groups = ["RISCV"])
    ctx.library(ctx, name = "RISCVInfo", parent = "RISCV", required_libraries = ["Support"], add_to_library_groups = ["RISCV"])
    ctx.library(ctx, required_libraries = ["MC", "RISCVInfo", "RISCVUtils", "Support"], add_to_library_groups = ["RISCV"], name = "RISCVDesc", parent = "RISCV")
    ctx.library(ctx, parent = "RISCV", required_libraries = ["Support"], add_to_library_groups = ["RISCV"], name = "RISCVUtils")
    ctx.target_group(ctx, name = "Sparc", parent = "Target")
    ctx.library(ctx, add_to_library_groups = ["Sparc"], name = "SparcCodeGen", parent = "Sparc", required_libraries = ["AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "SparcDesc", "SparcInfo", "Support", "Target"])
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "SparcDesc", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"], name = "SparcAsmParser", parent = "Sparc")
    ctx.library(ctx, name = "SparcDisassembler", parent = "Sparc", required_libraries = ["MCDisassembler", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"])
    ctx.library(ctx, parent = "Sparc", required_libraries = ["MC", "SparcInfo", "Support"], add_to_library_groups = ["Sparc"], name = "SparcDesc")
    ctx.library(ctx, add_to_library_groups = ["Sparc"], name = "SparcInfo", parent = "Sparc", required_libraries = ["Support"])
    ctx.target_group(ctx, parent = "Target", name = "SystemZ")
    ctx.library(ctx, parent = "SystemZ", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "SystemZDesc", "SystemZInfo", "Target"], add_to_library_groups = ["SystemZ"], name = "SystemZCodeGen")
    ctx.library(ctx, name = "SystemZAsmParser", parent = "SystemZ", required_libraries = ["MC", "MCParser", "Support", "SystemZDesc", "SystemZInfo"], add_to_library_groups = ["SystemZ"])
    ctx.library(ctx, parent = "SystemZ", required_libraries = ["MC", "MCDisassembler", "Support", "SystemZDesc", "SystemZInfo"], add_to_library_groups = ["SystemZ"], name = "SystemZDisassembler")
    ctx.library(ctx, required_libraries = ["MC", "Support", "SystemZInfo"], add_to_library_groups = ["SystemZ"], name = "SystemZDesc", parent = "SystemZ")
    ctx.library(ctx, parent = "SystemZ", required_libraries = ["Support"], add_to_library_groups = ["SystemZ"], name = "SystemZInfo")
    ctx.target_group(ctx, name = "VE", parent = "Target")
    ctx.library(ctx, required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "VEDesc", "VEInfo", "Support", "Target"], add_to_library_groups = ["VE"], name = "VECodeGen", parent = "VE")
    ctx.library(ctx, required_libraries = ["MC", "VEInfo", "Support"], add_to_library_groups = ["VE"], name = "VEDesc", parent = "VE")
    ctx.library(ctx, parent = "VE", required_libraries = ["Support"], add_to_library_groups = ["VE"], name = "VEInfo")
    ctx.target_group(ctx, name = "WebAssembly", parent = "Target")
    ctx.library(ctx, required_libraries = ["Analysis", "AsmPrinter", "BinaryFormat", "CodeGen", "Core", "MC", "Scalar", "SelectionDAG", "Support", "Target", "TransformUtils", "WebAssemblyDesc", "WebAssemblyInfo"], add_to_library_groups = ["WebAssembly"], name = "WebAssemblyCodeGen", parent = "WebAssembly")
    ctx.library(ctx, parent = "WebAssembly", required_libraries = ["MC", "MCParser", "WebAssemblyInfo", "Support"], add_to_library_groups = ["WebAssembly"], name = "WebAssemblyAsmParser")
    ctx.library(ctx, add_to_library_groups = ["WebAssembly"], name = "WebAssemblyDisassembler", parent = "WebAssembly", required_libraries = ["WebAssemblyDesc", "MCDisassembler", "WebAssemblyInfo", "Support", "MC"])
    ctx.library(ctx, parent = "WebAssembly", required_libraries = ["MC", "Support", "WebAssemblyInfo"], add_to_library_groups = ["WebAssembly"], name = "WebAssemblyDesc")
    ctx.library(ctx, required_libraries = ["Support"], add_to_library_groups = ["WebAssembly"], name = "WebAssemblyInfo", parent = "WebAssembly")
    ctx.target_group(ctx, name = "X86", parent = "Target")
    ctx.library(ctx, parent = "X86", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "X86Desc", "X86Info", "GlobalISel", "ProfileData", "CFGuard"], add_to_library_groups = ["X86"], name = "X86CodeGen")
    ctx.library(ctx, required_libraries = ["MC", "MCParser", "Support", "X86Desc", "X86Info"], add_to_library_groups = ["X86"], name = "X86AsmParser", parent = "X86")
    ctx.library(ctx, add_to_library_groups = ["X86"], name = "X86Disassembler", parent = "X86", required_libraries = ["MCDisassembler", "Support", "X86Info"])
    ctx.library(ctx, add_to_library_groups = ["X86"], name = "X86Desc", parent = "X86", required_libraries = ["MC", "MCDisassembler", "Support", "X86Info", "BinaryFormat"])
    ctx.library(ctx, name = "X86Info", parent = "X86", required_libraries = ["Support"], add_to_library_groups = ["X86"])
    ctx.target_group(ctx, name = "XCore", parent = "Target")
    ctx.library(ctx, parent = "XCore", required_libraries = ["Analysis", "AsmPrinter", "CodeGen", "Core", "MC", "SelectionDAG", "Support", "Target", "TransformUtils", "XCoreDesc", "XCoreInfo"], add_to_library_groups = ["XCore"], name = "XCoreCodeGen")
    ctx.library(ctx, name = "XCoreDisassembler", parent = "XCore", required_libraries = ["MCDisassembler", "Support", "XCoreInfo"], add_to_library_groups = ["XCore"])
    ctx.library(ctx, name = "XCoreDesc", parent = "XCore", required_libraries = ["MC", "Support", "XCoreInfo"], add_to_library_groups = ["XCore"])
    ctx.library(ctx, add_to_library_groups = ["XCore"], name = "XCoreInfo", parent = "XCore", required_libraries = ["Support"])
    ctx.library(ctx, parent = "Libraries", required_libraries = ["Support"], name = "TestingSupport")
    ctx.group(ctx, name = "ToolDrivers", parent = "Libraries")
    ctx.library(ctx, name = "DlltoolDriver", parent = "Libraries", required_libraries = ["Object", "Option", "Support"])
    ctx.library(ctx, name = "LibDriver", parent = "Libraries", required_libraries = ["BinaryFormat", "BitReader", "Object", "Option", "Support"])
    ctx.group(ctx, name = "Transforms", parent = "Libraries")
    ctx.library(ctx, name = "AggressiveInstCombine", parent = "Transforms", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"])
    ctx.library(ctx, name = "Coroutines", parent = "Transforms", required_libraries = ["Analysis", "Core", "IPO", "Scalar", "Support", "TransformUtils"])
    ctx.library(ctx, library_name = "ipo", required_libraries = ["AggressiveInstCombine", "Analysis", "BitReader", "BitWriter", "Core", "FrontendOpenMP", "InstCombine", "IRReader", "Linker", "Object", "ProfileData", "Scalar", "Support", "TransformUtils", "Vectorize", "Instrumentation"], name = "IPO", parent = "Transforms")
    ctx.library(ctx, parent = "Transforms", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"], name = "InstCombine")
    ctx.library(ctx, name = "Instrumentation", parent = "Transforms", required_libraries = ["Analysis", "Core", "MC", "Support", "TransformUtils", "ProfileData"])
    ctx.library(ctx, parent = "Transforms", library_name = "ScalarOpts", required_libraries = ["AggressiveInstCombine", "Analysis", "Core", "InstCombine", "Support", "TransformUtils"], name = "Scalar")
    ctx.library(ctx, name = "TransformUtils", parent = "Transforms", required_libraries = ["Analysis", "Core", "Support"])
    ctx.library(ctx, parent = "Transforms", library_name = "Vectorize", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"], name = "Vectorize")
    ctx.library(ctx, name = "ObjCARC", parent = "Transforms", library_name = "ObjCARCOpts", required_libraries = ["Analysis", "Core", "Support", "TransformUtils"])
    ctx.library(ctx, parent = "Transforms", required_libraries = ["Core", "Support"], name = "CFGuard")
    ctx.library(ctx, name = "WindowsManifest", parent = "Libraries", required_libraries = ["Support"])
    ctx.library(ctx, name = "XRay", parent = "Libraries", required_libraries = ["Support", "Object"])
    ctx.group(ctx, parent = "$ROOT", name = "Projects")
    ctx.group(ctx, name = "Tools", parent = "$ROOT")
    ctx.tool(ctx, name = "bugpoint", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "CodeGen", "IRReader", "IPO", "Instrumentation", "Linker", "ObjCARC", "Scalar", "all-targets"])
    ctx.tool(ctx, required_libraries = ["AsmPrinter", "DebugInfoDWARF", "DWARFLinker", "MC", "Object", "CodeGen", "Support", "all-targets"], name = "dsymutil", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["AsmParser", "BitReader", "IRReader", "MIRParser", "TransformUtils", "Scalar", "Vectorize", "all-targets"], name = "llc", parent = "Tools")
    ctx.tool(ctx, name = "lli", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader", "Instrumentation", "Interpreter", "MCJIT", "Native", "NativeCodeGen", "SelectionDAG", "TransformUtils"])
    ctx.tool(ctx, name = "lli-child-target", parent = "lli")
    ctx.tool(ctx, name = "llvm-ar", parent = "Tools")
    ctx.tool(ctx, name = "llvm-as", parent = "Tools", required_libraries = ["AsmParser", "BitWriter"])
    ctx.tool(ctx, name = "llvm-bcanalyzer", parent = "Tools", required_libraries = ["BitReader", "BitstreamReader", "Support"])
    ctx.tool(ctx, required_libraries = ["AsmParser", "BitReader", "BitWriter"], name = "llvm-cat", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["all-targets", "MC", "MCDisassembler", "MCParser", "Support", "Symbolize"], name = "llvm-cfi-verify", parent = "Tools")
    ctx.tool(ctx, name = "llvm-cov", parent = "Tools", required_libraries = ["Coverage", "Support", "Instrumentation"])
    ctx.tool(ctx, name = "llvm-cvtres", parent = "Tools", required_libraries = ["Object", "Option", "Support"])
    ctx.tool(ctx, name = "llvm-diff", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader"])
    ctx.tool(ctx, required_libraries = ["Analysis", "BitReader"], name = "llvm-dis", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["DebugInfoDWARF", "Object"], name = "llvm-dwarfdump")
    ctx.tool(ctx, name = "llvm-dwp", parent = "Tools", required_libraries = ["AsmPrinter", "DebugInfoDWARF", "MC", "Object", "Support", "all-targets"])
    ctx.tool(ctx, required_libraries = ["Object", "Support", "TextAPI"], name = "llvm-elfabi", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["Object", "Support", "TextAPI"], name = "llvm-ifs", parent = "Tools")
    ctx.tool(ctx, name = "llvm-exegesis", parent = "Tools", required_libraries = ["CodeGen", "ExecutionEngine", "MC", "MCJIT", "Native", "NativeCodeGen", "Object", "Support"])
    ctx.tool(ctx, name = "llvm-extract", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "IRReader", "IPO"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["AsmParser", "BitReader", "IRReader", "Interpreter", "MCJIT", "NativeCodeGen", "Object", "SelectionDAG", "Native"], name = "llvm-jitlistener")
    ctx.tool(ctx, name = "llvm-jitlink", parent = "Tools", required_libraries = ["JITLink", "BinaryFormat", "MC", "Object", "RuntimeDyld", "Support", "all-targets"])
    ctx.tool(ctx, name = "llvm-link", parent = "Tools", required_libraries = ["AsmParser", "BitReader", "BitWriter", "IRReader", "Linker", "Object", "TransformUtils", "IPO"])
    ctx.tool(ctx, name = "llvm-lto", parent = "Tools", required_libraries = ["BitWriter", "Core", "IRReader", "LTO", "Object", "Support", "all-targets"])
    ctx.tool(ctx, name = "llvm-mc", parent = "Tools", required_libraries = ["MC", "MCDisassembler", "MCParser", "Support", "all-targets"])
    ctx.tool(ctx, name = "llvm-mca", parent = "Tools", required_libraries = ["MC", "MCA", "MCParser", "Support", "all-targets"])
    ctx.tool(ctx, required_libraries = ["BitReader", "BitWriter"], name = "llvm-modextract", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Option", "Support", "WindowsManifest"], name = "llvm-mt")
    ctx.tool(ctx, required_libraries = ["BitReader", "Object"], name = "llvm-nm", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["Object", "Option", "Support", "MC"], name = "llvm-objcopy", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["DebugInfoDWARF", "MC", "MCDisassembler", "MCParser", "Object", "all-targets", "Demangle"], name = "llvm-objdump", parent = "Tools")
    ctx.tool(ctx, name = "llvm-pdbutil", parent = "Tools", required_libraries = ["DebugInfoMSF", "DebugInfoPDB"])
    ctx.tool(ctx, name = "llvm-profdata", parent = "Tools", required_libraries = ["ProfileData", "Support"])
    ctx.tool(ctx, name = "llvm-rc", parent = "Tools", required_libraries = ["Option"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["BitReader", "IRReader", "all-targets"], name = "llvm-reduce")
    ctx.tool(ctx, name = "llvm-rtdyld", parent = "Tools", required_libraries = ["MC", "Object", "RuntimeDyld", "Support", "all-targets"])
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Object"], name = "llvm-size")
    ctx.tool(ctx, required_libraries = ["TransformUtils", "BitWriter", "Core", "IRReader", "Support"], name = "llvm-split", parent = "Tools")
    ctx.tool(ctx, parent = "Tools", required_libraries = ["Demangle", "Support"], name = "llvm-undname")
    ctx.tool(ctx, required_libraries = ["AsmParser", "BitReader", "BitWriter", "CodeGen", "IRReader", "IPO", "Instrumentation", "Scalar", "ObjCARC", "Passes", "all-targets"], name = "opt", parent = "Tools")
    ctx.tool(ctx, required_libraries = ["IRReader", "BitWriter", "Support"], name = "verify-uselistorder", parent = "Tools")
    ctx.group(ctx, name = "BuildTools", parent = "$ROOT")
    ctx.group(ctx, parent = "$ROOT", name = "UtilityTools")
    ctx.build_tool(ctx, name = "tblgen", parent = "BuildTools", required_libraries = ["Support", "TableGen", "MC"])
    ctx.library(ctx, name = "gtest_main", parent = "Libraries", required_libraries = ["gtest"])
    ctx.library(ctx, required_libraries = ["Support"], name = "gtest", parent = "Libraries")
    return ctx
