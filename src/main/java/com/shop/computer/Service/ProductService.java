package com.shop.computer.Service;

import com.shop.computer.DAO.ProductDAO;
import com.shop.computer.Entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Transactional
    public List<Product> getProducts() {
        return productDAO.getProducts();
    }
    @Transactional
    public List<Product> getComputers() {
        return productDAO.getComputers();
    }
    @Transactional
    public List<Product> getCPU() {
        return productDAO.getCPU();
    }
    @Transactional
    public List<Product> getGPU() {
        return productDAO.getGPU();
    }
    @Transactional
    public List<Product> getMBoard() {
        return productDAO.getMBoard();
    }
    @Transactional
    public List<Product> getDrive() {
        return productDAO.getDrive();
    }
    @Transactional
    public List<Product> getRAM() {
        return productDAO.getRAM();
    }
    @Transactional
    public Product getProduct(int theId) {
        return productDAO.getProduct(theId);
    }
    @Transactional
    public void addToCart(Product product) {
        productDAO.addToCart(product);
    }
    @Transactional
    public void order() {
        productDAO.order();
    }
    @Transactional
    public void addProduct(Product product) {
        productDAO.addProduct(product);
    }
    @Transactional
    public void deleteProduct(Product product) {
        productDAO.deleteProduct(product);
    }
}
