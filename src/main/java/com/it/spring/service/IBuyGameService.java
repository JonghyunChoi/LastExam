package com.it.spring.service;

public interface IBuyGameService {
    public void buy(String name, int price, int number);
    public void refund(String name, int number);
}
