package com.shop.computer.Controller;

import com.shop.computer.Entity.Product;
import com.shop.computer.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/produkty")
public class ProductsController {

    @Autowired
    private ProductService productService;

    @GetMapping("/komputery")
    public String listComputers(Model theModel) {
        List<Product> theProducts = productService.getComputers();
        theModel.addAttribute("products", theProducts);
        return "products";
    }

    @GetMapping("/procesory")
    public String listCPU(Model theModel) {
        List<Product> theProducts = productService.getCPU();
        theModel.addAttribute("products", theProducts);
        return "products";
    }

    @GetMapping("/plyty_glowne")
    public String listMBoard(Model theModel) {
        List<Product> theProducts = productService.getMBoard();
        theModel.addAttribute("products", theProducts);
        return "products";
    }

    @GetMapping("/karty_graficzne")
    public String listGPU(Model theModel) {
        List<Product> theProducts = productService.getGPU();
        theModel.addAttribute("products", theProducts);
        return "products";
    }

    @GetMapping("/dyski")
    public String listDrive(Model theModel) {
        List<Product> theProducts = productService.getDrive();
        theModel.addAttribute("products", theProducts);
        return "products";
    }

    @GetMapping("/ram")
    public String listRAM(Model theModel) {
        List<Product> theProducts = productService.getRAM();
        theModel.addAttribute("products", theProducts);
        return "products";
    }

    @GetMapping("/dodaj")
    public String addToCart(@RequestParam("productId") int theId) {

        Product product = productService.getProduct(theId);
        productService.addToCart(product);

        return "redirect:/koszyk";
    }

    @PostMapping("/zamow")
    public String order() {
        productService.order();
        return "redirect:/zamowienia";
    }
}
