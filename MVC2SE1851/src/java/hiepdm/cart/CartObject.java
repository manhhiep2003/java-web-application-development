/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hiepdm.cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Hiep
 */
public class CartObject implements Serializable {

    private Map<String, Integer> items;

    public Map<String, Integer> getItems() {
        return items;
    }

    public boolean addItemToCart(String id) {
        boolean result = false;
        //1. Check exist and valid id
        if (id == null) {
            return result;
        }
        if (id.trim().isEmpty()) {
            return result;
        }
        //2. Check existed items - cart
        if (this.items == null) {
            this.items = new HashMap<>();
        }
        //3. Check existed item
        int quantity = 1;
        if (this.items.containsKey(id)) {
            quantity = this.items.get(id) + 1;
        }
        //4. Update items - cart
        this.items.put(id, quantity);
        result = true;
        return result;
    }

    public boolean removeItemFromCart(String id) {
        boolean result = false;
        //1. Check existed items - cart
        if (this.items != null) {
            //2. Check existed item
            if (this.items.containsKey(id)) {
                //3. Remove item
                this.items.remove(id);
                if (this.items.isEmpty()) {
                    this.items = null;
                }//Not need to check items - cart again if it is empty
                result = true;
            }//item has existed
        }//end items have existed
        return result;
    }
}
