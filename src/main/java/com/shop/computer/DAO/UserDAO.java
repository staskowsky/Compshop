package com.shop.computer.DAO;

import com.shop.computer.Entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public List<User> getUsers() {

        Session currentSession = sessionFactory.getCurrentSession();
        Query<User> theQuery = currentSession.createQuery("FROM com.shop.computer.Entity.User");
        List<User> users = theQuery.getResultList();

        return users;
    }

    public String createUser(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        String username = user.getUsername();
        user.setEnabled(1);
        if(user.getPassword().equals(user.getChanger().getConfirmPassword())) {
            user.setPassword("{bcrypt}" + BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
            Authorities auth = new Authorities();
            auth.setUsername(username);
            Cart cart = new Cart();
            cart.setUser(user);
            auth.setAuthority("ROLE_USER");
            System.out.println("user.getchanger(): " + user.getChanger());
            currentSession.delete(user.getChanger());
            user.setChanger(null);
            currentSession.save(user);
            currentSession.save(auth);
            return "redirect:/";
        } else {
            return "register";
        }
    }

    public User getUser(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        User user = currentSession.get(User.class, id);
        return user;
    }

    public Order getOrder(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Order order = currentSession.get(Order.class, id);
        return order;
    }

    public void deleteUser(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Authorities> query = currentSession.createQuery("FROM com.shop.computer.Entity.Authorities WHERE username=:username");
        query.setParameter("username", user.getUsername());
        List<Authorities> auth = query.getResultList();
        for(int i=0;i<auth.size();i++) {
            currentSession.delete(auth.get(i));
        }
        currentSession.delete(user);
    }

    public void deleteOrder(Order order) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(order);
    }

    public void deleteCart(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Cart cart = currentSession.get(Cart.class, id);
        currentSession.delete(cart);
    }

    public User getUserModel(String myUsername) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE username=:myUsername");
        query.setParameter("myUsername", myUsername);
        List<User> users = query.list();
            User myUser = users.get(0);
            return myUser;
    }

    public void saveUser(User user) {
        Session currentSession = sessionFactory.getCurrentSession();

        String username = user.getUsername();

        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE username=:myUsername");
        query.setParameter("myUsername", username);
        List<User> users = query.list();

        Address address = users.get(0).getAddress();
        Personal personal = users.get(0).getPersonal();

        address.setZipcode(user.getAddress().getZipcode());
        address.setCity(user.getAddress().getCity());
        address.setStreet(user.getAddress().getStreet());
        address.setHouse(user.getAddress().getHouse());

        personal.setName(user.getPersonal().getName());
        personal.setSurname(user.getPersonal().getSurname());
        personal.setPhone(user.getPersonal().getPhone());

        currentSession.saveOrUpdate(users.get(0));
        currentSession.saveOrUpdate(address);
        currentSession.saveOrUpdate(personal);
    }

    public List<CartSpot> getItems(User user) {

        Session currentSession = sessionFactory.getCurrentSession();
        String username = user.getUsername();

        Query firstQuery = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE username=:myUsername");
        firstQuery.setParameter("myUsername", username);
        List<User> users = firstQuery.list();
        int id = users.get(0).getId();

        Query secondQuery = currentSession.createQuery(
                "from com.shop.computer.Entity.Cart WHERE user_id=:myId");
        secondQuery.setParameter("myId", id);
        List<Cart> carts = secondQuery.list();

        if(carts.isEmpty()) {
            Cart cart = new Cart();
            cart.setUser(user);
            currentSession.save(cart);

            Query thirdQuery = currentSession.createQuery(
                    "from com.shop.computer.Entity.Cart WHERE user_id=:myId");
            thirdQuery.setParameter("myId", id);
            carts = thirdQuery.list();
        }
        List<CartSpot> cartId = carts.get(0).getCartSpot();
        return cartId;
    }

    public void deleteItem(int cartId) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query deleteCart = currentSession.createQuery(
                "DELETE from com.shop.computer.Entity.CartSpot WHERE id=:cartId");
        deleteCart.setParameter("cartId", cartId);
        deleteCart.executeUpdate();
    }

    public List<Order> getOrders(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        String username = user.getUsername();

        Query firstQuery = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE username=:myUsername");
        firstQuery.setParameter("myUsername", username);
        List<User> users = firstQuery.list();
        int id = users.get(0).getId();

        Query secondQuery = currentSession.createQuery(
                "from com.shop.computer.Entity.Order WHERE user_id=:myId");
        secondQuery.setParameter("myId", id);
        List<Order> orders = secondQuery.list();

        for(int i=0;i<orders.size();i++) {
           try {
               orders.get(i).setPrice(Float.parseFloat(String.valueOf(orders.get(i).getPrice())));
           } catch (NumberFormatException e) {
               System.err.println("To nie liczba!");
           }
        }

        return orders;
    }

    public List<Order> getAllOrders() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.Order");
        List<Order> orders = query.list();

        for(int i=0;i<orders.size();i++) {
            try {
                orders.get(i).setPrice(Float.parseFloat(String.valueOf(orders.get(i).getPrice())));
            } catch (NumberFormatException e) {
                System.err.println("To nie liczba!");
            }
        }
        return orders;
    }

    public List<Ordered> getOrdered(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
            Query query = currentSession.createQuery("from com.shop.computer.Entity.Ordered WHERE order_id=:myId");
            query.setParameter("myId", id);
            List<Ordered> orderedList = query.list();
            return orderedList;
    }

    public void changePassword(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        int id = user.getId();

        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE id=:id");
        query.setParameter("id", id);
        List<User> users = query.list();
        String cache = users.get(0).getPassword().substring(8, 68);

        if((BCrypt.checkpw(user.getChanger().getOldPassword(), cache))
        && user.getChanger().getNewPassword().equals(user.getChanger().getConfirmPassword())) {
                users.get(0).setPassword("{bcrypt}" + BCrypt.hashpw(
                        user.getChanger().getNewPassword(), BCrypt.gensalt(12)));
                currentSession.saveOrUpdate(users.get(0));
                currentSession.delete(user.getChanger());
        }
    }

    public boolean checkIfUserExists(String username) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query query = currentSession.createQuery(
                "from com.shop.computer.Entity.User WHERE username=:myUsername");
        query.setParameter("myUsername", username);
        List<User> users = query.list();
        if(users.isEmpty()) {
            return false;
        } else {
            return true;
        }
    }
}
