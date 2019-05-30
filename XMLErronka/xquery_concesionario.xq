<html>
<body>
<h2 align="center">DATOS DE LOS VEHICULOS XML</h2>
<h3>Vehiculos</h3>
<table border="1">
  <tr>
  <td>id</td>
  <td>Tipo</td>
  <td>Puertas/Carga</td>
  <td>Maletero/Mercancia</td>
  <td>Matricula</td>
  <td>Color</td>
  <td>Asientos</td>
  <td>Precio</td>
  <td>Serie</td>
  <td>Stock</td>
  </tr>

{
for $vh in /concesionario/vehiculos/vehiculo
let $id := $vh/@id
let $tipo := $vh/clase/@tipo
let $tipodatos1 := $vh/clase/numPuertas
let $tipodatos2 := $vh/clase/carga
let $tipodatos3 := $vh/clase/capacidadMaletero
let $tipodatos4 := $vh/clase/tipoMercancia
let $matricula := $vh/matricula
let $color := $vh/Color
let $asientos := $vh/NumAsientos
let $precio := $vh/Precio
let $serie := $vh/numSerie/@num
let $stock := $vh/stock
order by $vh/id
return <tr><td>{data($id)}</td>
<td>{data($tipo)}</td>
<td>{data($tipodatos1)}{data($tipodatos2)}</td>
<td>{data($tipodatos3)}{data($tipodatos4)}</td>
<td>{data($matricula)}</td>
<td>{data($color)}</td>
<td>{data($asientos)}</td>
<td>{data($precio)}</td>
<td>{data($serie)}</td>
<td>{data($stock)}</td>
</tr>
}
</table>

<br/>
<br/>
<h3>Series</h3>
<table border="1">
  <tr>
  <td>Serie</td>
  <td>Marca</td>
  <td>Modelo</td>
  <td>Año de fabricacion</td>
  </tr>

{
for $sr in /concesionario/series/serie
let $num := $sr/@num
let $marca := $sr/marca
let $modelo := $sr/modelo
let $año := $sr/año_fabricacion
order by $sr/@num
return 
<tr>
<td>{data($num)}</td>
<td>{data($marca)}</td>
<td>{data($modelo)}</td>
<td>{data($año)}</td>
</tr>
}
</table>
</body>
</html>