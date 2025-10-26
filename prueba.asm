%include "io.mac"

.DATA
texto       resb      "hola",0

.CODE
.STARTUP
        PutStr    texto
.EXIT