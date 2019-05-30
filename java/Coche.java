package Vehiculos;

public class Coche extends Vehiculos {
	
	//ATRIBUTOS DE COCHES
	private int plazas;
	private String comprador;
	
	//CONSTRUCTORES DE COCHES
	public Coche (String color, double precio, int plazas, int codigo) {
		this.color = color;
		this.precio = precio;
		this.plazas = plazas;
		this.codigo = codigo;
	}
	public int getPlazas() {
		return plazas;
	}
	public void setPlazas(int plazas) {
		this.plazas = plazas;
	}
	public String getComprador() {
		return comprador;
	}
	public void setComprador(String comprador) {
		this.comprador = comprador;
	}
	
	//METODOS PARA CREAR LA LISTA DE COCHES Y LA LISTA DE RESERVADOS
	public String Lista() {
		return "Coche num "+this.getCodigo()+": "+ this.getColor() + " a " + this.getPrecio() + "€ de precio y con " + this.getPlazas()+ " plazas" ;
	}
	public String Reservados() {
		return "Coche num "+this.getCodigo()+ ": Reservado a nombre de "+ this.getComprador();
	}
}
