# 项目结构

`myCPU/src` 文件夹下包含了 CPU 的全部源代码，其中 `top.sv` 作为顶层文件，`wrapper.v` 是封装 Xilinx IP 核必须的文件，可以去掉不要。

`looongson` 文件夹下面包含了一些 testbench 项目；`scripts` 文件夹下包含了用于运行测试的脚本。

# 端口定义

`myCPU/src` 文件夹下 `top.sv` 文件中的 `mycpu_top` 模块有 `ext_int` 接口作为外部中断输入（testbench 测试时全部连接 0），`aclk` 及 `aresetn` 为时钟及复位，`debug_` 开头的信号为调试输出，可以忽略。其余信号为 CPU 与外部通信所使用的 AXI 信号。

CPU 作为一个 AXI4 Master 与外部通信，其所有行为都通过这个 AXI 接口来体现。AXI4 规范中没有 wid 信号，但为了 AXI3 的兼容性，保留了 wid 信号，实际使用时其始终为 0。

# 文件列表

CPU 的代码在 `myCPU/src` 文件夹下

```
\.
├── aux_modules
│   ├── cp0.sv                    CP0 模块
│   └── tlb.sv                    TLB 模块
├── core
│   ├── alu.sv                    ALU 模块
│   ├── comparator.sv             比较器模块
│   ├── constants.svh             一些常量定义及控制信号声明
│   ├── count_bit.sv              用于处理 clo 和 clz 指令的 bit counter
│   ├── cpu.sv                    CPU 核心部分
│   ├── decoder.sv                指令解码器
│   ├── divider.v                 除法器
│   ├── dm.sv                     内存存取指令的处理模块
│   ├── forwardController.v       转发控制器
│   ├── grf.v                     寄存器堆
│   ├── im.sv                     取指控制器
│   ├── multiplier.v              乘法器
│   └── xalu.sv                   乘除法控制器
├── global.svh                    全局定义声明
├── memory_management             缓存模块
│   ├── axi读写字节问题.md
│   ├── cache_mem.sv              缓存内存
│   ├── cache_soc.sv              缓存模块顶层文件
│   ├── def.svh                   缓存常量定义
│   ├── dual_fifo_wrapper.sv      双端口 FIFO
│   ├── fifo_v3.sv                一个简单的同步 FIFO
│   ├── mem_read.sv               内存读取模块
│   ├── mem_write.sv              内存写入模块
│   ├── power_dcache.sv           数据缓存模块
│   └── power_icache.sv           指令缓存模块
├── top.sv                        CPU 顶层文件
└── wrapper.v                     用于将 CPU 包装成 Verilog 的文件，没有实际作用

```

# CPU 行为

CPU 启动时，会从 0xBFC00000 开始读取指令并逐个执行。

# 测试

若需要测试 CPU，请在 Vivado 中打开 `loooongson/soc_axi_func/run_vivado/mycpu_prj1/mycpu.xpr` 项目文件（该项目文件默认不包含 CPU 源码文件，请参考后面的命令添加），然后在 tcl 控制台中使用 `cd` 命令切换到存储库根目录所在位置，然后运行 `source scripts/import_files.tcl` 即可将 CPU 源代码文件导入项目。导入项目后，运行 `launch_simulation -simset sim_1` 即可启动仿真。仿真启动时会立即执行一个 `$finish` 命令停下，再手动点击一下 `run` 按钮就可以继续仿真。
