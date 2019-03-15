package com.shop.computer.Controller;

import com.shop.computer.Entity.*;
import com.shop.computer.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class UsersController {

    @Autowired
    private UserService userService;

    /* ### create & edit user ### */

    @GetMapping("/rejestracja")
    public String addUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/zarejestruj")
    public String createUser(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            return "register";
        } else {
            if(userService.checkIfUserExists(user.getUsername())) {
                return "redirect:/zarejestruj/istnieje";
            } else {
                userService.createUser(user);
                return "redirect:/";
            }
        }
    }

    @PostMapping("/zapisz")
    public String saveUser(@ModelAttribute("user") User user) {
        userService.saveUser(user);
        return "index";
    }

    @GetMapping("/zarejestruj/istnieje")
    @ResponseBody
    public String userExists() {
        return "U&#380;ytkownik o podanej nazwie ju&#380; istnieje.";
    }

    @PostMapping("/zmien")
    public String changePassword(@ModelAttribute("user") User user) {
        userService.changePassword(user);
        return "index";
    }

    @GetMapping("/ustawienia")
    public String updateUser(Model theModel) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        userService.getUserByUsername(currentPrincipalName);
        User user = userService.getUserByUsername(currentPrincipalName);
        theModel.addAttribute("user", user);

        return "settings";
    }

    /* ### cart & order handling ### */

    @GetMapping("/koszyk")
    public String showCart(Model theModel) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        userService.getUserByUsername(currentPrincipalName);

        User user = userService.getUserByUsername(currentPrincipalName);

        List<CartSpot> myCart = userService.getItems(user);

        theModel.addAttribute("cart", myCart);

        return "cart";
    }

    @GetMapping("/koszyk/usun")
    public String deleteItem(@RequestParam("cartId") int cartId) {

        userService.deleteItem(cartId);

        return "redirect:/koszyk";
    }

    @GetMapping("/zamowienia")
    public String showOrders(Model theModel) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();

        userService.getUserByUsername(currentPrincipalName);

        User user = userService.getUserByUsername(currentPrincipalName);
        List<Order> orders = userService.getOrders(user);

        theModel.addAttribute("orders", orders);
        return "orders";
    }

    @GetMapping("/zamowienia/detale")
    public String showDetails(@RequestParam("orderId") int id, Model model) {
        List<Ordered> orderedList = userService.getOrdered(id);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        System.out.println("currentPrincipalName:" + currentPrincipalName);
        System.out.println("orderedList.get(0).getOrder().getUser().getUsername():" + orderedList.get(0).getOrder().getUser().getUsername());

        if(currentPrincipalName.equals(orderedList.get(0).getOrder().getUser().getUsername())) {
            model.addAttribute("ordered", orderedList);
            return "details";
        } else {
            return "redirect:/zamowienia";
        }

    }
}
