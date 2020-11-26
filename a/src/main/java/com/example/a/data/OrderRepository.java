package com.example.a.data;

import org.springframework.data.repository.CrudRepository;
import com.example.a.Order;
public interface OrderRepository extends CrudRepository<Order,Long> {

}
