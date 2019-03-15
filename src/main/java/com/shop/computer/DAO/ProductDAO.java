package com.shop.computer.DAO;

import com.shop.computer.Entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Repository
public class ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;
    float price;

    public List<Product> getProducts() {

        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("from com.shop.computer.Entity.Product");
        List<Product> products = query.list();

        return products;
    }

    public List<Product> getComputers() {

        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery("from com.shop.computer.Entity.Product WHERE category=:computer ORDER BY price");
        query.setParameter("computer", "computer");
        List<Product> products = query.list();

        return products;
    }

    public List<Product> getCPU() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.Product WHERE category=:cpu ORDER BY price");
        query.setParameter("cpu", "cpu");
        List<Product> products = query.list();

        return products;
    }

    public List<Product> getGPU() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.Product WHERE category=:gpu ORDER BY price");
        query.setParameter("gpu", "gpu");
        List<Product> products = query.list();

        return products;
    }

    public List<Product> getMBoard() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.Product WHERE category=:mboard ORDER BY price");
        query.setParameter("mboard", "mboard");
        List<Product> products = query.list();

        return products;
    }

    public List<Product> getDrive() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.Product WHERE category=:drive ORDER BY price");
        query.setParameter("drive", "drive");
        List<Product> products = query.list();

        return products;
    }

    public List<Product> getRAM() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.Product WHERE category=:ram ORDER BY price");
        query.setParameter("ram", "ram");
        List<Product> products = query.list();

        return products;
    }

    public Product getProduct(int theId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Product theProduct = currentSession.get(Product.class, theId);
        return theProduct;
    }

    public void addToCart(Product product) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        Session currentSession = sessionFactory.getCurrentSession();
        Query getName = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE username=:username");
        getName.setParameter("username", currentPrincipalName);
        List<User> users = getName.list();

        Query getCart = currentSession.createQuery(
                "from com.shop.computer.Entity.Cart WHERE user_id=:uid");
        getCart.setParameter("uid", users.get(0).getId());
        List<Cart> carts = getCart.list();

        if(carts.isEmpty()) {
            Cart cart = new Cart();
            cart.setUser(users.get(0));
            currentSession.save(cart);
            getCart = currentSession.createQuery(
                    "from com.shop.computer.Entity.Cart WHERE user_id=:uid");
            getCart.setParameter("uid", users.get(0).getId());
            carts = getCart.list();
        }

        CartSpot cart = new CartSpot();

        Query getSpot = currentSession.createQuery(
                "from com.shop.computer.Entity.CartSpot WHERE cart_id=:cartId AND product_id=:prodId");
        getSpot.setParameter("cartId", carts.get(0).getId());
        getSpot.setParameter("prodId", product.getId());

        if(getSpot.list().isEmpty()) {
            cart.setCart(carts.get(0));
            cart.setProduct(product);
            cart.setQuantity(1);
            currentSession.save(cart);
        } else {
            cart.setCart(carts.get(0));
            cart.setProduct(product);
            Query getQuantity = currentSession.createQuery(
                    "from com.shop.computer.Entity.CartSpot WHERE cart_id=:cartId AND product_id=:prodId");
            getQuantity.setParameter("cartId", carts.get(0).getId());
            getQuantity.setParameter("prodId", product.getId());
            List<CartSpot> myList = getQuantity.list();
            cart.setQuantity(myList.get(0).getQuantity()+1);

            Query deleteItems = currentSession.createQuery(
                    "DELETE from com.shop.computer.Entity.CartSpot WHERE cart_id=:cartId AND product_id=:prodId");
            deleteItems.setParameter("cartId", carts.get(0).getId());
            deleteItems.setParameter("prodId", product.getId());
            deleteItems.executeUpdate();

            currentSession.save(cart);
        }
    }

    public void order() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        Session currentSession = sessionFactory.getCurrentSession();
        Query getName = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE username=:username");
        getName.setParameter("username", currentPrincipalName);
        List<User> users = getName.list();

        Query getCart = currentSession.createQuery(
                "from com.shop.computer.Entity.Cart WHERE user_id=:uid");
        getCart.setParameter("uid", users.get(0).getId());
        List<Cart> carts = getCart.list();

        Query getSpot = currentSession.createQuery(
                "from com.shop.computer.Entity.CartSpot WHERE cart_id=:cartId");
        getSpot.setParameter("cartId", carts.get(0).getId());

        List<CartSpot> cartSpot = getSpot.list();
        List<Ordered> ordered = new LinkedList<>();

        Order order = new Order();
        Date date = new java.util.Date(Calendar.getInstance().getTime().getTime());

        price = 0;

        if(cartSpot.size()>0) {
            for (int i = 0; i < cartSpot.size(); i++) {
                Product product = cartSpot.get(i).getProduct();
                int quantity = cartSpot.get(i).getQuantity();
                price = price + ((cartSpot.get(i).getProduct().getPrice()) * quantity);
                Ordered cache = new Ordered();
                cache.setOrder(order);
                cache.setProduct(product);
                cache.setQuantity(cartSpot.get(i).getQuantity());
                ordered.add(cache);
                currentSession.save(cache);
            }

            order.setUser(users.get(0));
            order.setOrdered(ordered);
            order.setDate(date);
            order.setPrice(price);
            currentSession.save(order);

            Query deleteCart = currentSession.createQuery(
                    "DELETE from com.shop.computer.Entity.CartSpot WHERE cart_id=:cartId");
            deleteCart.setParameter("cartId", carts.get(0).getId());
            deleteCart.executeUpdate();
        }
    }

    public String addProduct(Product product) {
        Session currentSession = sessionFactory.getCurrentSession();
            currentSession.saveOrUpdate(product);
            return "redirect:/admin/produkty";
    }

    public String deleteProduct(Product product) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(product);
        return "redirect:/admin/produkty";
    }
}
