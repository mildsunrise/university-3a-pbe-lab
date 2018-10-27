# PBE

Codi pel projecte de PBE QT2018, grup 13 (audiovisuals), in-campus AV system.

Participants:

- Enric Erra Bes
- Pablo Oteo de Prado
- Ignasi Nogueiras Marco
- Alba Mendez Orero 


## Requeriments del sistema

 - Windows, MacOS X, Linux.
 - Tarja de so que pugui operar a 48kHz, 16 bits, mono i estèreo.

## Codi

Es fa servir **Matlab 2018B**.  
No es permet l'us de toolboxes al codi.  
L'aplicació es compilarà abans de ser entregada.

## Estructura

 * `src`: Codi font de l'aplicació.

   * `adc`: Mòdul de configuració i interacció amb la targeta de so.

   * `analyzer`: Codi de l'aplicació **analitzador d'amplificadors**.

   * `equalizer`: Codi de l'aplicació **equalitzador**.

   * `simulator`: Codi de l'aplicació **simulador d'amplificador classe D**.

   * `util`: Funcions genèriques per al seu us en la resta del codi.
     * `dsp`: Funcions de processament de senyal.
     * `misc`: Altres utilitats.

 * `assets`: Fitxers auxiliars de l'aplicació (no codi). Imatges, icones, fonts, etc.

 * `tests`: Mostres de senyal i scripts per provar diverses parts del codi.

   * `latency`: Scripts i mostres relatives a la mesura de retard (latència).
