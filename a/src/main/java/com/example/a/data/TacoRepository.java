package com.example.a.data;

import org.springframework.data.repository.CrudRepository;
import com.example.a.Taco;

public interface TacoRepository extends CrudRepository<Taco,Long> {

}
