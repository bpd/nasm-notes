
; Note: set gdb to use intel syntax:
;
; set disassembly-flavor intel

BITS 64
global say_hello
extern printf

msg: db 'Hello from NASM!',10,0  ; terminated string with newline

SECTION .text             ; win64 linking doesn't work if symbol is not
                          ; defined in .text section

say_hello:
  
  push rbp      ; save the current base point
  mov  rbp,rsp  ; setup stack frame
  sub  rsp, 32  ; create Register Parameter Area
                ; 
  
  ; printf("Hello from NASM!\n")
  mov  rcx, msg ; 
  call printf   ; call 
  
  add  rsp, 32  ; clean up Register Parameter Area
  pop  rbp
  
  ret
