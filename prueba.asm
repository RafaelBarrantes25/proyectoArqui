%include "io.mac"

.DATA
        inicio1             db      "Bienvenido a Quién Quiere Ser Millonario",0
        nombreDelArchivo    db      "preguntasDelProyecto",0

.UDATA
        buffer              resb     2048      ;Reserva para la lectura

.CODE
.STARTUP
        mov     eax       5                    ;Es el código de abrir el archivo
        mov     ebx       nombreDelArchivo     ;Para ver cuál archivo va a abrir
        mov     ecx       0                    ;Read only
        mov     edx       0                    ;Permisos dan igual
        int     0x80                           ;Hace un interrupt
        mov     ebp,eax                        ;Mueve al ebp el file descriptor para guardarlo
.EXIT