package it.unisa;
import java.util.ArrayList;
import java.util.List;



public class Cart {

	private List<CartProduct> prodotti;
	
	public Cart() {
		prodotti = new ArrayList<CartProduct>();
	}
	
	public synchronized int DammiNumeroTotaleProdotti() {
		int somma = 0;
		for(int i=0; i<prodotti.size(); i++) {
			somma+=prodotti.get(i).getPezzi();
		}
		return somma;
	}
	
	public synchronized String DammiTutteLeDescrizioni() {
		String d = "";
		for(int i=0; i<prodotti.size(); i++) {
			d+=" "+prodotti.get(i).getDescrizione(i+1)+"\n";
		}
		return d;
	}
	
	public synchronized float DammiCostoTotaleCarrello() {
		float somma = 0;
		for(int i=0; i<prodotti.size(); i++) {
			somma+=prodotti.get(i).Costototale();
		}
		return somma;
	}
	
	public synchronized void addProduct(CartProduct cart) {
		CartProduct order;
        for(int i=0; i<prodotti.size(); i++) {
          order = prodotti.get(i);
          if (order.getIDProdotto().equals(cart.getIDProdotto())) {
              if(order.getPezzi()<cart.getDisponibilità())
            order.incrementa();
            return;
          }

  }
        prodotti.add(cart);
  }

public void deleteProduct(CartProduct cart) {
     CartProduct order;
        for(int i=0; i<prodotti.size(); i++) {
          order = prodotti.get(i);
          if (order.getIDProdotto().equals(cart.getIDProdotto())) {
              if(order.getPezzi()>0)
            order.decrementa();
              else
                  order.cancellaOrdine();;
            return;
          }
        }
}
public synchronized void addItem(String itemID) {
	CartProduct order;
    for(int i=0; i<prodotti.size(); i++) {
      order = (CartProduct)prodotti.get(i);
      if (order.getIDProdotto().equals(itemID)) {
        order.setPezzi(order.getPezzi()+1);
        prodotti.add(order);
      }
    }
    
  }

		public synchronized void setNumOrdered(String itemID,int numOrdered) {
			CartProduct order;
		for(int i=0; i<prodotti.size(); i++) {
		order = (CartProduct)prodotti.get(i);
		if (order.getIDProdotto().equals(itemID)) {
		if (numOrdered <= 0) {
			prodotti.remove(i);
		} else {
		order.setPezzi(numOrdered);;
		}
		return;
		}
		}
		}



	public List<CartProduct> getProducts() {
		return  prodotti;
	}
}