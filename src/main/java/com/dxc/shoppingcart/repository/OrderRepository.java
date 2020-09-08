package com.dxc.shoppingcart.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dxc.shoppingcart.entity.Order;
@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

}
