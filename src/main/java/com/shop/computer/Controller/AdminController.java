package com.shop.computer.Controller;

import com.shop.computer.Entity.Order;
import com.shop.computer.Entity.Product;
import com.shop.computer.Entity.User;
import com.shop.computer.Entity.Ordered;
import com.shop.computer.Service.ProductService;
import com.shop.computer.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;

    @GetMapping("")
    public String adminHome() {
        return "redirect:/admin/zamowienia";
    }

    /* ### users handling ### */

    @GetMapping("/uzytkownicy")
    public String adminUsers(Model theModel) {
        List<User> users = userService.getUsers();
        theModel.addAttribute("users", users);
        return "adminpanel/users";
    }

    @GetMapping("/uzytkownicy/usun")
    public String deleteUser(@RequestParam("userId") int id) {
        User user = userService.getUser(id);
        System.out.println("user: " + user);
        userService.deleteUser(user);
        return "redirect:/admin/uzytkownicy";
    }

    /* ### products handling ### */

    @GetMapping("/produkty")
    public String adminProducts(Model model) {
        List<Product> products = productService.getProducts();
        model.addAttribute("products", products);
        return "adminpanel/products";
    }


    @GetMapping("produkty/dodaj")
    public String saveProduct(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        return "adminpanel/add";
    }

    @PostMapping("produkty/dodano")
    public String addedProduct(@Valid @ModelAttribute("product") Product product, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            return "adminpanel/add";
        } else {
            productService.addProduct(product);
            return "redirect:/admin/produkty";
        }
    }

    @GetMapping("/produkty/edytuj")
    public String editProduct(@RequestParam("productId") int id, Model model) {
        Product product = productService.getProduct(id);
        model.addAttribute("product", product);
        return "adminpanel/add";
    }

    @GetMapping("/produkty/usun")
    public String deleteProduct(@RequestParam("productId") int id) {
        Product product = productService.getProduct(id);
        productService.deleteProduct(product);
        return "redirect:/admin/produkty";
    }

    /* ### orders handling ### */

    @GetMapping("/zamowienia")
    public String adminOrders(Model model) {
        List<Order> orders = userService.getAllOrders();
        model.addAttribute("orders", orders);
        return "adminpanel/orders";
    }

    @GetMapping("/zamowienia/detale")
    public String orderDetails(@RequestParam("orderId") int id, Model model) {
        List<Ordered> ordered = userService.getOrdered(id);
        model.addAttribute("ordered", ordered);
        return "adminpanel/ordered";
    }

    @GetMapping("/zamowienia/usun")
    public String deleteOrder(@RequestParam("orderId") int id) {
        Order order = userService.getOrder(id);
        userService.deleteOrder(order);
        return "redirect:/admin/zamowienia";
    }
}
