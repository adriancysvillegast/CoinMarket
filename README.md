# CoinMarket
This app is a test to get a job as iOS developer on SoyMomo

la app cuanta con un table view en el cual se mostraran los datos obtenidos de la api (https://coinmarketcap.com) en el endpoint "cryptocurrency/listings/latest?" esto con al finalidad de en primera instancia mostrar el name icon, price y fecha de la ultima actualización. 
En la vista principal cuyo controlador lleva por nombre “CoinsListViewController.swift” se agregaron UIActivityIndicatorView para mostrar un spinner cuando la toma de data se este descargando como también se agrego un UIBarButtonItem para refrescar la data cada que se el usuario lo desee.

![Simulator Screen Recording - iPhone 11 Pro Max - 2022-07-27 at 14 44 25](https://user-images.githubusercontent.com/81894293/181348564-62ec0f64-5fcc-47ff-b419-6f48cf293b31.gif)

Al realizar un click sobre cualquiera de las celdas se mostrar una vista con los detalles faltantes de la cripto moneda seleccionada. 
![Simulator Screen Recording - iPhone 11 Pro Max - 2022-07-27 at 14 45 06](https://user-images.githubusercontent.com/81894293/181348653-545c3eb2-e03d-4cf7-92a1-d556480d64b9.gif)

Esta pequeña app que tiene como finalidad demostrar a los reclutadores mi conocimiento en swift, ya que cuenta con testing del servicio a la API, vistas programáticas para evitar el uso de xibs o storyBoards y se desarrollo con el patron de arquitectura MVVM.

Requerimientos que no se cumplieron :
Push notification: este requerimiento no se realizo por falta de un dispositivo adecuado. Actualmente solo cuento con una Mac del 2015 y un iPhone 11 y no cuento con el adaptador para poder realizar la conexión por usb y correr la app en mi dispositivo. 

Nota: apesar de que la app se entrego dias antes de la fecha solicitadas considero cumple con parte de los requerimientos solicitados Rest API, Testing, vista por código.

Posibles update: 
Considero que el siguiente update seria realizar 4 vistas 2 de ellas destinadas al logIn y Sign Up las otras destinadas a elaborar una lista y formulario para la asignación de notificaciones.  Ejemplo el usuario desea crear una nueva alerta para que cada que el bitcoin suba mas de 40k se active una notificación. 
![Screen Shot 2022-07-27 at 2 46 51 PM](https://user-images.githubusercontent.com/81894293/181348962-da26490f-05b8-44f8-a3ca-5064a46206e1.png)
