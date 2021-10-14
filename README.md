# Allegati tesi Filtro di Kalman
Nella cartella Codici si trovano tutti i file relativi a quanto discusso nella tesi. Tutti gli script possono essere eseguiti così come si trovano. Di seguito alcune indicazioni specifiche per alcuni di essi.

## Esempio temperatura
Nella cartella *Esempio temperatura* si trova il file Temperatura.mlx relativo all'esempio 2.1.1. È sufficiente eseguire lo script per visualizzarne i risultati.

## Esempio moto parabolico in 2 dimensioni
Nella cartella *Esempio parabola* si trova il file Parabola.mlx relativo all'esempio 2.5. È sufficiente eseguire lo script per visualizzarne i risultati.

## Driving Scenario Designer
Nella cartella *Driving Scenario Designer* si trovano i file relativi alla simulazione mediante il medesimo pacchetto. Il file Driving_Scenario_Designer.mlx è lo script che consente l'applicazione del filtro, il file Dati_simulazione.mat contiene i dati dei sensori relativi al tracciato contenuto nel file Simulazione.mat, che deve essere aperto col pacchetto Driving Scenario Designer.
Per cambiare il tracciato e/o i sensori è sufficiente aprire il pacchetto Driving Scenario Designer lanciando il comando:
```
drivingScenarioDesigner
```
Una volta impostato tutto ed eseguita la simulazione sarà sufficiente esportare i dati avendo cura di rinominare la variabile **INS_1**. Ad esportazione conclusa è necessario salvare la struttura dati presente nel workspace, nominata appunto INS_1, inserendo un nome qualsiasi. Il nome scelto dovrà essere usato per importare il file all'inizio dello script.

## Simulink
Nella cartella simulink sono presenti i file relativi ai modelli in Simulink. I file .slx sono i due modelli mentre lo script KF_Simulink.m consente la realizzazione dei grafici.
Tutti i parametri possono essere modificati nei rispettivi blocchi, aprendo i file .slx. Per scegliere quale file simulare basta inserire il nome corrispondente ad inizio e fine script. Per la traittetoria è necessario creare due vettori nel workspace, uno relativo alla velocità e uno all'orientamento dello sterzo. Il formato dei vettori è [xx tt], dove xx è la velocità o l'orientamento, a seconda del caso e tt è il tempo. Se non vengono creati i due vettori viene mantenuta la traiettoria di default.

## EKF
Sempre all'interno della cartella Simulink vi è la cartella EFK contenente lo script, EKF.m, e il modello EKF_sim.slx. Gli altri due file contengono delle funzioni utilizzate dal modello per rappresentare il comportamento dei sensori. Le considerazioni sono analoghe a quelle degli altri modelli Simulink.
