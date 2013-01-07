
; Note: set gdb to use intel syntax:
;
; set disassembly-flavor intel

BITS 64
default rel

global _say_hello
extern _printf

msg: db 'Hello from NASM!',10,0  ; terminated string with newline

SECTION .text             ; win64 linking doesn't work if symbol is not
                          ; defined in .text section

_say_hello:
  
  push rbp      ; save the current base point
  mov  rbp,rsp  ; setup stack frame
  ;sub  rsp, 32  ; create Register Parameter Area
                ; 
  
  ; printf("Hello from NASM!\n")
  lea rdi, [msg]  ; load the effective address of msg at runtime
  ;mov  rcx, rax       ; 
  call _printf   ; call 
  
  ;add  rsp, 32  ; clean up Register Parameter Area
  pop  rbp
  
  ret
