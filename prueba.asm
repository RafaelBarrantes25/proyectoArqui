%include "io.mac"

.DATA
texto       db      "hola",0

.CODE
.STARTUP
        PutStr    texto
.EXIT