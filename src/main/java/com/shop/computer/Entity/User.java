package com.shop.computer.Entity;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    @NotBlank(message = "Pole nie może być puste.")
    @Size(min=3, max=45, message = "Login musi zawierać minimum 3 znaki.")
    @Column(name = "username")
    private String username;
    @NotBlank(message = "Pole nie może być puste.")
    @Size(min=5, message = "Hasło musi zawierać minimum 5 znaków.")
    @Column(name = "password")
    private String password;
    @Column(name = "enabled")
    private int enabled;
    @Column(name = "email")
    @NotBlank(message = "Pole nie może być puste.")
    @Email(message = "Wprowadź poprawny adres e-mail.")
    private String email;
    @Column(name = "personal_id", insertable = false, updatable = false)
    private int personalId;
    @Column(name = "address_id", insertable = false, updatable = false)
    private int addressId;

    @OneToOne(mappedBy = "user", cascade = {CascadeType.ALL})
    private Cart cart;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "personal_id")
    private Personal personal;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "address_id")
    private Address address;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
    private PasswordChanger changer;

    @OneToMany(mappedBy = "user", cascade = {CascadeType.ALL}, fetch=FetchType.LAZY)
    private List<Order> order;

    public Personal getPersonal() {
        return personal;
    }

    public void setPersonal(Personal personal) {
        this.personal = personal;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }


    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", enabled=" + enabled +
                ", email='" + email + '\'' +
                ", personalId=" + personalId +
                ", addressId=" + addressId +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getEnabled() {
        return enabled;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPersonalId() {
        return personalId;
    }

    public void setPersonalId(int personalId) {
        this.personalId = personalId;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public User() {
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public PasswordChanger getChanger() {
        return changer;
    }

    public void setChanger(PasswordChanger changer) {
        this.changer = changer;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }
}
