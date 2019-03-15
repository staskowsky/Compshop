package com.shop.computer.Service;

import com.shop.computer.DAO.UserDAO;
import com.shop.computer.Entity.CartSpot;
import com.shop.computer.Entity.Order;
import com.shop.computer.Entity.Ordered;
import com.shop.computer.Entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDAO userDAO;
    @Transactional
    public List<User> getUsers() { return userDAO.getUsers(); }
    @Transactional
    public void createUser(User user) {
        userDAO.createUser(user);
    }
    @Transactional
    public User getUser(int id) {
        return userDAO.getUser(id);
    }
    @Transactional
    public Order getOrder(int id) {
        return userDAO.getOrder(id);
    }
    @Transactional
    public void deleteOrder(Order order) {
        userDAO.deleteOrder(order);
    }
    @Transactional
    public void deleteUser(User user) {
        userDAO.deleteUser(user);
    }
    @Transactional
    public User getUserByUsername(String username) {
        return userDAO.getUserModel(username);
    }
    @Transactional
    public void saveUser(User user) {
        userDAO.saveUser(user);
    }
    @Transactional
    public void changePassword(User user) {
        userDAO.changePassword(user);
    }
    @Transactional
    public List<CartSpot> getItems(User user) {
        return userDAO.getItems(user);
    }
    @Transactional
    public List<Order> getOrders(User user) {
        return userDAO.getOrders(user);
    }
    @Transactional
    public List<Order> getAllOrders() {
        return userDAO.getAllOrders();
    }
    @Transactional
    public void deleteItem(int cartId) {
       userDAO.deleteItem(cartId);
    }
    @Transactional
    public List<Ordered> getOrdered(int id) {
        return userDAO.getOrdered(id);
    }
    @Transactional
    public void deleteCart(int userId) {
        userDAO.deleteCart(userId);
    }
    @Transactional
    public boolean checkIfUserExists(String username) {
        return userDAO.checkIfUserExists(username);
    }

}
