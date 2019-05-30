package Vehiculos;

import java.util.ArrayList;
import java.util.Scanner;

public class Main extends Vehiculos{
	
	static Scanner sc = new Scanner(System.in);
	
	//ARRAY DE COCHES
	static ArrayList<Coche> coches = new ArrayList<Coche>();
	//ARRAY DE COCHES RESERVADOS
	static ArrayList<Coche> reservados = new ArrayList<Coche>();
	
	public static void main(String[] args) {
	    int opcion;
	    
	        do{
	            System.out.println("Menú:");
	            System.out.println(" 1. Añadir nuevo coche");
	            System.out.println(" 2. Ver lista de coches");
	            System.out.println(" 3. Buscar coche por color" );
	            System.out.println(" 4. Modificar coche");
	            System.out.println(" 5. Borrar coche");
	            System.out.println(" 6. Reservar coche");
	            System.out.println(" 7. Ver lista de reservados");
	            System.out.println(" 8. Eliminar un coche de los reservados");
	            System.out.println(" 9. Salir");
	            System.out.println("Introduzca opción:");
	            
	            opcion = sc.nextInt();
	            sc.nextLine();
	          
	            switch (opcion){
	                case 1:
	                    nuevoCoche(coches);
	                    break;	          
	                case 2:
	                	imprimeLista(coches);
	                    break;
	                case 3:
	                    System.out.println("Introduce un color:");
	                	String colorBuscar = sc.nextLine();
	                	buscarColor(colorBuscar);
	                    break;
	                case 4:
	                    System.out.println("Introduce el numero de coche:");
	                	int cocheModificar= sc.nextInt();
	                	sc.nextLine();
	                	modificarCoche(cocheModificar);
	                    break;
	                case 5:
	                	System.out.println("Introduce el numero de coche:");
	                	int borrarCoche = sc.nextInt();
	                    eliminarCoche(borrarCoche);
	                    break;
	                case 6:
	                	System.out.println("Introduce el numero de coche:");
	                	int reservadoCoche= sc.nextInt();
	                	sc.nextLine();
	                	reservaCoche(reservadoCoche);
	                	break;
	                case 7:
	                	imprimeReservas(reservados);
	                    break;
	                case 8:
	                	System.out.println("Introduce el numero de coche:");
	                	int borrarReserva = sc.nextInt();
	                    eliminarReserva(borrarReserva);
	                    break;
	                case 9:
	                	
	                    break;
	              
	                default:
	                    System.out.println("Opción incorrecta. Elija otra:");
	            } 
	        }while(opcion != 9);
	    }
	
	//METODO PARA AÑADIR COCHES
	  public static void nuevoCoche(ArrayList<Coche> coches){
	    
	        System.out.println("Introduzca color del coche:");
	        String color = sc.nextLine();
	        System.out.println("Introduzca precio del coche:");
	        double precio = sc.nextDouble();
	        System.out.println("Introduzca plazas del coche:");
	        int plazas= sc.nextInt();       
	        int codigo = coches.size()+1;

	        Coche coche = new Coche(color, precio, plazas, codigo);
	     
			coche.setColor(color);
			coche.setPrecio(precio);
			coche.setPlazas(plazas);
			coche.setCodigo(codigo);
			coches.add(coche);
			
	        }
	
	  //METODO PARA LISTAR LOS COCHES
	    public static void imprimeLista(ArrayList<Coche>coches){
	        System.out.println("COCHES: --> ");
	
	        for (Coche listado: coches){
	
	            System.out.println(" - " + listado.Lista());
	        }
	        }
	       
	    
	  //METODO PARA BUSCAR UN COCHE POR COLOR
	    public static void buscarColor(String color){
	    	 
	    	for (Coche mostrarCoche: coches) 
			{
			   if (mostrarCoche.getColor().equalsIgnoreCase(color)) {	
			           System.out.println(mostrarCoche.Lista());
			   }	
			}
	    }
	    
	  //METODO PARA MODIFICAR UN COCHE
	    public static void modificarCoche(int codigo) {
	    	
	    	for (Coche mostrarCoche: coches) 
			{
			   if (mostrarCoche.getCodigo()==codigo) {	
				   
			           System.out.println(mostrarCoche.Lista());
			           System.out.println("Color del coche:");
				       String color = sc.nextLine();			        
			           System.out.println("Precio del coche:");
			           double precio = sc.nextDouble();
			           System.out.println("Plazas del coche:");
			           int plazas = sc.nextInt();
			           coches.get(codigo-1).setColor(color);
			           coches.get(codigo-1).setPrecio(precio);
			           coches.get(codigo-1).setPlazas(plazas);		       
			   }	
			}
	    }
	    
	  //METODO PARA ELIMINAR UN COCHE  
	    public static void eliminarCoche(int codigo) {
			
	 			for(int i= 0; i< coches.size(); i++) {
	 				if( coches.get(i).getCodigo()==codigo) {
	 					coches.remove(i);
	 					System.out.println("El coche num" +codigo+ " ha sido eliminado");	 		
	 				 					 		
	 				}
	 			}
	 			//COMPRUEBA SI ESE COCHE ESTABA RESERVADO Y LO ELIMINA TAMBIEN DE ESA LISTA
	 			for(int z=0; z<reservados.size(); z++) {
	 				if(  reservados.get(z).getCodigo()==codigo) {
	 					reservados.remove(z);
	 			}
	 		}	//AL ELIMINAR UN COCHE REINICIAMOS LOS CODIGOS DE LOS COCHES PARA QUE COINCIDAN CON LOS DE LOS ARRAYS, 
	 			//YA QUE AL ELIMINAR UN COCHE DE LA POSICION 0, EL DE LA POSICION 1 BAJARA AL 0 Y NO PODREMOS USAR EL CODIGO QUE TENIA ANTES
	 			for( codigo= 0; codigo< coches.size(); codigo++) {
	 				coches.get(codigo).setCodigo(codigo+1);
	 				   }	
	 			
	    }
	  //METODO PARA RESERVAR UN COCHE
	    public static void reservaCoche(int codigo) {
	    	for(int i= 0; i< coches.size(); i++) {
 				if( coches.get(i).getCodigo()==codigo) {
 					reservados.add(coches.get(i));
 					System.out.println("Introduzca nombre del comprador:");
 					String comprador = sc.nextLine();
 					coches.get(codigo-1).setComprador(comprador);
 					System.out.println("El coche num " +codigo+ " ha sido reservado a nombre de " +comprador);
 				}
	    	
	    	}
	    }
	 //METODO PARA LISTAR RESERVADOS   
	    public static void imprimeReservas(ArrayList<Coche>reservados){
	        System.out.println("COCHES RESERVADOS: --> ");
	
	        for (Coche listado: reservados){
	
	            System.out.println(" - " + listado.Reservados());
	        }
	        }
	       
	 //METODO PARA ELIMINAR UNA RESERVA 
	    public static void eliminarReserva(int codigo) {
			
	 			for(int i= 0; i< reservados.size(); i++) {
	 				if( reservados.get(i).getCodigo()==codigo) {
	 					reservados.remove(i);
	 					System.out.println("El coche num" +codigo+ " ha sido eliminado de los reservados");
	 				}
	 			}
	 			
	 		}
}

