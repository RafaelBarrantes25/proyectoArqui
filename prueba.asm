%include "io.mac"

.DATA
        inicio1             db      "Bienvenido a Quién Quiere Ser Millonario",0
        nombreDelArchivo    db      "preguntasDelProyecto",0
        tamañoDelBuffer     EQU     4096

.UDATA
        buffer              resb     4096      ;Reserva para la lectura
        descriptorArchivo   resd     1         ;Descriptor del archivo, información importante
        bytesLeídos         resd     1
        punterosALíneas     resd     512
.CODE
.STARTUP
        ;Abre archivo
        mov     eax       5                    ;Es el código de abrir el archivo
        mov     ebx       nombreDelArchivo     ;Para ver cuál archivo va a abrir
        mov     ecx       0                    ;Read only
        mov     edx       0                    ;Permisos dan igual
        int     0x80                           ;Hace un interrupt
        mov     [descriptorArchivo],eax                        ;Mueve al ebp el file descriptor para guardarlo
        ;lee archivo
        mov     eax,3                          ;system call 3 lee archivo
        mov     ebx,[descriptorArchivo]
        mov     ecx, buffer
        mov     edx, tamañoDelBuffer
        int     0x80                           ;Interrupción para que lea el archivo
        mov     [bytesLeídos], eax
        ;cerrar archivo
        mov     eax, 6                         ;LLamada al sistema
        mov     ebx,[descriptorArchivo]
        int     0x80

        ;Parser según \n

        mov     esi, buffer
        mov     edi, punterosALíneas
        mov     ecx, [bytesLeídos]
        mov     [edi], esi
        add     edi, 4

.EXIT